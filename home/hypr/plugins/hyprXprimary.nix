{
  lib,
  fetchFromGitHub,
  gnumake,
  hyprland,
  hyprlandPlugins,
}:
hyprlandPlugins.mkHyprlandPlugin hyprland {
  pluginName = "hyprXPrimary";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "zakk4223";
    repo = "hyprXPrimary";
    rev = "main";
    hash = "sha256-oFYgJ8q8Ibgq99G/joZZtFzX0C5NPYPQCXvyvrO5vZY=";
  };

  # any nativeBuildInputs required for the plugin
  nativeBuildInputs = [ gnumake ];

  # set any buildInputs that are not already included in Hyprland
  # by default, Hyprland and its dependencies are included
  buildInputs = [ ];

  preBuild = ''
    export HOME="$PWD"
  '';

  meta = {
    homepage = "https://github.com/zakk4223/hyprXPrimary";
    description = "Primary XWayland display for Hyprland";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
