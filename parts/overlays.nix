# Overlays configuration
{ inputs, config, ... }:
let
  settings = config.flake.settings;
in
{
  flake.overlays = import ../overlays { inherit inputs settings; };
}
