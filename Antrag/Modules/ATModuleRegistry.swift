import UIKit
import SwiftUI
import Protokolle
import App3

enum ATModuleRegistry {
	static let all: [ATEmbeddedModule] = [
		AntragModule(),
		ProtokolleModule(),
		App3Module()
	]
}

private struct AntragModule: ATEmbeddedModule {
	let id = "antrag"
	let displayName = "Antrag"
	let subtitle: String? = nil

	func prepareIfNeeded() {
		// no-op
	}

	func makeRootViewController() -> UIViewController {
		ATAppsViewController()
	}
}

private struct ProtokolleModule: ATEmbeddedModule {
	let id = "protokolle"
	let displayName = "Protokolle"
	let subtitle: String? = nil

	func prepareIfNeeded() {
		ProtokollePrepare.prepareIfNeeded()
	}

	func makeRootViewController() -> UIViewController {
		let controller = UIHostingController(rootView: ProtokolleRootView())
		controller.title = displayName
		return controller
	}
}

private struct App3Module: ATEmbeddedModule {
	let id = "app3"
	let displayName = "App 3"
	let subtitle: String? = nil

	func prepareIfNeeded() {
		App3Prepare.prepareIfNeeded()
	}

	func makeRootViewController() -> UIViewController {
		let controller = UIHostingController(rootView: App3RootView())
		controller.title = displayName
		return controller
	}
}
