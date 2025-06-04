{ pkgs  } : with pkgs;

# let pw = pkgs.playwright-driver.override(old:);
# in 

mkShell {
 packages = [
   nodejs_20
   yarn
   yarn2nix
   playwright
   playwright-driver
   playwright-test
   windsurf.fhs
  ];
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1;
  PLAYWRIGHT_BROWSERS_PATH="${pkgs.playwright-driver.browsers}";
  PLAYWRIGHT_NODEJS_PATH="${pkgs.nodejs}/bin/node";
  shellHook = ''
    playwright_chromium_revision="$(${jq}/bin/jq --raw-output '.browsers[] | select(.name == "chromium").revision' ${playwright-driver}/browsers.json)"

    export PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH="${playwright-driver.browsers}/chromium-$playwright_chromium_revision/chrome-linux/chrome";
'';
}
