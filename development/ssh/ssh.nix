{
  config,
  pkgs,
  ...
}: let
  hostMap = import ./host-mapper.nix;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = hostMap {
      "leopard.local" = {
        hostname = "leopard";
        user = "john";
      };
      "rpi4.local" = {
        hostname = "johnpi";
        user = "pi";
      };
      "leopard.remote" = {
        hostname = "leopard.van-pogona.ts.net";
        port = 22;
        user = "john";
      };
      "rpi4.remote" = {
        hostname = "johnpi.van-pogona.ts.net";
        port = 22;
        user = "pi";
      };
      "noduh.mc" = {
        hostname = "mc.noduh.dev";
        port = 1822;
        user = "bob";
      };
      "john.noduh.mc" = {
        hostname = "mc.noduh.dev";
        port = 1822;
        user = "john";
      };
      "leprechaun.mc" = {
        hostname = "mc.leprechaun.dev";
        port = 1722;
        user = "john";
      };
    };
    extraOptionOverrides = {
      EnableEscapeCommandline = "true";
    };
  };
}
