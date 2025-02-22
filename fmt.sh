#!/bin/sh
fd '\.nix$' | xargs nixfmt
