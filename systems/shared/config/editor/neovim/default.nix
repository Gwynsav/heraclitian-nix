{ pkgs }:

{
  programs.neovim = {
    # Enable and add Python provider.
    enable        = true;
    withPython3   = true;

    # Make default and alias vi and vim.
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;

    # Configuration in Lua.
    extraLuaConfig = import ./init.nix {};

    # Enable completion engine.
    coc = {
      enable = true;
    };

    # Plugins
    plugins = with pkgs.vimPlugins; [
      # Basics
      nvim-treesitter
      vim-polyglot

      # Commenting
      comment-nvim
      nvim-ts-context-commentstring

      # UI
      barbar-nvim
      lualine-nvim
      nvim-colorizer-lua
      nvim-tree-lua
      nvim-web-devicons
    ];
  };
}
