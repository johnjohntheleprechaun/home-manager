{ config, pkgs, ... }:

let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
    imports = [
        ./aws.nix
        ./bash.nix
        ./git.nix
        ./gnome-terminal.nix
        ./neovim
        ./tmux
        ./ssh.nix
        ./kitty
    ];

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "AurulentSansMono" ]; })
        unstable.uv
    ];
}
