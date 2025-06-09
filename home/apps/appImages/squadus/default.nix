{ lib, pkgs, ... }@inputs:
let
  squadus = import ../appImageWrapper.nix rec {
    version = "3.43.203";
    pname = "squadus";
    name = "Squadus_Linux_${version}_x86_64";
    src = ./${name}.AppImage;
    inherit pkgs;
  };
in
{
  home.packages = lib.singleton squadus;
}
