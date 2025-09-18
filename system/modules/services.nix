{ config, pkgs, ... }:

{
  services = {
  	dbus.enable = true;
	# picom is an X11 compositor and conflicts with Wayland compositors like Hyprland
	# Disable to avoid black screen or double compositing
	picom.enable = false;
	openssh.enable = true;
    spice-vdagentd.enable = true;

	# Enable X server for keyboard layout settings and SDDM, but prefer Wayland session
	xserver = {
		enable = true;
		layout = "us, ru, ge";
        xkbOptions = "grp:alt_shift_toggle, caps:swapescape";

		displayManager = {
			sddm.enable = true;
            sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
            # Use Wayland session for SDDM to launch Hyprland properly
            sddm.wayland.enable = true;
		};
	};
  };
}
