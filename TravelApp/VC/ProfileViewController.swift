//
//  ProfileViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/25/21.
//

import UIKit

class ProfileViewController: UIViewController {
	
	lazy var avatarView: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.heightAnchor.constraint(equalToConstant: 120).isActive = true
		iv.widthAnchor.constraint(equalToConstant: 120).isActive = true
		iv.layer.cornerRadius = 60
		iv.image = UIImage(named: "1")
		return iv
	}()
	
	lazy var friendsButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("See Friends", for: .normal)
		button.addTarget(self, action: #selector(friendsTapped), for: .touchUpInside)
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.layer.shadowOpacity = 1.0
		button.layer.shadowColor = UIColor.lightGray.cgColor
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.widthAnchor.constraint(equalToConstant: 200).isActive = true
		button.layer.cornerRadius = 25
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		return button
	}()
	
	lazy var contentStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(avatarView)
		stack.addArrangedSubview(friendsButton)
		stack.alignment = .center
		stack.spacing = 120
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
