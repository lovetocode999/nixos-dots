# configuration.nix(5)
{
  description = "Lovetocode999's nix configuration";

  inputs = {
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, home-manager, impermanence, nixpkgs, nixvim, stylix, ...}: {
    nixosConfigurations = let
        lib = nixpkgs.lib;
      in 
      {
        dipper = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hardware-configuration.nix
            ./system.nix
            ./console.nix
	    ./kmonad.nix
            ./persistence.nix
            ./greeter.nix
            ./users.nix
            ./stylix.nix
	    ./nixvim.nix
	    ./zsh.nix

            impermanence.nixosModules.impermanence

	    nixvim.nixosModules.nixvim

            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
	      home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users = {
                "lovetocode999" = ./home.nix;
		#"root" = ./home-root.nix;
              };
            }
          ];
        };
      };
  };
}
