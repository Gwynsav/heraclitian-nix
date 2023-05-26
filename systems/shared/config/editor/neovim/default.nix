# My adaptation of the now deprecated `nii-nvim` to the new configurations
# of some nvim plugins, and entirely using nix for plugin management. It also
# contains some modifications based on personal preference.

{ pkgs }:

{
  programs.neovim = {
    # Enable and add Python provider.
    enable        = true;
    package       = pkgs.unstable.neovim-unwrapped;
    withPython3   = true;

    # Make default and alias vi and vim.
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;

    # Explicitly disable completion engine. nii-nvim uses `cmp` instead.
    coc.enable    = false;

    # Plugins
    plugins = with pkgs.unstable.vimPlugins; [
      ## Syntax
      # Treesitter is good enough for most languages.
      nvim-treesitter.withAllGrammars
      # One could alternatively (or complementarily) use `vim-polyglot`, 
      # which may provide better syntax-highlighting for some languages.
      # vim-polyglot
      yuck-vim
      nvim-colorizer-lua

      ## Completion
      nvim-cmp cmp-path cmp-buffer
      # Autopairing
      nvim-autopairs

      ## LSP/Snippets
      # nvim-lspconfig lspkind-nvim
      # ultisnips
      # Completion for LSP/Snippets plugins
      # cmp-nvim-lsp cmp-nvim-ultisnips

      ## Commenting
      # I used to use:
      # comment-nvim nvim-ts-context-commentstring
      # However, nii-nvim uses the more simply implemented:
      nvim-comment

      ## Formatting
      neoformat

      ## UI
      # "Modeline" and tabline that follow same styling, they also require 
      # `nvim-web-devicons` in order to show language logos and the like. 
      # The filetree also depends on this plugin.
      lualine-nvim tabline-nvim nvim-tree-lua             
      nvim-web-devicons         

      ## Fuzzy finder plugins. `popup` and `plenary` are dependencies.
      telescope-nvim telescope-fzf-native-nvim
      popup-nvim plenary-nvim

      ## Dashboard
      # dashboard-nvim # The original dashboard plugin used by nii-nvim. 
      alpha-nvim       # The one I opted to use, because it actually works.

      ## Colorscheme
      # vim-colors-solarized
      everforest
      oxocarbon-nvim
      nvim-solarized-lua
      tokyonight-nvim
    ];
  };
  xdg.configFile.nvim.source = ./luaconfig;
}
