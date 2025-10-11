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

    rust-analyzer-src = {
      url = "github:rust-lang/rust-analyzer/2025-08-11";
      flake = false;
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 
  outputs = { self, nixpkgs, home-manager, nixvim, rust-analyzer-src, nur, ... } @inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ({ pkgs, ... }: {
        nixpkgs.overlays = [
          (final: prev: {
            rust-analyzer = prev.rust-analyzer.overrideAttrs (old: {
              version = "2025-08-11";
              src = rust-analyzer-src;
              cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
            });
          })
        ];
        })
        ./configuration.nix 
	      nixvim.nixosModules.nixvim
      ];
    };
  
    homeConfigurations.yuri = home-manager.lib.homeManagerConfiguration {
      pkgs = let
        # waybarOverlay = final: prev: {
        #   waybar = waybar.packages."x86_64-linux".default;
        # };
      in
        ( import nixpkgs {
          system = "x86_64-linux";
          overlays = [ 
            nur.overlays.default 
          ];
      });
      modules = [
        ./home-manager/home.nix 
      ];
    };
  };
}
