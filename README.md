# hello-flake

simple flake test

## Running the executable

There is no need to install anything (except nix). Simply run the command below.

    nix run git+https://codeberg.org/mhwombat/hello-flake

To run a specific branch, use the command below.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main

To run a specific branch and revision, use the command below.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main&rev=0bda75cf455f9f2395708ffff33e631bc74cdc44

You can also abbreviate the revision.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main&rev=0bda75cf45

## Launching a shell

To get a shell with this package available, use the command below.

    nix shell git+https://codeberg.org/mhwombat/hello-flake

As in the previous section, you can modify the URL to select a specific branch and revision.
