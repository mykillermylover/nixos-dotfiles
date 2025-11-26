# Sound fix for Huawei Matebook S14/16 D14/16. Mb other
# Codec: Codec: Conexant SN6140. Vendor id: 0x14f11f87
# Subsystem id: 0x19e53291

### This is a solution adapted for pipewire and more reliable in detecting plugged-in Jack
### Thanks to original solution: https://github.com/Smoren/huawei-ubuntu-sound-fix 

{ pkgs, ... }:

let
  huawei-sound-fix = pkgs.writeShellScript "huawei-sound-fix" /*bash*/''
    set -e

    # ensures script can run only once at a time
    pidof -o %PPID -x "$0" >/dev/null && {
      echo "Script $0 already running"
      exit 1
    }

    get_sound_card_index() {
      # searching card id
      awk '/sof-hda-dsp|sofhdadsp/ {print $1; exit}' /proc/asound/cards || true
    }

    card_index="$(get_sound_card_index)"
    if [ -z "$card_index" ]; then
      echo "sof-hda-dsp card is not found in /proc/asound/cards"
      exit 1
    fi

    hw_dev="/dev/snd/hwC''${card_index}D0"

    if [ ! -e "$hw_dev" ]; then
      echo "Device node $hw_dev not found"
      exit 1
    fi

    move_output() {
      # 0x16: Headphones Jack
      # 0x701: SET_CONNECT_SEL, "$1" - значение селектора
      hda-verb "$hw_dev" 0x16 0x701 "$1" >/dev/null 2>&1
    }

    move_output_to_speaker() {
      move_output 0x0001
    }

    move_output_to_headphones() {
      move_output 0x0000
    }

    switch_to_speaker() {
      move_output_to_speaker

      # enable speaker: 0x17 EAPD/BTL
      hda-verb "$hw_dev" 0x17 0x70C 0x0002 >/dev/null 2>&1

      # disable headphones via GPIO/EAPD на AFG (0x01)
      hda-verb "$hw_dev" 0x1 0x715 0x2 >/dev/null 2>&1


      amixer -c"''${card_index}" set Headphone mute >/dev/null 2>&1 || true
    }

    switch_to_headphones() {
      move_output_to_headphones

      # disable speaker
      hda-verb "$hw_dev" 0x17 0x70C 0x0000 >/dev/null 2>&1

      # pin output mode / enable / clear pin value на AFG (0x01)
      hda-verb "$hw_dev" 0x1 0x717 0x2 >/dev/null 2>&1
      hda-verb "$hw_dev" 0x1 0x716 0x2 >/dev/null 2>&1
      hda-verb "$hw_dev" 0x1 0x715 0x0 >/dev/null 2>&1

      amixer -c"''${card_index}" set Headphone unmute >/dev/null 2>&1 || true
    }

    jack_plugged() {
      # Reading headphone pin state 0x16 (Headphones Jack)
      local out
      out="$(hda-verb "$hw_dev" 0x16 0xF09 0 2>/dev/null)" || return 1

      # Get latest hex-value like 0x8XXXXXXX
      local val
      val="$(printf '%s\n' "$out" | grep -Eo '0x[0-9a-fA-F]+' | tail -n1)"

      # If not hex = no jack
      [ -n "$val" ] || return 1

      # Check high-order bit presence detect
      # shell: "(( val & 0x80000000 ))" doesnt work with string
      local num=$(( val ))
      if (( num & 0x80000000 )); then
        return 0   # Jack in
      else
        return 1   # Jack out
      fi
    }

    sleep 2  # даём аудиосистеме подняться
    old_status=0

    while true; do
      # Jack plugged = sound to headphones, not plugged = speaker
      if jack_plugged; then
        status=2
        move_output_to_headphones
      else
        status=1
        move_output_to_speaker
      fi

      if [ "$status" -ne "$old_status" ]; then
        case "$status" in
          1)
            echo "Headphones disconnected"
            switch_to_speaker
            ;;
          2)
            echo "Headphones connected"
            switch_to_headphones
            ;;
        esac
        old_status="$status"
      fi

      sleep 0.3
    done

  '';
in
{
  systemd.services.huawei-sound-fix = {
    description = "Keep Headphone unmuted on Huawei sof-hda-dsp";
    wantedBy = [ "default.target" ];

    after = [
      "pipewire.service"
      "wireplumber.service"
    ];

    path = with pkgs; [
      alsa-tools
      alsa-utils
      gawk
      procps
    ];

    serviceConfig = {
      ExecStart = huawei-sound-fix;
      Restart = "on-failure";
      RestartSec = 1;
    };
  };
}
