//
//  TabBarViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/28/21.
//

import UIKit
import ComponentKit

class TabBarViewController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let homeVC = HomeViewController()
		
		homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeTab"), tag: 0)
		
		
		let profileVC = ProfileViewController()
		
		profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileTab"), tag: 1)
		
		let toDoVC = ToDoListViewController()
		
		toDoVC.tabBarItem = UITabBarItem(title: "To Do", image: UIImage(named: "homeTab"), tag: 2)
		
		
		let friendsVC = FriendsViewController()
		
		friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "friendsTab"), tag: 3)
		
		
		
		
		tabBar.backgroundColor = UIColor(hexString: "#F9F9F9")
		tabBar.tintColor = UIColor(hexString: "#58CFC2")
		
		viewControllers = [homeVC, profileVC, toDoVC, friendsVC]
		
		
		Networking.sampleApi()
	}
	
}
