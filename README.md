# hello-flake

simple flake test

There is no need to install anything. Simply run the command below.

    nix run git+https://codeberg.org/mhwombat/hello-flake

To run a specific branch, use this command.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main

To run a specific branch and revision, use this command.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main&rev=0bda75cf455f9f2395708ffff33e631bc74cdc44

You can also abbreviate the revision.

    nix run git+https://codeberg.org/mhwombat/hello-flake?ref=main&rev=0bda75cf45
