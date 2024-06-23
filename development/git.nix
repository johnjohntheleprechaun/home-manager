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
            ca = "commit --amend";
            can = "commit --amend --no-edit";
        };
        extraConfig = {
            init.defaultBranch = "main";
            merge.ff = false;
            pull.ff = true;
            safe.directory = "/etc/nixos";
        };
    };
}