# Systems configuration for multi-platform support
{ ... }:
{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = { pkgs, ... }: {
    # Formatter for all systems
    formatter = pkgs.alejandra;
  };
}
