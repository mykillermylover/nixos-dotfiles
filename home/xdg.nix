{ ... }:
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "x-terminal-emulator" = "kitty.desktop";
      "application/x-terminal-emulator" = "kitty.desktop";
    };
  };

  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=kitty
    TerminalEmulatorDismissed=true
  '';
}
