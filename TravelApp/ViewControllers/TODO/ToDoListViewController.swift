//
//  ToDoListViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/29/21.
//

import UIKit
import Firebase

class ToDoListViewController: UITableViewController {
	
	let ref = Database.database().reference(withPath: "todo-items")
	var refObserver: [DatabaseHandle] = []
	
	
	var items: [ToDo] = []
	var addBarButtonItem = UIBarButtonItem()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		tableView.register(ToDoCell.self, forCellReuseIdentifier: "identifier")
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.parent?.title = "ToDo List"
		
		addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
		
		self.parent?.navigationItem.rightBarButtonItem = addBarButtonItem
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let completed = ref.observe(.value) { snapshot in
			var newItems: [ToDo] = []
			for child in snapshot.children {
				if let snapshot = child as? DataSnapshot,
					 let toDoItem = ToDo(snapshot: snapshot) {
					newItems.append(toDoItem)
				}
			}
			self.items = newItems
			self.tableView.reloadData()
			
		}
		
		refObserver.append(completed)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		refObserver.forEach(ref.removeObserver(withHandle:))
		refObserver = []
	}
	
	@objc func addToDoItem(){
		let alert = UIAlertController(title: "ToDo Item", message: "Add an item", preferredStyle: .alert)
		
		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
			//TODO: save action should be completed here
			if let title = alert.textFields?.first?.text {
				print("value for text field: \(title)")
				let todoItem = ToDo(title: title)
				let toDoItemRef = self.ref.child(title.lowercased())
				toDoItemRef.setValue(todoItem.toAnyObject())
			}
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
		
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
			let toDoItem = items[indexPath.item]
			toDoItem.ref?.removeValue()
		}
	}
}
