{ ... }:
{
  programs.git = {
    enable = true;
    userName = "makulenko";
    userEmail = "makulenko@rvision.ru";

    signing = {
      format = "openpgp";
      signByDefault = true;
    };
  };
}
