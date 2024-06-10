{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # GNOME extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.appindicator

        # Graphical applications
        gnome.gnome-terminal
        gnome.nautilus
        gnome.gnome-tweaks
        gnome.file-roller
        gedit
        gimp
        discord
        spotify
        chromium
        vlc
        orca-slicer
        godot_4

        # Games
        prismlauncher
        steam

        # CLI packages
        usbutils
        zip
        unzip
        file
        ssh-import-id
        ffmpeg

        # Development packages
        nodejs_20
        nodePackages.aws-cdk
        nodePackages.http-server
        awscli2
        vscode
        git
        python3
        jdk17

        # Other shit
        ntfs3g
        monitor
    ];
    programs.firefox.enable = true;
    programs.chromium.enable = true;
}