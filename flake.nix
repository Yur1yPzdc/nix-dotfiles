{
  description = "Yuri's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    waybar = {
      url = "github:Alexays/Waybar/8516d457ad63880e359cb650581deb52d9fc3559";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 
  outputs = { self, nixpkgs, home-manager, nixvim, nur, waybar, ... } @inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix 
	      nixvim.nixosModules.nixvim
      ];
    };
  
    homeConfigurations.yuri = home-manager.lib.homeManagerConfiguration {
      pkgs = let
        waybarOverlay = final: prev: {
          waybar = waybar.packages."x86_64-linux".default;
        };
      in
        ( import nixpkgs {
          system = "x86_64-linux";
          overlays = [ 
            nur.overlays.default 
            waybarOverlay 
          ];
      });
      modules = [ ./home-manager/home.nix ];
    };
  };
}
