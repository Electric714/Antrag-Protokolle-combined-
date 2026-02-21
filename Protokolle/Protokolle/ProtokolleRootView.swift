//
//  ProtokolleRootView.swift
//  syslog
//
//  Created by Codex on 18.02.2026.
//

import SwiftUI
import UIKit

public struct ProtokolleRootView: UIViewControllerRepresentable {
	public init() {}

	public func makeUIViewController(context: Context) -> UIViewController {
		ProtokolleModuleBootstrap.prepareIfNeeded()
		return SYMenuContainerViewController()
	}

	public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
		// no-op
	}
}
