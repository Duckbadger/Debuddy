//
//  AppDelegate.swift
//  Debuddy
//
//  Created by Ken on 14/04/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
		
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		DebugWindowManager.shared.addDebuddyToWindow(window)
		DebugWindowManager.shared.invokables = debuddyInvokables()
		return true
	}
	
	private func debuddyInvokables() -> [Invokable] {
		return [
			DebugHandler(identifier: "1", title: "Reset data", handler: { print("Reset tapped")}),
			DebugHandler(identifier: "1", title: "Add test models", handler: { print("Add test")})
		]
	}
	
}
