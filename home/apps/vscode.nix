{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = (with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      alefragnani.project-manager
      gitlab.gitlab-workflow
    ]) 
    ++
    (with pkgs.vscode-marketplace-release; [
      eamodio.gitlens
    ]);
  };
}
