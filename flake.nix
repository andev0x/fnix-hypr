{
    description = "andev NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # lanzaboote not supported on ARM systems
        # lanzaboote = {
        #     url = "github:nix-community/lanzaboote/v0.3.0";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
	let
	    lib = nixpkgs.lib;
	    system = "aarch64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
    {
		nixosConfigurations.nixos-andev = lib.nixosSystem {
                inherit system;
				modules = [
                    ./system/configuration.nix
                    # lanzaboote.nixosModules.lanzaboote  # Not supported on ARM
				];
                specialArgs = {
                    inherit pkgs-unstable;
                };
        };

		homeConfigurations = {
			andev = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home ];
                extraSpecialArgs = {
                    inherit pkgs-unstable;
                    inherit inputs;
                };
			};
		};
    };
}
