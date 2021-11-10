//
//  VScrollableView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/9/21.
//

import UIKit

class VScrollableView: ScrollableView {
	override func setupView() {
		super.setupView()

		NSLayoutConstraint.activate([
			contentWrapper.widthAnchor.constraint(equalTo: widthAnchor),
		])

		alwaysBounceVertical = true
	}
}
