{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        extraConfig = builtins.readFile ./init.nvim;
        coc = {
            enable = true;
            pluginConfig = builtins.readFile ./coc.nvim;
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

            # themes
            dracula-nvim

            # other plugins
            {
                plugin = gitsigns-nvim;
                config = builtins.readFile ./gitsigns.nvim;
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
        ];
    };
}
