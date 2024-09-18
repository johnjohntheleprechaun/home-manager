{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # GNOME extensions
        gnomeExtensions.dash-to-dock
        gnomeExtensions.appindicator

        # Graphical applications
        yubikey-manager-qt
        aws-sam-cli
        zoom-us
        gnome.gnome-terminal
        gnome.nautilus
        gnome.gnome-tweaks
        gnome.file-roller
        gnome.gnome-disk-utility
        gedit
        gimp
        discord
        chromium
        vlc
        orca-slicer
        godot_4
        pavucontrol
        blender
        nomacs
        audacity
        evince

        # CLI packages
        usbutils
        zip
        unzip
        file
        ssh-import-id
        ffmpeg
        dig
        openssl
        binutils
        jq
        trash-cli

        # Development packages
        nodejs_20
        nodePackages.aws-cdk
        nodePackages.http-server
        awscli2
        python3
        jdk21
        sshfs
        glib

        # Other shit
        ntfs3g
        monitor
    ];
    programs.chromium.enable = true;
}
