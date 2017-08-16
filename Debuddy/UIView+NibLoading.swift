//
//  UIView+NibLoading.swift
//  Debuddy
//
//  Created by Ken on 17/04/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import UIKit

protocol UIViewLoading {}

extension UIView: UIViewLoading {}

extension UIViewLoading where Self: UIView {
	static func loadFromNib() -> Self {
		let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
		guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
			fatalError("nib not provided for view")
		}
		return view
	}
}

protocol UIViewControllerLoading {}

extension UIViewController: UIViewControllerLoading {}

extension UIViewControllerLoading where Self: UIViewController {
	static func loadFromStoryboard() -> Self {
		let board = UIStoryboard(name: String(describing: Self.self), bundle: nil)
		guard let controller = board.instantiateInitialViewController() as? Self else {
			fatalError("nib not provided for view controller")
		}
		return controller
	}
}
