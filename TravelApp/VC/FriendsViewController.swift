//
//  FriendsViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/22/21.
//

import UIKit

class FriendsViewController: UITableViewController {
	
	let data = DataProvider.makeData()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Friends"
		view.backgroundColor = UIColor.white
		
		tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return data.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let sectionData = data[section]
		return sectionData.1.count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendCell
		
		let cellData = data[indexPath.section].1[indexPath.row]
		
		cell.nickNameLabel.text = cellData.nickName
		cell.locationLabel.text = cellData.location
		cell.ageLabel.text = cellData.age
		cell.avatarView.image = cellData.image

		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return data[section].0
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cellData = data[indexPath.section].1[indexPath.row]
		
		let alertViewController = UIAlertController(title: cellData.nickName, message: "You select this person", preferredStyle: .alert)
		let action = UIAlertAction(title: "Close", style: .cancel) { action in
			print("completion happened")
		}
		alertViewController.addAction(action)
		self.navigationController?.present(alertViewController, animated: true, completion: nil)
	}
	
}
