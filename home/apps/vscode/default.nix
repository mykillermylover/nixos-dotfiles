{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        alefragnani.project-manager
        gitlab.gitlab-workflow
        sumneko.lua
        eamodio.gitlens
        christian-kohler.path-intellisense

        pkief.material-icon-theme
        monokai.theme-monokai-pro-vscode
      ];

      userSettings = import ./userSettings.nix;
    };
  };
}
