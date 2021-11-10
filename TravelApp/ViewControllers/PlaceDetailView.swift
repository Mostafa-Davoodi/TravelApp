//
//  PlaceDetailView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/9/21.
//

import UIKit

class PlaceDetailView: UIViewController {
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "HERE IS MY TITLE"
		label.textColor = .black
		return label
	}()
	
	lazy var stack: VStack = {
		let stack = VStack()
		let imageView = BaseUIImageView()
		imageView.image = UIImage(named: "image")
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(imageView)
		stack.backgroundColor = .blue
		return stack
	}()
	
	lazy var scrollView = VScrollableView(content: stack)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(scrollView)
		
		NSLayoutConstraint.activate([
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
}
