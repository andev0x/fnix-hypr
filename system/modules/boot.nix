{ config, pkgs, lib, ... }:

{
  # ARM systems don't support Secure Boot (lanzaboote), using systemd-boot instead
  boot = {
    kernelParams = ["nohibernate"];
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      timeout = 300;
    };
  };

  # Disable lanzaboote for ARM systems
  #boot.lanzaboote.enable = lib.mkForce false;
}
