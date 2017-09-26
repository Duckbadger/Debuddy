//
//  DebugWindowManager.swift
//  Debuddy
//
//  Created by Ken on 17/08/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation
import UIKit

public class DebugWindowManager {
	
	// MARK: Public
	
	public static let shared = DebugWindowManager()
	
	public private(set) var invokables: [Invokable] = [
		DebugHandler(identifier: "1", title: "Reset data", handler: { print("Reset tapped")}),
		DebugHandler(identifier: "1", title: "Add test models", handler: { print("Add test")})
	]
	
	// MARK: Private

	fileprivate static var openDebuddyGesture: UITapGestureRecognizer = {
		let gesture = UITapGestureRecognizer(target: DebugWindowManager.shared, action: #selector(openDebuddy))
		gesture.numberOfTapsRequired = 2
		gesture.numberOfTouchesRequired = 2
		return gesture
	}()
	
	fileprivate var assignedWindow: UIWindow?
	
}

// MARK: Public functions

extension DebugWindowManager {
	
	public func addDebuddyToWindow(_ window: UIWindow?) {
		removeDebuddy()
		assignedWindow = window
		assignedWindow?.addGestureRecognizer(DebugWindowManager.openDebuddyGesture)
	}
	
	public func removeDebuddy() {
		assignedWindow?.removeGestureRecognizer(DebugWindowManager.openDebuddyGesture)
		assignedWindow = nil
	}
	
	@objc public func openDebuddy() {
		let debuddyStoryboard = UIStoryboard(name: "Debuddy", bundle: nil)
		guard let initialViewController = debuddyStoryboard.instantiateInitialViewController() else {
			return
		}
		assignedWindow?.rootViewController?.present(initialViewController, animated: true, completion: nil)
	}
	
}
