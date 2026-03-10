{lib, ...}: {
  flake.modules.homeManager.violetshine = {pkgs, ...}: {
    programs.neovim = {
      # Enable Neovim
      enable = true;

      # Next, we set Neovim as the default editor
      # and enable all aliases
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      # Neovim plugins to install
      plugins = [
        # Tree-sitter is a better parsing system with
        # improved syntax highlighting + with grammars
        # for all languages
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars

        # Dependencies of Telescope
        pkgs.vimPlugins.plenary-nvim

        # Telescope for finding and filtering files
        pkgs.vimPlugins.telescope-nvim

        # Icons!
        pkgs.vimPlugins.nvim-web-devicons

        # File browser
        pkgs.vimPlugins.nvim-tree-lua
      ];

      # My Neovim config
      extraLuaConfig = let
        nvimConfigEarlyInit = lib.mkOrder 500 ''
          -- Disable netrw at the very start of init.lua
          vim.g.loaded_netrw        = 1
          vim.g.loaded_netrwPlugin  = 1
        '';
        nvimConfig = lib.mkOrder 1000 ''
          -- Enable 24-bit colours
          vim.opt.termguicolors = true

          -- Indentation style (2 spaces, no tabs)
          vim.opt.expandtab    = true
          vim.opt.tabstop      = 2
          vim.opt.shiftwidth   = 2
          vim.opt.softtabstop  = -1    -- Use value of shiftwidth
          vim.opt.smarttab     = true  -- Always use shiftwidth
        '';
        nvimConfigLastRun = lib.mkOrder 1500 ''
          -- empty setup using defaults
          require('nvim-tree').setup()
        '';
      in
        lib.mkMerge [
          nvimConfigEarlyInit
          nvimConfig
          nvimConfigLastRun
        ];
    };
  };
}
