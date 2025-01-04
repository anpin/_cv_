{
  stdenv
  , fetchYarnDeps
  , nodejs
  , fixup-yarn-lock
  , yarn
  , playwright-driver
  , playwright-test
  , playwright
  , jq
  , procps
} : 
stdenv.mkDerivation rec {
  name = "cv";
  src = ./.;
  
  offlineCache = fetchYarnDeps {
    yarnLock = ./yarn.lock;
    hash = "sha256-j99PGTYWJIFxAj7bWBQ3e5H3qnaYwhLrkvrBT46dPR8=";
    };

  nativeBuildInputs = [
    nodejs
    fixup-yarn-lock
    yarn
    playwright
    playwright-driver
    playwright-test
    procps
  ];
  configurePhase = ''
    runHook preConfigure

    export HOME=$NIX_BUILD_TOP
    yarn config --offline set yarn-offline-mirror "$offlineCache"
    fixup-yarn-lock yarn.lock
    yarn --offline --frozen-lockfile --ignore-platform --ignore-scripts --no-progress --non-interactive install
    patchShebangs node_modules

    playwright_chromium_revision="$(${jq}/bin/jq --raw-output '.browsers[] | select(.name == "chromium").revision' ${playwright-driver}/package/browsers.json)"
    export PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH="${playwright-driver.browsers}/chromium-$playwright_chromium_revision/chrome-linux/chrome";
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1;
    export PLAYWRIGHT_BROWSERS_PATH="${playwright-driver.browsers}";
    export PLAYWRIGHT_NODEJS_PATH="${nodejs}/bin/node";
    
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild

    yarn --offline build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    cp -r dist/ $out

    runHook postInstall
  '';
}