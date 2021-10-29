//
//  LoginViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/22/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	lazy var logo: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "appLogo")
		return iv
	}()
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Karen Trip"
		label.textColor = UIColor(hexString: "#42588B")
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		return label
	}()
	
	lazy var emailTF: BaseUITextField = {
		let tf = BaseUITextField()
		tf.placeholder = "Email"
		tf.backgroundColor = UIColor.white
		tf.layer.shadowOpacity = 1.0
		tf.layer.shadowColor = UIColor.lightGray.cgColor
		tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
		tf.layer.cornerRadius = 25
		return tf
	}()
	
	lazy var passTF: BaseUITextField = {
		let tf = BaseUITextField()
		tf.placeholder = "Password"
		tf.backgroundColor = UIColor.white
		tf.layer.shadowOpacity = 1.0
		tf.layer.shadowColor = UIColor.lightGray.cgColor
		tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
		tf.layer.cornerRadius = 25
		return tf
	}()
	
	
	lazy var loginButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("Login", for: .normal)
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.layer.shadowOpacity = 1.0
		button.layer.shadowColor = UIColor.lightGray.cgColor
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.widthAnchor.constraint(equalToConstant: 200).isActive = true
		button.layer.cornerRadius = 25
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		button.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
		return button
	}()
	
	lazy var textFieldStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(emailTF)
		stack.addArrangedSubview(passTF)
		stack.spacing = 20
		stack.widthAnchor.constraint(equalToConstant: 300).isActive = true
		return stack
	}()
	
	lazy var facebookButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("Facebook", for: .normal)
		button.setImage(UIImage(named: "facebook"), for: .normal)
		button.backgroundColor = UIColor(hexString: "#42588B")
		button.layer.shadowOpacity = 1.0
		button.layer.shadowColor = UIColor.lightGray.cgColor
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		button.widthAnchor.constraint(equalToConstant: 140).isActive = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.layer.cornerRadius = 25
		return button
	}()
	
	lazy var twitterButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("Twitter", for: .normal)
		button.setImage(UIImage(named: "twitter"), for: .normal)
		button.backgroundColor = UIColor(hexString: "#0C8FDD")
		button.layer.shadowOpacity = 1.0
		button.layer.shadowColor = UIColor.lightGray.cgColor
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		button.widthAnchor.constraint(equalToConstant: 140).isActive = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.layer.cornerRadius = 25
		return button
	}()
	
	lazy var socialNetworks: HStack = {
		let stack = HStack()
		stack.spacing = 10
		stack.addArrangedSubview(facebookButton)
		stack.addArrangedSubview(twitterButton)
		return stack
	}()
	
	lazy var contentStack: VStack = {
		let stack = VStack()
		
		stack.addArrangedSubview(logo)
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(textFieldStack)
		stack.addArrangedSubview(socialNetworks)
		stack.addArrangedSubview(loginButton)
		stack.spacing = 50
		stack.alignment = .center
		
		return stack
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor(hexString: "#E5E5E5")
		
		view.addSubview(contentStack)
		
		NSLayoutConstraint.activate([
			contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}
	
	@objc func loginHandler() {
		let vc = TabBarViewController()
		AppRouter.navigate(to: vc)
//		let profileVC = ProfileViewController()
//		self.navigationController?.pushViewController(profileVC, animated: true)
	}
}
