//
//  TabBarViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/28/21.
//

import UIKit

class TabBarViewController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let profileVC = ProfileViewController()
		
		profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileTab"), tag: 0)
		
		
		let friendsVC = FriendsViewController()
		
		friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "friendsTab"), tag: 1)
		
		
		tabBar.backgroundColor = UIColor(hexString: "#F9F9F9")
		tabBar.tintColor = UIColor(hexString: "#58CFC2")
		
		viewControllers = [profileVC, friendsVC]
	}
	
}
