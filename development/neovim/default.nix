{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        extraConfig = builtins.readFile ./init.nvim;
        plugins = with pkgs.vimPlugins; [
            {
                plugin = coc-nvim;
                config = builtins.readFile ./coc.nvim;
            }
            coc-tsserver
            coc-tslint-plugin
            {
                plugin = gitsigns-nvim;
                config = builtins.readFile ./gitsigns.lua;
            }
        ];
    };
}
