import UIKit
import SwiftUI
import Protokolle

enum ATModuleRegistry {
	static let all: [ATEmbeddedModule] = [
		AntragModule(),
		ProtokolleModule()
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
