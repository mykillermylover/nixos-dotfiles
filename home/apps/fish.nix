{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      # FNM Init
      set FNM_PATH "/home/mihail/.local/share/fnm"
      if [ -d "FNM_PATH" ]
        set PATH "FNM_PATH" $PATH
        fnm env | source
      end

      fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell fish | source
    '';

    shellInitLast = ''
      # Init Startship
      starship init fish | source
      # Init nix-your-shell
      nix-your-shell fish | source

      # Change sudo prompt colors
      set -gx SUDO_PROMPT (echo -e "\033[34;1m[sudo]\033[0m \033[36;1mEnter password for %u:\033[0m ")
    '';

    interactiveShellInit = ''
      fastfetch
    '';

    shellAliases = {
      "nix-clear-garbage" = "nix-collect-garbage -d && sudo nix-collect-garbage -d $argv";

      "ls" = "eza";
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "puffer-fish";
        inherit (puffer) src;
      }
      {
        name = "autopair";
        inherit (autopair) src;
      }
      {
        name = "grc";
        inherit (grc) src;
      }
      {
        name = "git-abbr";
        inherit (git-abbr) src;
      }
      {
        name = "fzf-fish";
        inherit (fzf-fish) src;
      }
    ];
  };
}
