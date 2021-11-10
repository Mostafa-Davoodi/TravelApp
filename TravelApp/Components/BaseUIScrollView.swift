//
//  BaseUIScrollView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/9/21.
//

import UIKit

class BaseUIScrollView: UIScrollView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}

	open func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
	}
	
}

