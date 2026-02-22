

Antrag is the **host iOS/iPadOS app** in this repository. The former standalone Protokolle app is integrated into Antrag as an **internal module/package** and is launched from within the host app UI.

The unified app uses [idevice](https://github.com/jkcoxson/idevice) and lockdownd pairing to interact with on-device services.

### Features

- Antrag host app functionality for listing, opening, and deleting "System" and "User" apps.
- App inspection features such as entitlements, signing identity, and additional app metadata.
- Integrated Protokolle log-streaming experience available from inside Antrag.

## Integration status

### Already merged

- Protokolle source is included in this repository as an internal module under `Protokolle/`.
- Antrag links the Protokolle package and can present the Protokolle root view from the host application.
- Development now happens in a unified repository with Antrag as the product entry point.

### Remaining alignment work

- Finish consolidating release/distribution messaging so all end-user release links point to Antrag.
- Continue reducing stale standalone-Protokolle release language in secondary docs/scripts where still present.
- Final cleanup of naming/bundle/release references across historical files that are no longer part of the merged release path.


## Product identifiers and naming

- Canonical product/app name: **Antrag** (host app).
- Integrated feature/module name: **Protokolle** (internal module naming in code/UI).
- Host app bundle identifier in project settings: `thewonderofyou.antrag2`.
- Public release links in this README intentionally target Antrag (not standalone Protokolle releases).

## Build (canonical path for unified app)

> Use this single build path for the merged product. Do not use separate standalone build instructions for Protokolle when building the integrated app.

#### Minimum requirements

- Xcode 16+
- Swift 5.9+
- iOS 16+

```sh
git clone https://github.com/khcrysalis/Antrag.git
cd Antrag
xcodebuild -resolvePackageDependencies -workspace Antrag.xcworkspace -scheme Antrag
xcodebuild clean archive \
  -workspace Antrag.xcworkspace \
  -scheme Antrag \
  -configuration Release \
  -sdk iphoneos \
  -archivePath "$PWD/build/Antrag.xcarchive" \
  CODE_SIGNING_ALLOWED=NO
```

The archive produced above is the canonical CI output for the unified app. If you also need an unsigned IPA in CI, run export as a separate step using an export options plist that matches your distribution method.

## How does it work?

- Establish a heartbeat with a TCP provider.
  - For this to succeed, you need a pairing file from [PlumeImpactor](https://github.com/khcrysalis/Impactor?tab=readme-ov-file#pairing-file) and a [VPN](https://apps.apple.com/us/app/localdevvpn/id6755608044).
- For app listing, Antrag opens an `installation_proxy` connection via the heartbeat provider.
- For logging, the integrated Protokolle module opens `syslog_relay`/trace relay services and streams messages into the in-app UI.

Due to current architecture, you still need both a VPN and a lockdownd pairing file for initial setup.

