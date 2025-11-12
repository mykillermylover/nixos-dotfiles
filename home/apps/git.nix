{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    signing = {
      format = "openpgp";
      signByDefault = true;
      key = "447A5AC58BB40C5A";
      signer = "${pkgs.gnupg}/bin/gpg";
    };

    settings = {
      init.defaultBranch = "main";
      user = {
        name = "makulenko";
        email = "makulenko@rvision.ru";
      };
    };
  };
}
