//
//  ToDoListViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/27/21.
//

import UIKit
import Firebase

class ToDoListViewController: UITableViewController {
	
	let ref = Database.database().reference(withPath: "todo-items")
	var refObservers: [DatabaseHandle] = []
	
	let usersRef = Database.database().reference(withPath: "online")
	var usersRefObservers: [DatabaseHandle] = []

	// MARK: Properties
	var items: [ToDo] = []
	var user: CurrentUser?
	var onlineUserCount = UIBarButtonItem()
	var handle: AuthStateDidChangeListenerHandle?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		tableView.register(ToDoCell.self, forCellReuseIdentifier: "identifier")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
//		let completed = ref.observe(.value) { snapshot in
//			var newItems: [ToDo] = []
//			for child in snapshot.children {
//				if
//					let snapshot = child as? DataSnapshot,
//					let groceryItem = ToDo(snapshot: snapshot) {
//					newItems.append(groceryItem)
//				}
//			}
//			self.items = newItems
//			self.tableView.reloadData()
//		}
//		refObservers.append(completed)
//
		let completed = ref
			.queryOrdered(byChild: "isCompleted")
			.observe(.value) { snapshot in
				var newItems: [ToDo] = []
				for child in snapshot.children {
					if
						let snapshot = child as? DataSnapshot,
						let todoItem = ToDo(snapshot: snapshot) {
						newItems.append(todoItem)
					}
				}
				self.items = newItems
				self.tableView.reloadData()
			}
		refObservers.append(completed)
		
		handle = Auth.auth().addStateDidChangeListener { _, user in
			guard let user = user else { return }
			self.user = CurrentUser(authData: user)

			let currentUserRef = self.usersRef.child(user.uid)
			currentUserRef.setValue(user.email)
			currentUserRef.onDisconnectRemoveValue()
		}

		let users = usersRef.observe(.value) { snapshot in
			if snapshot.exists() {
				self.onlineUserCount.title = snapshot.childrenCount.description
			} else {
				self.onlineUserCount.title = "0"
			}
		}
		usersRefObservers.append(users)
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(true)
		refObservers.forEach(ref.removeObserver(withHandle:))
		refObservers = []
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		
		self.parent?.title = "ToDo List"
		
		self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
	}
	
	
	@objc func addToDoItem() {
		
		let alert = UIAlertController(
			title: "ToDo Item",
			message: "Add an Item",
			preferredStyle: .alert)

		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in

			if let title = alert.textFields?.first?.text,
				 let currUser = self.user {
				let todo = ToDo(title: title, addedByUser: currUser.email)
				// save todo item
				let todoItemRef = self.ref.child(title.lowercased())
				todoItemRef.setValue(todo.toAnyObject())
			}
			
		}

		let cancelAction = UIAlertAction(
			title: "Cancel",
			style: .cancel)

		alert.addTextField()
		alert.addAction(saveAction)
		alert.addAction(cancelAction)

		present(alert, animated: true, completion: nil)
		
		
	}
	
}

extension ToDoListViewController {
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat(120)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! ToDoCell
		cell.updateView(data: items[indexPath.item])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let todoItem = items[indexPath.row]
			todoItem.ref?.removeValue()
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		items[indexPath.row].isCompleted.toggle()
		tableView.reloadRows(at: [indexPath], with: .fade)
		items[indexPath.row].ref?.updateChildValues(["isCompleted": items[indexPath.row].isCompleted])
	}
}
