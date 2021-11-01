//
//  BaseUIView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/31/21.
//

import UIKit

class BaseUIView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
	}
}
