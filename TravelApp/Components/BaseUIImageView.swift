//
//  BaseUIImageView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/21/21.
//

import UIKit

class BaseUIImageView: UIImageView {
	
	convenience init() {
		self.init(frame: .zero)
		setupView()
	}
	
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
