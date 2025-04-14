{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        rclone
    ];

    systemd.user.services.rclone-mount = {
        Unit = {
            Description = "Mount rclone stuffs";
            After = [ "network-online.target" ];
        };
        Service = {
            Type = "notify";
            PermissionsStartOnly = true;
            ExecStartPre = "/usr/bin/env mkdir -p %h/School";
            ExecStart = "${pkgs.rclone}/bin/rclone mount onedrive:/ %h/School --vfs-cache-mode writes";
            ExecStop = "/bin/fusermount -u %h/School";
        };
        Install = {
            WantedBy = [ "default.target" ];
        };
    };
}
