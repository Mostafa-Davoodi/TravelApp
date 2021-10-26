//
//  BaseUIButton.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/21/21.
//

import UIKit

class BaseUIButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
	}
}
