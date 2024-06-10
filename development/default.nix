{ config, pkgs, ... }:

{
    imports = [
        ./aws.nix
        ./bash.nix
        ./git.nix
    ];
}