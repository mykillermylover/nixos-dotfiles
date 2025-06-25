{ pkgs, ... }:
{
  programs.fish.plugins = with pkgs.fishPlugins; [
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
      name = "plugin-git";
      inherit (plugin-git) src;
    }
    {
      name = "fzf-fish";
      inherit (fzf-fish) src;
    }
    {
      name = "done";
      inherit (done) src;
    }
    {
      name = "replay";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "replay.fish";
        rev = "main";
        sha256 = "sha256-TzQ97h9tBRUg+A7DSKeTBWLQuThicbu19DHMwkmUXdg=";
      };
    }
  ];
}
