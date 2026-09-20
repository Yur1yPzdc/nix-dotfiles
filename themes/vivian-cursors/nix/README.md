# Vivian on NixOS

The repository is a flake, following the default-package and `share/icons` installation pattern in [rose-pine-hyprcursor](https://github.com/ndom91/rose-pine-hyprcursor). The default package installs both `Vivian` and `Vivian_umbrella`. Each contains both cursor formats:

```text
<package>/share/icons/Vivian/
├── manifest.hl
├── hyprcursors/*.hlc
├── index.theme
└── cursors/*
```

The same structure is installed at `<package>/share/icons/Vivian_umbrella/`.

## Updating your existing setup

Replace `/home/yuri/nixos-config/themes/vivian-cursors` with the folder extracted from `vivian-cursors-1.2.0.tar.gz`. Move the old folder aside first, rather than extracting over it, to avoid retaining the verification script from the previous release. Preserve any personal configuration edits you made before replacing the folder.

Your package line can remain:

```nix
inputs.vivian-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default
```

Track the new files and removed old files, update the input, and rebuild:

```sh
cd /home/yuri/nixos-config
git add -A themes/vivian-cursors
nix flake update vivian-cursors
sudo nixos-rebuild switch --flake .#YOUR_HOST_NAME
```

Use your actual host attribute name, and keep the changed main `flake.lock` tracked as well. To select the new variant in your Lua Hyprland config:

```lua
hl.env("HYPRCURSOR_THEME", "Vivian_umbrella")
hl.env("HYPRCURSOR_SIZE", "64")
hl.env("XCURSOR_THEME", "Vivian_umbrella")
hl.env("XCURSOR_SIZE", "64")
```

Select `Vivian` in both theme lines for the revised 1:3 pointer-to-character variant. Also use the chosen name in any Nix session variables, Home Manager pointerCursor name, or GTK settings that select the theme. The included example modules default to `Vivian`; change their theme strings to `Vivian_umbrella` if you import them and want the umbrella variant as your session default.

Apply immediately with `hyprctl setcursor Vivian_umbrella 64`, then log out and back in for application settings to take effect.

The derivation packages the artwork already in this checkout. Using the flake does not require Node.js, image generation, `hyprcursor-util`, or a Hyprland input. You do not need to follow a `hyprlang` input.

## 1. Add the input

For a new setup, place the extracted folder at `/home/yuri/nixos-config/themes/vivian-cursors`. In `/home/yuri/nixos-config/flake.nix`, merge:

```nix
inputs.vivian-cursors = {
  url = "path:./themes/vivian-cursors";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

If you later upload the **contents of the `vivian-cursors` folder** to the root of your own GitHub repository, replace the URL with:

```nix
url = "github:YOUR_GITHUB_USERNAME/vivian-cursors";
```

That GitHub URL is a placeholder, not an existing published repository. Keep both theme folders, both source folders, `assets/`, both cursor maps, `scripts/`, `nix/`, `flake.nix` and `flake.lock` in version control. Nix Git flakes only include files tracked by Git. The included `.gitignore` excludes development output while keeping these assets.

## 2. Select one configuration approach

### Home Manager (recommended for a personal cursor theme)

Pass `inputs` to Home Manager. For Home Manager integrated into NixOS, merge this into your NixOS configuration after its Home Manager module is imported:

```nix
home-manager.extraSpecialArgs = { inherit inputs; };
```

For standalone Home Manager, set `extraSpecialArgs = { inherit inputs; };` inside your existing `home-manager.lib.homeManagerConfiguration` call.

Then merge this into your Home Manager configuration:

```nix
{ inputs, pkgs, ... }:
{
  gtk.enable = true;

  home.pointerCursor = {
    name = "Vivian";
    package = inputs.vivian-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default;
    size = 64;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    HYPRCURSOR_THEME = "Vivian";
    HYPRCURSOR_SIZE = "64";
  };
}
```

On newer Home Manager releases, also set `home.pointerCursor.enable = true;` to avoid the implicit-enable deprecation warning. Older releases infer enablement from the options above and do not have that option. The explicit `HYPRCURSOR_*` variables also work with Home Manager releases that lack `home.pointerCursor.hyprcursor`.

Home Manager links the packaged theme into your user's icon directories and sets XCursor/GTK configuration. If you installed Vivian manually earlier, move the old `~/.local/share/icons/Vivian` and/or `~/.icons/Vivian` directories aside first, so Home Manager can own those paths. Keep only one definition of your pointer theme.

A ready-to-merge version is in [examples/home-manager.nix](examples/home-manager.nix).

### NixOS without Home Manager

Ensure the module receives `inputs` by adding `specialArgs = { inherit inputs; };` to your existing `nixpkgs.lib.nixosSystem` call. For example, the relevant part of your system flake can look like this:

```nix
outputs = { nixpkgs, ... }@inputs: {
  nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux"; # Use aarch64-linux for ARM64.
    specialArgs = { inherit inputs; };
    modules = [ ./configuration.nix ];
  };
};
```

Merge into `configuration.nix`:

```nix
{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.vivian-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.pathsToLink = [ "/share/icons" ];

  environment.sessionVariables = {
    HYPRCURSOR_THEME = "Vivian";
    HYPRCURSOR_SIZE = "64";
    XCURSOR_THEME = "Vivian";
    XCURSOR_SIZE = "64";
  };
}
```

This exposes the theme under `/run/current-system/sw/share/icons/Vivian`, within NixOS's session data paths. GTK applications may additionally need their cursor theme selected through GTK settings; the Home Manager approach handles those settings declaratively.

A ready-to-merge version is in [examples/nixos.nix](examples/nixos.nix).

## 3. Apply

Rebuild using your usual command, for example:

```sh
sudo nixos-rebuild switch --flake .#my-host
```

Use your actual host name. For standalone Home Manager, use your usual `home-manager switch --flake ...` command instead. Log out and back in so the session inherits the environment. To change the current Hyprland cursor immediately after installation:

```sh
hyprctl setcursor Vivian 64
```

Remove or update any old `HYPRCURSOR_*` / `XCURSOR_*` assignments in your Hyprland configuration; those can override the session settings.

## Build the themes on their own

Run from the extracted theme folder:

```sh
nix build path:.#default
ls result/share/icons
```

The explicit `path:` works before you have created a Git repository. Inside a Git repository, you can use `nix build .` after tracking the required files.

The flake exposes:

- `packages.<system>.default` and `packages.<system>.vivian-hyprcursor`: both themes.
- `packages.<system>.vivian`: just the revised small-pointer theme.
- `packages.<system>.vivian-umbrella`: just the open-umbrella theme.
- `overlays.default`, if you prefer `pkgs.vivian-hyprcursor` in your existing overlay setup.

Verification scripts and flake check outputs are not included in this release.

Package outputs are provided for x86_64 and aarch64 Linux and Darwin. Darwin outputs allow checking the asset package; they do not make Hyprland run on macOS.

The committed lockfile pins Nixpkgs revision `422d1ae605d7fcd9896412b37dc065c456c0eefb`, using the revision and NAR hash from [Home Manager's upstream lockfile](https://github.com/nix-community/home-manager/blob/master/flake.lock) retrieved while preparing this release. A consumer's `inputs.nixpkgs.follows = "nixpkgs"` uses that consumer's own Nixpkgs pin. Run `nix flake update nixpkgs` in the theme repository when you intentionally want to update its standalone pin.

Nix was unavailable in the preparation workspace: syntax and cursor/install payloads were checked locally, but **Nix evaluation and `nix build` have not been run here**. Run the build command above on your Nix machine before adopting the package.

References: [Rose Pine flake](https://github.com/ndom91/rose-pine-hyprcursor/blob/main/flake.nix), [Home Manager cursor options](https://github.com/nix-community/home-manager/blob/master/modules/config/home-cursor.nix), [Nix flake reference](https://nix.dev/manual/nix/2.34/command-ref/new-cli/nix3-flake.html).
