{ ... }:
{
  systemd.user = {
    enable = true;

    services.mbsync.unitConfig.After = [ "sops-nix.service" ];
  };
}
