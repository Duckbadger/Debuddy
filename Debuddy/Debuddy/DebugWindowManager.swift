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
	
	public var invokables: [Invokable] = []
	
	public static var openDebuddyGesture: UITapGestureRecognizer = {
		let gesture = UITapGestureRecognizer(target: DebugWindowManager.shared, action: #selector(openDebuddy))
		gesture.numberOfTapsRequired = 2
		gesture.numberOfTouchesRequired = 2
		return gesture
	}()

	// MARK: Private

	fileprivate var assignedWindow: UIWindow?
	fileprivate var rootDebuddyViewController: UIViewController?
	
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
		rootDebuddyViewController = debuddyStoryboard.instantiateInitialViewController()
		guard let initialViewController = rootDebuddyViewController else {
			return
		}
		assignedWindow?.rootViewController?.present(initialViewController, animated: true, completion: nil)
	}
	
	public func dismissDebuddy() {
		rootDebuddyViewController?.dismiss(animated: true, completion: nil)
	}
	
}
