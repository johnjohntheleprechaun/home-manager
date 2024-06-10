{ config, pkgs, ... }:

{
    imports = [
        ./programs/bash.nix
        ./programs/git.nix
        ./programs/ssh.nix
        ./programs/aws.nix
        ./games/steam.nix
        ./dconf.nix
        ./pkgs.nix
    ];
    
    home.username = "john";
    home.homeDirectory = "/home/john";

    programs.home-manager.enable = true;
    
    nixpkgs.config = {
        allowUnfree = true;
    };

    home.stateVersion = "23.11";
}
