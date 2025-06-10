{ ... }:
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "x-terminal-emulator" = [ "kitty.desktop" ];
      "application/x-terminal-emulator" = [ "kitty.desktop" ];

      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };
}
