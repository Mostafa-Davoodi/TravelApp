//
//  EmptyView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/31/21.
//

import UIKit

class EmptyView: BaseUIView {
	override var intrinsicContentSize: CGSize {
		.zero
	}
	
	override func setupView() {
		super.setupView()
		setContentCompressionResistancePriority(.init(1), for: .horizontal)
		setContentCompressionResistancePriority(.init(1), for: .vertical)
		setContentHuggingPriority(.init(1), for: .horizontal)
		setContentHuggingPriority(.init(1), for: .vertical)
	}
}
