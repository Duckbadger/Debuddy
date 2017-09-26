//
//  DebugTableViewController.swift
//  Debuddy
//
//  Created by Ken Boucher on 26/09/2017.
//  Copyright © 2017 Ken Boucher. All rights reserved.
//

import UIKit

class DebugTableViewController: UITableViewController {
	
	fileprivate let debuddyReuseIdentifier = "DebuddyCellIdentifier"
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DebugWindowManager.shared.invokables.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: debuddyReuseIdentifier, for: indexPath)
		let invokable = DebugWindowManager.shared.invokables[indexPath.row]
		cell.textLabel?.text = invokable.title
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let invokable = DebugWindowManager.shared.invokables[indexPath.row]
		invokable.handler()
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
