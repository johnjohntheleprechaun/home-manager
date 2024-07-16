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
    ];
}
