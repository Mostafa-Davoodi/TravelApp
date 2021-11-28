//
//  ProfileViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/25/21.
//

import UIKit
import ComponentKit
import Firebase

class ProfileViewController: UIViewController {
	

	lazy var avatarView: BaseUIImageView = {
		let avatar = BaseUIImageView()
		avatar.image = UIImage(named: "placeHolder")
		avatar.heightAnchor.constraint(equalToConstant: 160).isActive = true
		avatar.widthAnchor.constraint(equalToConstant: 160).isActive = true
		avatar.layer.cornerRadius = 80
		return avatar
	}()
	
	lazy var usernameLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		label.text = LocalDataManager.getUsername()
		return label
	}()
	
	lazy var myAccountLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "My Account"
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
		stack.backgroundColor = UIColor.white
		stack.layer.cornerRadius = 25
		stack.alignment = .leading
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		return stack
	}()
	
	
	lazy var contentStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(avatarView)
		stack.addArrangedSubview(usernameLabel)
		stack.addArrangedSubview(profileMenu)
		stack.spacing = 40
		stack.alignment = .center
		return stack
	}()

	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		self.parent?.title = "Profile"
		self.parent?.navigationItem.rightBarButtonItems = []
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.white
		
		view.addSubview(contentStack)
		
		NSLayoutConstraint.activate([
			contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		
		
		
		manageProfileItem.updateView(title: "Manage profile", imageName: "manageProfileItem")
		paymentItem.updateView(title: "Payment", imageName: "paymentItem")
		notificationItem.updateView(title: "Notification", imageName: "notificationItem")
		friendsItem.updateView(title: "Friends", imageName: "friendsItem")
		logoutItem.updateView(title: "Logout", imageName: "logoutItem")
		
		
		logoutItem.button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
	}
	
	
//	@objc func logoutTapped() {
//		let alertViewController = UIAlertController(title: "logout", message: "Do you want to logout from the app?", preferredStyle: .alert)
//
//		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//		let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
//			LocalDataManager.logout()
//			let vc = WelcomeViewController()
//			AppRouter.navigate(to: vc)
//		}
//
//		alertViewController.addAction(cancelAction)
//		alertViewController.addAction(yesAction)
//
//		self.navigationController?.present(alertViewController, animated: true, completion: nil)
//	}
	
	@objc func logoutTapped() {
		let alertViewController = UIAlertController(title: "logout", message: "Do you want to logout from the app?", preferredStyle: .alert)

		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

		let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
			self.logoutHandler()
		}

		alertViewController.addAction(cancelAction)
		alertViewController.addAction(yesAction)

		self.navigationController?.present(alertViewController, animated: true, completion: nil)
	}
	
	func logoutHandler() {
		guard let user = Auth.auth().currentUser else { return }

		let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
		onlineRef.removeValue { error, _ in
			if let error = error {
				print("Removing online failed: \(error)")
				return
			}
			do {
				try Auth.auth().signOut()
				let vc = WelcomeViewController()
				AppRouter.navigate(to: vc)
			} catch let error {
				print("Auth sign out failed: \(error)")
			}
		}
	}
	
}
