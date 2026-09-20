{ lib, stdenvNoCC, themeNames ? [ "Vivian" "Vivian_umbrella" ] }:

assert lib.all (name: lib.elem name [ "Vivian" "Vivian_umbrella" ]) themeNames;
stdenvNoCC.mkDerivation {
  pname = "vivian-hyprcursor";
  version = "1.2.0";

  # Package this checkout's finished assets, so local edits are respected.
  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [ ../Vivian ../Vivian_umbrella ];
  };
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/share/icons"
    for theme in ${lib.escapeShellArgs themeNames}; do
      cp -R "$theme" "$out/share/icons/$theme"
    done
    runHook postInstall
  '';

  meta = {
    description = "Animated Vivian Banshee fan-art cursors for Hyprcursor and XCursor";
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    # LICENSE-CODE covers tooling only; do not label the character artwork MIT.
  };
}
