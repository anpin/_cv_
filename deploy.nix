{
  lib,
  pkgs,
  pages,
  ...
}: 
pkgs.writeShellScript "deploy.sh" ''
      export PATH="${lib.makeBinPath [
        pkgs.minio-client
      ]}"
      MINIO_ACCESS_KEY=''${1?"Usage: nix run .#deploy $MINIO_ACCESS_KEY $MINIO_SECRET_KEY $BRANCH"}
      MINIO_SECRET_KEY=''${2?"Usage: nix run .#deploy $MINIO_ACCESS_KEY $MINIO_SECRET_KEY $BRANCH"}
      BRANCH=''${3?"Usage: nix run .#deploy $MINIO_ACCESS_KEY $MINIO_SECRET_KEY $BRANCH"}
      mc alias set alerio https://s3.alerio.net $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
      mc mirror --remove --overwrite ${pages}/dist/ alerio/www/$BRANCH
    ''
