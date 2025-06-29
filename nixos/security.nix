{ ... }:
{
  security = {
    pam.services = {
      sddm.enableGnomeKeyring = true;
      login.enableGnomeKeyring = true;
    };

    rtkit.enable = true;
  };
}
