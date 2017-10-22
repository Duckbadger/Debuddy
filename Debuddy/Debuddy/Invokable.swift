//
//  Invokable.swift
//  Debuddy
//
//  Created by Ken Boucher on 26/09/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation

/// Default invokable handler
public typealias InvokableHandler = () -> ()

/// Invokable defines a title and handler for the DebugWindowManager to present and invoke
public protocol Invokable {
	var title: String { get }
	var handler: InvokableHandler { get }
}
