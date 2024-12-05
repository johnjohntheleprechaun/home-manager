{ config, pkgs, ...}:

{
    programs.bash = {
        enable = true;
        bashrcExtra = builtins.readFile ./bashrc-extra.sh;
    };
    home.sessionVariables = {
        NIX_SHELL_PRESERVE_PROMPT = 1;
    };
}
