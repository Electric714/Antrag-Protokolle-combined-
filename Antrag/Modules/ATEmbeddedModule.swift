import UIKit

protocol ATEmbeddedModule {
	var id: String { get }
	var displayName: String { get }
	var subtitle: String? { get }

	/// Must be idempotent.
	func prepareIfNeeded()
	func makeRootViewController() -> UIViewController
}
