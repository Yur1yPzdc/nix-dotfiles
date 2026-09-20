# Changes

## 1.2.0

- Reduce the Vivian pointer/symbol height and enlarge the character for approximately 1:3 proportions.
- Add Vivian_umbrella: a compact open hemisphere canopy, a sharp silver tip directed up-left, and fixed tip hotspots in all cursor states.
- Package both themes by default; add separate `vivian` and `vivian-umbrella` flake package outputs.
- Remove verification scripts, the npm verify command, and flake check outputs from the release.
- Add an interactive theme switcher and a comparison preview.

## 1.1.0

- Add a Nix flake with a pinned Nixpkgs input, default/named packages, overlay and installed-payload checks.
- Install both cursor formats under `share/icons/Vivian` using the assets in the repository.
- Add NixOS and Home Manager configuration examples and a Nix installation guide.
- Extend the validator to check an installed package with `--theme`.
- Cursor artwork and theme payload are unchanged from 1.0.0.

## 1.0.0

- Initial animated Vivian cursor theme: 36 shapes, 122 names, five sizes, Hyprcursor and XCursor packages, artwork sources and previews.
