//
//  ProfileViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/25/21.
//

import UIKit

class ProfileViewController: UIViewController {
	
	lazy var friendsButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("See Friends", for: .normal)
		button.addTarget(self, action: #selector(friendsTapped), for: .touchUpInside)
		button.backgroundColor = .red
		return button
	}()
	
	lazy var contentStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(friendsButton)
		stack.alignment = .center
		return stack
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Profile"
		view.backgroundColor = UIColor.white
		
		view.addSubview(contentStack)
		
		NSLayoutConstraint.activate([
			contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}
	
	@objc func friendsTapped() {
		let friendsVC = FriendsViewController()
		self.navigationController?.pushViewController(friendsVC, animated: true)
	}
}
