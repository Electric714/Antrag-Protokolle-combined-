//
//  ProtokolleModuleBootstrap.swift
//  syslog
//
//  Created by Codex on 22.02.2026.
//

import Foundation
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
