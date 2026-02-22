# Embedding Modules in Antrag

Antrag embeds app modules through a small host-side contract.

## Module contract

Each embedded module must:

- Not declare its own its own app lifecycle entry point.
- Export a single root view controller entry point through `ATEmbeddedModule.makeRootViewController()`.
- Keep `prepareIfNeeded()` idempotent so repeated launches are safe.
- Expose a public module prepare entry point so the host can call it before navigation (for example, `ProtokollePrepare.prepareIfNeeded()`).

The contract lives in `Antrag/Modules/ATEmbeddedModule.swift` and is registered in `Antrag/Modules/ATModuleRegistry.swift`.

## Add App #3

1. Create a descriptor in `ATModuleRegistry.swift` that conforms to `ATEmbeddedModule`.
2. Implement:
   - `id`
   - `displayName`
   - optional `subtitle`
   - `prepareIfNeeded()` (idempotent)
   - `makeRootViewController()` (UIKit controller, or `UIHostingController` for SwiftUI roots)
3. Append the descriptor instance to `ATModuleRegistry.all`.

The app picker reads `ATModuleRegistry.all` and routes selection through the module contract.

## App #3 packaged as SwiftPM module

App #3 is now exposed as the local Swift Package `App3/` with public entry points `App3Prepare.prepareIfNeeded()` and `App3RootView` for host embedding through `ATModuleRegistry`.
