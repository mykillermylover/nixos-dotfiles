{ ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      # FNM Init
      set FNM_PATH "/home/mihail/.local/share/fnm"
      if [ -d "FNM_PATH" ]
        set PATH "FNM_PATH" $PATH
        fnm env | source
      end

      fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell fish | source
    '';

    shellInitLast = ''
      # Init nix-your-shell
      nix-your-shell fish | source

      # Change sudo prompt colors
      set -gx SUDO_PROMPT (echo -e "\033[34;1m[sudo]\033[0m \033[36;1mEnter password for %u:\033[0m ")

      # Fish + Done plugin integration
      set -U __done_kitty_remote_control 1
      set -U __done_kitty_remote_control_password kitty_fish_notifications_password
    '';

    interactiveShellInit = ''
      fastfetch
    '';

    shellAliases = {
      rmrf = "rm -rf";

      ls = "eza";

      cat = "bat";
    };
  };
}
