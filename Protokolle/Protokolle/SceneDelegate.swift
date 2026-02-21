//
//  SceneDelegate.swift
//  syslog
//
//  Created by samara on 14.05.2025.
//

import UIKit
import SwiftUI
import IDeviceSwift

enum ProtokolleURLImportHandler {
	static func handle(_ URLContexts: Set<UIOpenURLContext>) {
		guard
			let url = URLContexts.first?.url,
			url.pathExtension == "protokolle"
		else {
			return
		}
		
		guard
			let data = try? Data(contentsOf: url),
			let decoded = try? JSONDecoder().decode(CodableLogEntry.self, from: data),
			let topController = UIApplication.topViewController()
		else {
			return
		}
		
		let controller = UINavigationController(
			rootViewController: SYStreamDetailViewController(with: decoded.log)
		)
		
		topController.present(
			controller,
			animated: true
		)
	}
}
