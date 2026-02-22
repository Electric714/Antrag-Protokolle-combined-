# Embedding Modules in Antrag

Antrag embeds app modules through a small host-side contract.

## Module contract

Each embedded module must:

- Not declare its own `@main` / app lifecycle entry point.
- Export a single root view controller entry point through `ATEmbeddedModule.makeRootViewController()`.
- Keep `prepareIfNeeded()` idempotent so repeated launches are safe.

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
