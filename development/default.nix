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
    ];

    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "AurulentSansMono" ]; })
    ];
}
