{ ... }:
{
  programs.fish.functions = {
    nix-clear-garbage = {
      body = ''
        sudo nix-collect-garbage $argv -d && nix-collect-garbage $argv -d
      '';
      wraps = "nix-collect-garbage";

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

    nix-hash-sri = {
      body = ''
        nix hash convert --to sri --hash-algo sha256 $(nix-prefetch-url $argv)
      '';

      wraps = "nix-prefetch-url";
      description = "Prefetch nix deps and convert to SRI hash";
    };

    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  };
}
