{ config, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        enableUpdateCheck = false;
        userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
}