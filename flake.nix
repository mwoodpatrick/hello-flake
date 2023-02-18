{
  description = "a very simple and friendly flake";

  # Nixpkgs / NixOS version to use.
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }:
    let

      # to work with older version of flakes
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

      # Generate a user-friendly version number.
      version = builtins.substring 0 8 lastModifiedDate;

      # System types to support.
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in

    {

      # A Nixpkgs overlay.
      overlay = final: prev: {

        hello-flake = with final; stdenv.mkDerivation rec {
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

      };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        rec {
          inherit (nixpkgsFor.${system}) hello-flake;
          default = hello-flake;
        });
    };
}
