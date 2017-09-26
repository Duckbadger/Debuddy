//
//  Invokable.swift
//  Debuddy
//
//  Created by Ken Boucher on 26/09/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation

public typealias InvokableHandler = () -> ()

public protocol Invokable {
	
	var identifier: String { get }
	var title: String { get }
	var handler: InvokableHandler { get }
	
}
