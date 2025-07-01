{
  description = "Yuri's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nixgl.url = "github:nix-community/nixGL";
    nur.url = "github:nix-community/NUR";
  };
 
  outputs = { self, nixpkgs, home-manager, nixvim, nixgl, nur, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix 
	      nixvim.nixosModules.nixvim
      ];
    };
  
    homeConfigurations.yuri = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux".extend nur.overlays.default;
      modules = [ ./home-manager/home.nix ];
    };
  };
}
