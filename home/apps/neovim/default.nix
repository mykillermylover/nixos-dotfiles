{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      nixfmt-rfc-style
      tree-sitter
      nil
    ];

    plugins =
      let
        # All plugins, ignore problematic
        nvim-treesitter = import ./nvim-treesitter.nix pkgs.vimPlugins.nvim-treesitter;
      in
      with pkgs.vimPlugins;
      [
        vim-nix
        vim-polyglot
        nvim-treesitter
        nvim-lspconfig
        {
          plugin = kanagawa-nvim;
          type = "lua";
          config = builtins.readFile ./kanagawa.lua;
        }
        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./lualine.lua;
        }
        mini-comment
        mini-nvim
      ];

    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.cursorline = true
    '';
  };
}
