{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        extraConfig = builtins.readFile ./init.vim;
        coc = {
            enable = true;
            pluginConfig = builtins.readFile ./coc.vim;
            settings = builtins.fromJSON (builtins.readFile ./coc-settings.json);
        };
        plugins = with pkgs.vimPlugins; [
            # CoC plugins
            coc-tsserver
            coc-eslint
            coc-highlight
            coc-json
            coc-html
            coc-css
            coc-vimlsp
            coc-snippets
            coc-pyright
            coc-lua

            # themes
            dracula-nvim

            # other plugins
            {
                plugin = gitsigns-nvim;
                config = builtins.readFile ./gitsigns.vim;
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
