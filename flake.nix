{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:anpin/nixpkgs?ref=next";
  };

  outputs = { self, nixpkgs }:
  
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system ;
      config = {
        permittedInsecurePackages = [];
        allowUnfree = true;
       };
      overlays = [
        # self.overlays.dxc-overlay
      ];
    };
  in {

    packages.x86_64-linux.pages = pkgs.callPackage ./pages.nix { };

    packages.x86_64-linux.default = self.packages.x86_64-linux.pages;
    devShells.x86_64-linux.default = pkgs.callPackage ./shell.nix { };

    apps.x86_64-linux = with pkgs; {
      deploy =  {
                type = "app";
                program = toString ( pkgs.callPackage  ./deploy.nix { 
                  pages = self.packages.x86_64-linux.pages;
                  });
          };
    };

  };
}
