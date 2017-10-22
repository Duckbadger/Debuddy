//
//  DebugTableViewController.swift
//  Debuddy
//
//  Created by Ken Boucher on 26/09/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import UIKit

struct DebuddyStyling {
	static let navigationBarTintColor = #colorLiteral(red: 0.849675715, green: 0.2232977152, blue: 0.2044992745, alpha: 1)
	static let navigationTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

class DebugTableViewController: UITableViewController {
	
	fileprivate let debuddyReuseIdentifier = "DebuddyCellIdentifier"
	
	// MARK: - Initialization
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: debuddyReuseIdentifier)
		configureNavigationBar()
		addDoneButton()
	}
	
	private func addDoneButton() {
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: Debuddy.shared, action: #selector(Debuddy.shared.dismissDebuddy))
		navigationItem.rightBarButtonItem = doneButton
	}
	
	private func configureNavigationBar() {
		title = "Debuddy 🤖"
		navigationController?.navigationBar.barTintColor = DebuddyStyling.navigationBarTintColor
		navigationController?.navigationBar.tintColor = DebuddyStyling.navigationTintColor
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: DebuddyStyling.navigationTintColor]
	}
	
	// MARK: - Tableview delegates
	// MARK: UITableViewDataSource

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Debuddy.shared.invokables.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: debuddyReuseIdentifier, for: indexPath)
		let invokable = Debuddy.shared.invokables[indexPath.row]
		cell.textLabel?.text = invokable.title
		return cell
	}
	
	// MARK: UITableViewDelegate
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let invokable = Debuddy.shared.invokables[indexPath.row]
		invokable.handler()
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
