# hello-flake

A very simple demonstration using nix flakes.
This package contains a single executable that prints a greeting.

## Running the executable

There is no need to install anything (except nix). Simply run the command below.

    nix run "git+https://codeberg.org/mhwombat/hello-flake"

To run a specific branch, use the command below.

    nix run "git+https://codeberg.org/mhwombat/hello-flake?ref=main"

To run a specific branch and revision, use the command below.

    nix run "git+https://codeberg.org/mhwombat/hello-flake?ref=main&rev=d44728bce88a6f9d1d37dbf4720ece455e997606"

## Launching a shell

To get a shell with this package available, use the command below.

    nix shell "git+https://codeberg.org/mhwombat/hello-flake"

As in the previous section, you can modify the URL to select a specific branch and revision.
