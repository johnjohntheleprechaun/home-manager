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
                hostname = "castle.jorgensenfamily.us";
                port = 33201;
                user = "john";
            };
            "rpi4.remote" = {
                hostname = "castle.jorgensenfamily.us";
                port = 33200;
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
