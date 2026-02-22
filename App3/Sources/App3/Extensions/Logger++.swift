//
//  Logger++.swift
//  Feather
//
//  Created by samara on 24.05.2025.
//

import OSLog

extension Logger {
	private static var subsystem = Bundle.module.bundleIdentifier ?? "App3"
	static let misc = Logger(subsystem: subsystem, category: "Misc")
}
