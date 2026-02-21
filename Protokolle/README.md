# Protokolle (Internal Module)

> This directory now documents the **internal Protokolle module/package** used by the Antrag host app. It is **not** the primary standalone app release documentation.

## Status

Protokolle has been integrated into the unified Antrag product direction:

- **Host app:** Antrag
- **Integrated module:** Protokolle (embedded/internal package)
- **Primary end-user releases:** Antrag releases

## Release and product direction

- Use Antrag release artifacts as the canonical distribution channel: https://github.com/khcrysalis/Antrag/releases
- Do not treat this README as standalone Protokolle App Store/release guidance for new users.
- Historical standalone Protokolle assets may still exist in-repo during migration, but merged-product messaging should point to Antrag.

## Naming and identifiers

- Keep end-user product branding aligned to **Antrag** for merged releases.
- Keep `Protokolle` naming for internal module APIs/components where needed for compatibility.
- Avoid adding new standalone Protokolle release links in module docs unless explicitly documenting legacy behavior.

## Module purpose

Protokolle provides the in-app log streaming/debugging experience (Console-style UI) consumed by Antrag.

### Core capabilities retained in module form

- Stream and view system logs with filtering.
- Import/export `.protokolle` log files.
- Provide reusable root UI (`ProtokolleRootView`) for host-app presentation.

## Internal development notes

- Protokolle code remains under `Protokolle/` and is linked by Antrag as a local package/module.
- Validate merged behavior from Antrag integration points first (host-driven flow), then validate module internals as needed.
- Keep naming, release references, and docs aligned with the unified product direction over time.

## License

Module code in this repository follows the project license terms from the repository root.
