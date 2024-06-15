{
  mkYarnPackage
  , fetchYarnDeps
} : 
mkYarnPackage {
  name = "cv";
  src = ./.;
  packageJSON = ./package.json;
  # yarnLock = ./yarn.lock;
  # yarnNix = ./yarn.nix;
  offlineCache = fetchYarnDeps {
    yarnLock = ./yarn.lock;
    hash = "sha256-dSajfSH4tCIIfAQGmu6+iJkY+dl9qGxkoVgtxLbUR+A=";
    };

  preBuild = ''
    # js dependencies
    export HOME=$NIX_BUILD_TOP
    patchShebangs node_modules
  '';
  buildPhase = ''
  runHook preBuild
  yarn --offline build --outDir $out/dist
  runHook postBuild
  '';
  installPhase = ''
      rm -rf $out/bin
      rm -rf $out/libexec
    '';
  doDist = false;
}