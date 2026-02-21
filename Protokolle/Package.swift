// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "Protokolle",
	platforms: [
		.iOS(.v15)
	],
	products: [
		.library(
			name: "Protokolle",
			targets: ["Protokolle"]
		)
	],
	dependencies: [
		.package(path: "../IDeviceKit")
	],
	targets: [
		.target(
			name: "Protokolle",
			dependencies: [
				.product(name: "IDeviceSwift", package: "IDeviceKit")
			],
			path: "Protokolle",
			resources: [
				.process("Resources/Assets.xcassets"),
				.process("Resources/Settings.bundle"),
				.process("Resources/Localizable.xcstrings")
			]
		)
	]
)
