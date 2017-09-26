//
//  DebugWindowManager.swift
//  Debuddy
//
//  Created by Ken on 17/08/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation

public class DebugWindowManager {
	
	// MARK: Public
	
	public static let shared = DebugWindowManager()
	
	// MARK: Private
	
	public private(set) var invokables: [Invokable] = [
		DebugHandler(identifier: "1", title: "Reset data", handler: { print("Reset tapped")}),
		DebugHandler(identifier: "1", title: "Add test models", handler: { print("Add test")})
	]
	
}

// MARK: Public functions

extension DebugWindowManager {
	
}
