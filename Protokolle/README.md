# Protokolle

[![GitHub Release](https://img.shields.io/github/v/release/khcrysalis/protokolle?include_prereleases)](https://github.com/khcrysalis/protokolle/releases)
[![GitHub License](https://img.shields.io/github/license/khcrysalis/protokolle?color=%23C96FAD)](https://github.com/khcrysalis/protokolle/blob/main/LICENSE)

|					![Demo of streaming trace logs](demo.webp)						 |
| :----------------------------------------------------------------------------------------: |
| Demo of streaming trace logs from [Feather](https://github.com/khcrysalis/feather) |

The iOS/iPadOS equivalent to macOS's `Console.app`. This app uses [idevice](https://github.com/jkcoxson/idevice) and lockdownd pairing to stream messages from the trace relay, allowing you to see messages from other processes within iOS. Along with having advanced filtering and options for advanced debugging and performance.

### Features

- Stream system logs (messages)
- View system logs with immense detail (i.e. `pid`, `name`, `message`, `sendor`, `date`, `type`).
- Advanced filtering options for log types, keywords, and process ID's.
- Performance options for logs, to prevent any excessive ram usage, and general usability of the app.
- Ability to import/export logs to be viewed later.
- Of course, open source and free.

## Download

<a href="https://apps.apple.com/us/app/protokolle/id6746388316" target="_blank" rel="noopener noreferrer">
    <img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" alt="Download on the App Store" style="width: 200px; height: auto;">
</a>

## How does it work?
- Establish a heartbeat with a TCP provider (the app will need this for later).
  - For it to be successful, we need a pairing file from [PlumeImpactor](https://github.com/khcrysalis/Impactor?tab=readme-ov-file#pairing-file) and a [VPN](https://apps.apple.com/us/app/localdevvpn/id6755608044).
  - Once we have these and the connection was successfully established, we can move on to the streaming part.
  - Before streaming, we need to check for the connection to the socket that has been created, routed to `10.7.0.1`, if this succeeds we're ready.
- When preparing the stream, we need to establish another connection but for `syslog_relay` using our TCP provider and heartbeat provider.
- Then using out connection use a loop to get each message and feed it to a delegate, where its used to update our UI.

Due to how it works right now we need both a VPN and a lockdownd pairing file, this means you will need a computer for its initial setup.

## Legacy status in this repository

The standalone `Protokolle` Xcode app target is legacy in this combined repository. `Protokolle` is maintained as a reusable Swift package module boundary via `Package.swift`, and distribution is handled by the root `Antrag` app target.

## Building

#### Minimum requirements

- Xcode 16
- Swift 5.9
- iOS 16

1. Clone repository
    ```sh
    git clone https://github.com/khcrysalis/Antrag-Protokolle-combined-
    ```

2. Build distributable app output
    ```sh
    gmake
    ```

3. Use as a package module
    - Add local package dependency from `Protokolle/Package.swift`.

This repository no longer ships a standalone `Protokolle` IPA path. Distribution output is unified under the root app build.

## Sponsors

| Thanks to all my [sponsors](https://github.com/sponsors/khcrysalis)!! |
|:-:|
| <img src="https://raw.githubusercontent.com/khcrysalis/github-sponsor-graph/main/graph.png"> |
| _**"samara is cute" - Vendicated**_ |

## Acknowledgements

- [Samara](https://github.com/khcrysalis) - The maker
- [Antoine](https://github.com/NSAntoine/Antoine) - Code for filtering, refresh, and the sole reason why I even made this.
- [idevice](https://github.com/jkcoxson/idevice) - Backend functionality, uses `os_trace_relay` to retrieve messages.

## License 

This project is licensed under the GPL-3.0 license. You can see the full details of the license [here](https://github.com/khcrysalis/Feather/blob/main/LICENSE). Code from Antoine is going to be under MIT, if you figure out where that is.

By contributing to this project, you agree to license your code under the GPL-3.0 license as well (including agreeing to license exceptions), ensuring that your work, like all other contributions, remains freely accessible and open.
