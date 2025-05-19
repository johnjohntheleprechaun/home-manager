{pkgs, ...}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  home.packages = with pkgs; [
    glib
    gvfs
    nodejs
    prettierd
    eslint_d
    typescript-language-server
    vscode-langservers-extracted
    lua-language-server
    nixd
    alejandra
  ];
  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    plugins = with unstable.vimPlugins; [
      # code completion
      {
        plugin = nvim-lspconfig;
        config = ''
          lua << END
          ${builtins.readFile ./lsp.lua}
          END
        '';
      }

      # cmp
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip

      none-ls-nvim

      # themes
      dracula-nvim

      # other plugins
      {
        plugin = gitsigns-nvim;
        config = ''
          lua << END
          ${builtins.readFile ./gitsigns.lua}
          END
        '';
      }
      {
        plugin = nvim-tree-lua;
        config = ''
          lua << END
          ${builtins.readFile ./tree.lua}
          END
        '';
      }
      {
        plugin = nvim-web-devicons;
      }
      {
        plugin = nvim-autopairs;
        config = "lua << END\nrequire('nvim-autopairs').setup{}\nEND";
      }
      {
        plugin = vim-pencil;
        config = builtins.readFile ./pencil.vim;
      }
    ];
  };
}
