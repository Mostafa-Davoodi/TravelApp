//
//  ProfileViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/25/21.
//

import UIKit

class ProfileViewController: UIViewController {
	
	lazy var avatarView: BaseUIImageView = {
		let avatar = BaseUIImageView()
		avatar.image = UIImage(named: "placeholder")
		avatar.heightAnchor.constraint(equalToConstant: 160).isActive = true
		avatar.widthAnchor.constraint(equalToConstant: 160).isActive = true
		avatar.layer.cornerRadius = 80
		return avatar
	}()
	
	lazy var usernameLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = LocalDataManager.getUsername()
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		return label
	}()
	
//	lazy var manageProfileButton: BaseUIButton = {
//		let button = BaseUIButton()
//		button.setTitle("Manage profile", for: .normal)
//		button.setImage(UIImage(named: "profileMenu"), for: .normal)
//		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
//		return button
//	}()
//
//	lazy var paymentButton: BaseUIButton = {
//		let button = BaseUIButton()
//		button.setTitle("Payment", for: .normal)
//		button.setImage(UIImage(named: "paymentMenu"), for: .normal)
//		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
//		return button
//	}()
//
//	lazy var notificationButton: BaseUIButton = {
//		let button = BaseUIButton()
//		button.setTitle("Notification", for: .normal)
//		button.setImage(UIImage(named: "notificationMenu"), for: .normal)
//		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
//		return button
//	}()
//
//	lazy var friendsButton: BaseUIButton = {
//		let button = BaseUIButton()
//		button.setTitle("Friends", for: .normal)
//		button.setImage(UIImage(named: "friendsMenu"), for: .normal)
//		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
//		return button
//	}()
//
//	lazy var logoutButton: BaseUIButton = {
//		let button = BaseUIButton()
//		button.setTitle("Logout", for: .normal)
//		button.setImage(UIImage(named: "logoutMenu"), for: .normal)
//		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
//		return button
//	}()
	lazy var myAccountLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "My account"
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		return label
	}()
	
	lazy var notificationLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Notification"
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		return label
	}()
	
	lazy var moreLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "More"
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		return label
	}()
	
	lazy var manageProfileItem = ProfileItemView()
	lazy var paymentItem = ProfileItemView()
	lazy var notificationItem = ProfileItemView()
	lazy var friendsItem = ProfileItemView()
	lazy var logoutItem = ProfileItemView()
	
	lazy var profileMenu: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(myAccountLabel)
		stack.addArrangedSubview(manageProfileItem)
		stack.addArrangedSubview(paymentItem)
		stack.addArrangedSubview(notificationLabel)
		stack.addArrangedSubview(notificationItem)
		stack.addArrangedSubview(moreLabel)
		stack.addArrangedSubview(friendsItem)
		stack.addArrangedSubview(logoutItem)
		stack.spacing = 20
		stack.layer.shadowOpacity = 1.0
		stack.layer.shadowColor = UIColor.lightGray.cgColor
		stack.backgroundColor = .white
		stack.layer.cornerRadius = 25
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		stack.alignment = .leading
		return stack
	}()

	
	lazy var contentStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(avatarView)
		stack.addArrangedSubview(usernameLabel)
		stack.addArrangedSubview(profileMenu)
		stack.alignment = .center
		stack.spacing = 40
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
		
		
		manageProfileItem.updateView(title: "Manage profile", imageName: "profileMenu")
		paymentItem.updateView(title: "Payment", imageName: "paymentMenu")
		notificationItem.updateView(title: "Notification", imageName: "notificationMenu")
		friendsItem.updateView(title: "Friends", imageName: "friendsMenu")
		logoutItem.updateView(title: "Logout", imageName: "logoutMenu")
		
		logoutItem.button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
	}
	
	@objc func logoutTapped() {
		
		let alertViewController = UIAlertController(title: "Logout", message: "Do you want to logout from the App?", preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Close", style: .cancel) { action in
			print("close happened")
		}
		let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
			LocalDataManager.logout()
			AppRouter.navigate(to: WelcomeViewController())
		}
		alertViewController.addAction(cancelAction)
		alertViewController.addAction(yesAction)
		self.navigationController?.present(alertViewController, animated: true, completion: nil)
		
	}
	
}
