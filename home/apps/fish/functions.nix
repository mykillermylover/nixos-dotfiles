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
        bash -c "cd $HOME && sudo nixos-rebuild switch $argv --log-format internal-json -v |& nom --json"
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

    fish_remove_path = {
      body = ''
        if set -l index (contains -i "$argv" $fish_user_paths)
          set -e fish_user_paths[$index]
          echo "Removed $argv from the path"
        end
      '';
      description = "Remove entry from fish_user_paths";
    };

    copy = {
      body = ''
        if test (count $argv) -eq 0
          echo "Usage: to_copy <cmd|path> [args...]" >&2
          return 1
        end

        set -l first $argv[1]

        if test -f $first
          # arg is file
          cat $argv | wl-copy -n
        else if command -v $first >/dev/null
          # arg is command
          command $argv | wl-copy -n
        else
          echo "Error: '$first' is not a path or a command" >&2
          return 1
        end
      '';
      description = "any command or path piped to wl-copy";
    };

    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  };
}
