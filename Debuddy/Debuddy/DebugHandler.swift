//
//  DebugHandler.swift
//  Debuddy
//
//  Created by Ken Boucher on 26/09/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation

/// Default invokable handler to pass to the DebugManager
public struct DebugHandler: Invokable {
	public let title: String
	public let handler: InvokableHandler
}
