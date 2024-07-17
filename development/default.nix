{ config, pkgs, ... }:

{
    imports = [
        ./aws.nix
        ./bash.nix
        ./git.nix
        ./gnome-terminal.nix
        ./vscode
        ./neovim
        ./tmux
        ./ssh.nix
        ./kitty
    ];

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "AurulentSansMono" ]; })
        kitty
    ];
}
