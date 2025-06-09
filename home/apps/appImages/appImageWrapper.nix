{
  version,
  pname,
  name,
  src,
  pkgs,
  ...
}:
let
  appimageContents = pkgs.appimageTools.extractType2 { inherit pname src version; };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  profile = ''
    export NIXOS_OZONE_WL=1
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
  '';
}
