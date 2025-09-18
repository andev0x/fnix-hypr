{ config, pkgs, lib, ... }:

{
 hardware = {
    bluetooth.enable = true;
    
    # Enable firmware for ARM devices
    enableAllFirmware = true;

	opengl = {
		enable = true;
		driSupport = true;
		# 32-bit support is not available on ARM64
		driSupport32Bit = false;
	};
 };
}
