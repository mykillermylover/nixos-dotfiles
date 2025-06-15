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
      ];

      userSettings = {
        "git.confirmSync" = false;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'MesloLGS Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" = "'MesloLGS Nerd Font', monospace";
        "git.allowForcePush" = true;
        "projectManager.cacheProjectsBetweenSessions" = false;
        "projectManager.sortList" = "Name";
        "security.workspace.trust.untrustedFiles" = "open";
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [
                "nixfmt"
              ];
            };
            "options" = {
              "home-manager" = {
                "expr" =
                  "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []";
              };
              "nixos" = {
                "expr" = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos.options";
              };
            };
            "diagnostic" = {
              "suppress" = [
                "sema-extra-with"
              ];
            };
          };
        };
        "editor.tabSize" = 2;
      };
    };
  };
}
