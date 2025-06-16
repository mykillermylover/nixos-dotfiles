{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        options = {
          number = true;
          relativenumber = false;
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };

        statusline.lualine.enable = true;

        telescope.enable = true;

        autocomplete.nvim-cmp.enable = true;

        lsp.enable = true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
          yaml.enable = true;
        };
      };
    };
  };
}
