{ lib, config, pkgs, ... }:
{
    xdg.mimeApps.enable = true;
    xdg.mimeApps.defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        # web
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/mailto" = [ "firefox.desktop" ];
        # images
        "image/jpeg" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/png" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/bmp" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/gif" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/tiff" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/webp" = [ "org.nomacs.ImageLounge.desktop" ];
        "image/svg+xml" = [ "org.nomacs.ImageLounge.desktop" ];
        "application/x-xcf" = [ "gimp.desktop" ];
    };

    programs.bash.initExtra = ''
        export PATH="$HOME/.local/bin:$PATH"
    '';
    home.file.".local/bin/xdg-open" = {
        source = ./wsl.sh;
        executable = true;
    };
    home.packages = [ pkgs.wslu ];
}
