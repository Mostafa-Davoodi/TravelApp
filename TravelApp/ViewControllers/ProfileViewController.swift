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
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.widthAnchor.constraint(equalToConstant: 200).isActive = true
		button.layer.cornerRadius = 25
		return button
	}()
	
	lazy var logoutButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("Logout", for: .normal)
		button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.widthAnchor.constraint(equalToConstant: 200).isActive = true
		button.layer.cornerRadius = 25
		return button
	}()
	
	lazy var contentStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(friendsButton)
		stack.addArrangedSubview(logoutButton)
		stack.alignment = .center
		stack.spacing = 20
		return stack
	}()
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		self.parent?.title = "Profile"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
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
	
	@objc func logoutTapped() {
		AppRouter.navigate(to: WelcomeViewController())
	}
}
