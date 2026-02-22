// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "App3",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v16)
	],
	products: [
		.library(
			name: "App3",
			targets: ["App3"]
		)
	],
	dependencies: [
		.package(path: "../IDeviceKit")
	],
	targets: [
		.target(
			name: "App3",
			dependencies: [
				.product(name: "IDeviceSwift", package: "IDeviceKit")
			],
			path: "Sources/App3",
			resources: [
				.process("Resources")
			]
		)
	]
)
