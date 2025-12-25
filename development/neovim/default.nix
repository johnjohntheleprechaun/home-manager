{
  pkgs,
  config,
  unstable,
  ...
}: {
  home.packages = with pkgs; [
    glib
    gvfs
    gcc
    nodejs

    # language servers
    eslint_d
    typescript-language-server
    vscode-langservers-extracted
    lua-language-server
    nixd
    bash-language-server
    yaml-language-server
    pyright
    rust-analyzer

    # Formatting
    prettierd
    alejandra
    stylua
    shfmt
    yamlfmt
    black
    rustfmt
  ];
  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    plugins = with unstable.vimPlugins; [
      # tree-sitter and langs
      {
        plugin = nvim-treesitter;
        config = ''
          lua << END
          ${builtins.readFile ./treesitter.lua}
          END
        '';
      }
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.javascript

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
      catppuccin-nvim

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
