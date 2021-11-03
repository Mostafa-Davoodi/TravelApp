//
//  ProfileItemView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/1/21.
//

import UIKit

class ProfileItemView: HStack {
	
	lazy var button: BaseUIButton = {
		let button = BaseUIButton()
		button.setTitleColor(UIColor(hexString: "#9D9EA2"), for: .normal)
		return button
	}()
	
	lazy var arrow: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "arrow")
		return iv
	}()
	
	override func setupView() {
		super.setupView()
		addArrangedSubview(button)
		addArrangedSubview(EmptyView())
		addArrangedSubview(arrow)
		spacing = 16
		widthAnchor.constraint(equalToConstant: 300).isActive = true
	}
	
	func updateView(title: String, imageName: String) {
		button.setTitle(title, for: .normal)
		button.setImage(UIImage(named: imageName), for: .normal)
	}
}

