{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "John Jorgensen";
        userEmail = "john@jorgensenfamily.us";
        aliases = {
            hist = "log --graph";
            cam = "commit -am";
            cm = "commit -m";
            c = "commit";
        };
        extraConfig = {
            init.defaultBranch = "main";
            merge.ff = false;
            safe.directory = "/etc/nixos";
        };
    };
}