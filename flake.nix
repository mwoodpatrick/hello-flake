{
  description = "a very simple and friendly flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # to work with older version of flakes
        lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

        # Generate a user-friendly version number.
        version = builtins.substring 0 8 lastModifiedDate;

        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = rec {
          hello = pkgs.stdenv.mkDerivation rec {
            name = "hello-flake-${version}";

            src = ./.;

            unpackPhase = "true";

            buildPhase = ":";

            installPhase =
              ''
                mkdir -p $out/bin
                cp $src/hello-flake $out/bin/hello-flake
                chmod +x $out/bin/hello-flake
              '';
          };
          default = hello;
        };

        apps = rec {
          hello = flake-utils.lib.mkApp { drv = self.packages.${system}.hello; };
          default = hello;
        };
      }
    );
}
