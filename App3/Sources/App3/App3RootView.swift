import SwiftUI
import UIKit

public struct App3RootView: UIViewControllerRepresentable {
	public init() {}

	public func makeUIViewController(context: Context) -> UIViewController {
		return SYMenuContainerViewController()
	}

	public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
		// no-op
	}
}
