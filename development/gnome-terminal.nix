{ config, pkgs, ... }:

let
    dracula = pkgs.stdenv.mkDerivation {
        name = "gnome-terminal-dracula-theme";
        src = builtins.fetchGit {
            url = "https://github.com/dracula/gnome-terminal.git";
            rev = "ccc75a2d7fd915e80d95059a80899249e7161e06";
        };
        buildInputs = [ pkgs.libuuid pkgs.dconf ];
        installPhase = builtins.readFile ./dracula.sh;
    };
in
{
    home.packages = with pkgs; [
        gnome.gnome-terminal
        #dracula
    ];

}
