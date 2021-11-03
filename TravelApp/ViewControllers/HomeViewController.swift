//
//  HomeViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/1/21.
//

import UIKit

class HomeViewController: UIViewController {
	
	lazy var headerImageView: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "home")
		return iv
	}()
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Vancouver"
		label.textColor = UIColor.white
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		return label
	}()
	
	lazy var descriptionLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "A beautiful place in the west of Canada"
		label.textColor = UIColor.white
		label.font = UIFont.preferredFont(forTextStyle: .caption1)
		label.numberOfLines = 0
		return label
	}()
	
	lazy var startButton: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitle("start", for: .normal)
		button.backgroundColor = UIColor(hexString: "#58CFC2")
		button.widthAnchor.constraint(equalToConstant: 100).isActive = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.layer.cornerRadius = 25
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		return button
	}()
	
	lazy var descStack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(descriptionLabel)
		stack.addArrangedSubview(startButton)
		stack.spacing = 16
		return stack
	}()
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		self.parent?.title = "Home"
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.white
		view.addSubview(headerImageView)
		
		NSLayoutConstraint.activate([
			headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			headerImageView.topAnchor.constraint(equalTo: view.topAnchor),
			headerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3)
		])
		
		headerImageView.addSubview(descStack)
		NSLayoutConstraint.activate([
			descStack.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
			descStack.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -20),
			descStack.widthAnchor.constraint(equalToConstant: 200)
		])
		
	}
	
}
