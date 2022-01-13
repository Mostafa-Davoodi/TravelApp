//
//  WelcomeViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/21/21.
//

import UIKit
import ComponentKit
import Foundation
import AVFoundation

class WelcomeViewController: UIViewController {
	
	lazy var imageView: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "logo")
		return iv
	}()
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Plan your trips"
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		return label
	}()
	
	lazy var descriptionLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "For the best trip, simply specify your plan."
		label.textColor = UIColor(hexString: "#B3B5B9")
		return label
	}()
	
	lazy var labelsStack: VStack = {
		let stack = VStack()
		stack.spacing = 20
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(descriptionLabel)
		stack.alignment = .center
		return stack
	}()
	
	lazy var loginButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("LOGIN", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.layer.cornerRadius = 20
		button.heightAnchor.constraint(equalToConstant: 40).isActive = true
		button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
		button.layer.shadowOpacity = 0.5
		button.layer.shadowColor = UIColor.lightGray.cgColor
		return button
	}()
	
	lazy var signUpButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("SIGN UP", for: .normal)
		button.setTitleColor(UIColor(hexString: "#8C8A8D"), for: .normal)
		button.backgroundColor = UIColor.white
		button.layer.cornerRadius = 20
		button.heightAnchor.constraint(equalToConstant: 40).isActive = true
		button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
		button.layer.shadowOpacity = 0.5
		button.layer.shadowColor = UIColor.lightGray.cgColor
		return button
	}()
	
	lazy var buttonsStack: VStack = {
		let stack = VStack()
		stack.spacing = 20
		stack.addArrangedSubview(loginButton)
		stack.addArrangedSubview(signUpButton)
		stack.widthAnchor.constraint(equalToConstant: 260).isActive = true
		return stack
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Welcome"
		view.backgroundColor = UIColor.white
		
		view.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			imageView.heightAnchor.constraint(equalToConstant: 200),
		])
		
		
		view.addSubview(labelsStack)
		NSLayoutConstraint.activate([
			labelsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			labelsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		
		
		view.addSubview(buttonsStack)
		NSLayoutConstraint.activate([
			buttonsStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
			buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
	}
	
	@objc func signUpTapped() {
		let signUpViewController = SignUpViewController()
		self.navigationController?.pushViewController(signUpViewController, animated: true)
	}
	
	@objc func loginTapped() {
		let loginViewController = LoginViewController()
		self.navigationController?.pushViewController(loginViewController, animated: true)
	}
}
