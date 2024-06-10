{ config, pkgs, ... }:

{
    programs.awscli.enable = true;
    programs.awscli.settings = {
        "default" = {
            sso_session = "sso";
            sso_account_id = "087191758107";
            sso_role_name = "AdministratorAccess";
            region = "us-west-2";
            output = "json";
        };
        "sso-session sso" = {
            sso_start_url = "https://leprechaun.awsapps.com/start";
            sso_region = "us-west-2";
            sso_registration_scopes = "sso:account:access";
        };
    };
}