# NixOS configurations
{ inputs, config, self, ... }:
let
  inherit (inputs) nixpkgs;
  settings = config.flake.settings;
in
{
  flake.nixosConfigurations = {
    Default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self;
        outputs = self;
      } // settings;
      modules = [
        ../hosts/Default/configuration.nix
      ];
    };
  };
}
