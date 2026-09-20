{
  description = "Vivian Banshee cursors for Hyprcursor and XCursor";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          theme = pkgs.callPackage ./nix/default.nix { };
        in
        {
          default = theme;
          vivian-hyprcursor = theme;
          vivian = pkgs.callPackage ./nix/default.nix { themeNames = [ "Vivian" ]; };
          vivian-umbrella = pkgs.callPackage ./nix/default.nix { themeNames = [ "Vivian_umbrella" ]; };
        });

      overlays.default = final: prev: {
        vivian-hyprcursor = final.callPackage ./nix/default.nix { };
      };

    };
}
