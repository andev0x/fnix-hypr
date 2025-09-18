{ config, pkgs, lib, ... }:

{
  nix = lib.mkIf pkgs.stdenv.isx86_64 {
    settings = {
		warn-dirty = false;
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
		substituters = ["https://nix-gaming.cachix.org"];
		trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
	};
  };
}
