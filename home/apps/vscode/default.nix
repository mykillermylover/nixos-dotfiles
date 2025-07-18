{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-marketplace; [
          jnoortheen.nix-ide
          alefragnani.project-manager
          gitlab.gitlab-workflow
          sumneko.lua
          eamodio.gitlens
          christian-kohler.path-intellisense
          ruschaaf.extended-embedded-languages
          arrterian.nix-env-selector
          mkhl.direnv
          mads-hartmann.bash-ide-vscode

          pkief.material-icon-theme
          monokai.theme-monokai-pro-vscode
        ])
        ++ (with pkgs.vscode-marketplace-release; [
          github.copilot
          github.copilot-chat
        ]);

      userSettings = import ./userSettings.nix;
    };
  };
}
