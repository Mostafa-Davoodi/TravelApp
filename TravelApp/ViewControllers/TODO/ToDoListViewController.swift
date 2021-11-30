//
//  ToDoListViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/29/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
	
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
	
	@objc func addToDoItem(){
		let alert = UIAlertController(title: "ToDO Item", message: "Add an item", preferredStyle: .alert)
		
		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
			//TODO: save action should be completed here
			if let title = alert.textFields?.first?.text {
				print("value for text field: \(title)")
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
}
