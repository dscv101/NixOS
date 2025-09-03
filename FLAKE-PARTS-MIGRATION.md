# Flake-Parts Migration

This document describes the migration of the NixOS configuration from a traditional flake structure to using [flake-parts](https://flake.parts).

## What Changed

### Before (Traditional Flake)
- All configuration was in a single `flake.nix` file
- Settings were defined inline in the outputs function
- System configurations were directly defined in the outputs

### After (Flake-Parts)
- Configuration is split into modular parts in the `parts/` directory
- Each part handles a specific aspect of the flake
- Better organization and maintainability

## New Structure

```
parts/
├── settings.nix          # User and system configuration settings
├── systems.nix           # Multi-platform system definitions
├── nixos-configurations.nix  # NixOS system configurations
├── overlays.nix          # Package overlays
└── dev-shells.nix        # Development shells and templates
```

## Benefits

1. **Modularity**: Each aspect of the flake is in its own file
2. **Maintainability**: Easier to find and modify specific configurations
3. **Reusability**: Parts can be easily shared between different flakes
4. **Clarity**: Clear separation of concerns

## Settings Access

The user and system settings are now available as `config.flake.settings` in all flake-parts modules, maintaining the same configuration options:

- User configuration: username, editor, browser, terminal, etc.
- System configuration: videoDriver, hostname, locale, timezone, etc.

## Compatibility

All existing functionality is preserved:
- NixOS configurations work the same way
- All modules and overlays continue to function
- Installation scripts remain unchanged
- All user settings are maintained

## Usage

The flake can be used exactly as before:
```bash
nixos-rebuild switch --flake .#Default
```

All existing commands and workflows remain the same.
