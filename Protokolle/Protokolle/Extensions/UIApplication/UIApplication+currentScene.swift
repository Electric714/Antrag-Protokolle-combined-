//
//  UIApplication+currentScene.swift
//  syslog
//
//  Created by samara on 22.05.2025.
//

import UIKit.UIApplication

extension UIApplication {
	static var currentScene: UIScene? {
		UIApplication.shared.connectedScenes
			.first(where: { $0.activationState == .foregroundActive })
	}
}
