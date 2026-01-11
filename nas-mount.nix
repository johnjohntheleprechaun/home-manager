{pkgs, ...}: {
  programs.rclone.enable = true;
  programs.rclone.remotes."NAS" = {
    config = {
      type = "webdav";
      url = "http://tart:8080";
      vendor = "other";
    };
    mounts."/" = {
      enable = true;
      mountPoint = "NAS";
      # vfs-cache-mode set by default
    };
  };
}
