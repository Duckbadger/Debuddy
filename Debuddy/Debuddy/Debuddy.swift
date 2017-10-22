//
//  Debuddy.swift
//  Debuddy
//
//  Created by Ken on 17/08/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import Foundation
import UIKit

public class Debuddy {
	
	// MARK: Public
	
	/// Singleton to access Debuddy
	public static let shared = Debuddy()
	
	/// Invokables are presented in the debug view and are invoked on selection
	public var invokables: [Invokable] = []
	
	/// Default implementation is a double 2 finger tap to open up Debuddy on the assigned window
	public static var openDebuddyGesture: UITapGestureRecognizer = {
		let gesture = UITapGestureRecognizer(target: Debuddy.shared, action: #selector(showDebuddy))
		gesture.numberOfTapsRequired = 2
		gesture.numberOfTouchesRequired = 2
		return gesture
	}()
	
	/// Defines whether the debug view is presented
	public private(set) var isPresented: Bool = false

	// MARK: Private

	fileprivate var assignedWindow: UIWindow?
	fileprivate var rootDebuddyViewController: UINavigationController = {
		let rootViewController = DebugTableViewController()
		let navigationController = UINavigationController(rootViewController: rootViewController)
		return navigationController
	}()
	
}

// MARK: Public functions

extension Debuddy {
	
	/// Default entry point to setup Debuddy for the given window.
	/// The default gesture recognizer is applied to the window, the debug view will appear on top as a modal presentation
	///
	/// - Parameter window: A `UIWindow` to assign to Debuddy
	public func addDebuddyToWindow(_ window: UIWindow?) {
		removeDebuddy()
		assignedWindow = window
		assignedWindow?.addGestureRecognizer(Debuddy.openDebuddyGesture)
	}
	
	/// Removes Debuddy from the window it was originally applied to.
	public func removeDebuddy() {
		assignedWindow?.removeGestureRecognizer(Debuddy.openDebuddyGesture)
		assignedWindow = nil
	}
	
	/// Presents the debug view via modal
	@objc public func showDebuddy() {
		guard !isPresented else { return }
		isPresented = true
		assignedWindow?.rootViewController?.present(rootDebuddyViewController, animated: true, completion: nil)
	}
	
	/// Dismisses the debug view
	@objc public func dismissDebuddy() {
		isPresented = false
		rootDebuddyViewController.dismiss(animated: true, completion: nil)
	}
	
}
