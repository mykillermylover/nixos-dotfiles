{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "makulenko";
    userEmail = "makulenko@rvision.ru";

    signing = {
      format = "openpgp";
      signByDefault = true;
      key = "447A5AC58BB40C5A";
      signer = "${pkgs.gnupg}/bin/gpg";
    };

    extraConfig = { 
      init.defaultBranch = "main";
    };
  };
}
