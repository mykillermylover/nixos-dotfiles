{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;
      experimentalFeatures = true;

      theme = spicePkgs.themes.burntSienna;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle

        playlistIcons
      ];
    };
}
