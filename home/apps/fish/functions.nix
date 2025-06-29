{ ... }:
{
  programs.fish.functions = {
    nix-clear-garbage = {
      body = ''
        sudo nix-collect-garbage $argv -d && nix-collect-garbage $argv -d
      '';
      wraps = "nix-collect-garbage -d && sudo nix-collect-garbage -d";

      description = "Clear NixOS and Home Manager Garbage";
    };

    nom-wrap = {
      body = ''
        bash -c "$argv --log-format internal-json -v |& nom --json"
      '';
      wraps = "Any nix function";
      description = "Wrap Nix functions with nom";
    };

    nixup = {
      body = ''
        sudo bash -c "cd $HOME && nixos-rebuild switch $argv --log-format internal-json -v |& nom --json"
      '';
      wraps = "nixos-rebuild switch";
      description = "Wrap Nix rebuild function with monitor";
    };

    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  };
}
