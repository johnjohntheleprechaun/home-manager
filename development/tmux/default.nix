{ config, pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        clock24 = true;
        escapeTime = 10;
        baseIndex = 1;
        keyMode = "vi";
        terminal = "screen-256color";
        extraConfig = builtins.readFile ./extra.conf;
    };
}
