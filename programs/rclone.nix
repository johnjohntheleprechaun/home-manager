{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rclone
  ];

  systemd.user.services.csi-onedrive-mount = {
    Unit = {
      Description = "Mount CSI OneDrive";
      After = ["network-online.target"];
      Wants = ["network-online.target"];
    };
    Service = {
      Type = "simple";
      PermissionsStartOnly = true;
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/School";
      ExecStart = "${pkgs.rclone}/bin/rclone mount onedrive:/ %h/School --vfs-cache-mode writes";
      ExecStop = "${pkgs.fuse}/bin/fusermount -u %h/School";
      Restart = "on-failure";
      RestartSec = "10s";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
  systemd.user.services.gdrive-leprechaun-mount = {
    Unit = {
      Description = "Mount leprechan.dev Google Drive";
      After = ["network-online.target"];
      Wants = ["network-online.target"];
    };
    Service = {
      Type = "simple";
      PermissionsStartOnly = true;
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/Leprechaun";
      ExecStart = "${pkgs.rclone}/bin/rclone mount gdrive-leprechaun-combined:/ %h/Leprechaun --vfs-cache-mode writes --drive-export-formats='desktop'";
      ExecStop = "${pkgs.fuse}/bin/fusermount -uz %h/Leprechaun";
      Restart = "on-failure";
      RestartSec = "10s";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
