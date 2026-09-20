# Merge into your Home Manager configuration.
# Pass `inputs` using home-manager.extraSpecialArgs (NixOS integration)
# or extraSpecialArgs in homeManagerConfiguration (standalone).
{ inputs, pkgs, ... }:
{
  gtk.enable = true;

  home.pointerCursor = {
    # This works with older Home Manager releases that lack an enable option.
    # On newer releases, also add: enable = true;
    name = "Vivian";
    package = inputs.vivian-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default;
    size = 64;
    gtk.enable = true;
    x11.enable = true;
  };

  # Explicit variables also work on releases without pointerCursor.hyprcursor.
  home.sessionVariables = {
    HYPRCURSOR_THEME = "Vivian";
    HYPRCURSOR_SIZE = "64";
  };
}
