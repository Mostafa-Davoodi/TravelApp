//
//  PlaceCell.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/8/21.
//

import UIKit

class PlaceCell: UICollectionViewCell {
	
	lazy var imageView = BaseUIImageView()
	
	lazy var nameLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		label.textColor = UIColor.white
		return label
	}()
	
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
		
		
		imageView.addSubview(nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
			nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 20),
		])
		
	}
	
}
