//
//  AppDelegate.swift
//  syslog
//
//  Created by samara on 14.05.2025.
//

import UIKit
import IDeviceSwift

enum ProtokolleModuleBootstrap {
	private static var hasPrepared = false

	static func prepareIfNeeded() {
		guard !hasPrepared else { return }
		hasPrepared = true
		_createDocumentsDirectory()
		_ = HeartbeatManager.shared
	}

	private static func _createDocumentsDirectory() {
		let fileManager = FileManager.default
		let directory = fileManager.exports
		
		try? fileManager.createDirectory(
			at: directory,
			withIntermediateDirectories: true,
			attributes: nil
		)
	}
}
