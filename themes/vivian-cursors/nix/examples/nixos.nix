# Merge into your NixOS configuration; pass `inputs` via specialArgs.
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
