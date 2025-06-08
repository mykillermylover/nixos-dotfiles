{ pkgs, inputs, ... }:
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
