//
//  PlaceCell.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/8/21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
	
	lazy var imageView = BaseUIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	
	func setupView() {
		contentView.addSubview(imageView)
		imageView.frame = contentView.frame
	}
	
}
