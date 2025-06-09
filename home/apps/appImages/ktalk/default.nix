{ lib, pkgs, ... }@inputs:
let
  ktalk = import ../appImageWrapper.nix rec {
    version = "3.1.0";
    pname = "ktalk";
    name = "ktalk${version}x86_64";
    src = ./${name}.AppImage;
    inherit pkgs;
  };
in
{
  home.packages = lib.singleton ktalk;
}
