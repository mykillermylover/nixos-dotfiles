{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mihail = {
    isNormalUser = true;
    description = "Mihail";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "dialout" # For arduino
    ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };
}
