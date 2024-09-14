{ config, pkgs, ... }:

{
    programs.ssh = {
        enable = true;
        matchBlocks = {
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
            "router" = {
                hostname = "openwrt.lan";
                user = "root";
            };
        };
        extraOptionOverrides = {
            EnableEscapeCommandline = "true";
        };
    };
}
