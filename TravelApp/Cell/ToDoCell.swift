//
//  ToDoCell.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/29/21.
//

import UIKit
import ComponentKit

class ToDoCell: UITableViewCell {
	
	lazy var checkState: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.heightAnchor.constraint(equalToConstant: 20).isActive = true
		iv.widthAnchor.constraint(equalToConstant: 20).isActive = true
		return iv
	}()
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.font = UIFont.preferredFont(forTextStyle: .headline)
		return label
	}()
	
	lazy var contentStack: HStack = {
		let stack = HStack()
		stack.addArrangedSubview(titleLabel)
		stack.addArrangedSubview(EmptyView())
		stack.addArrangedSubview(checkState)
		stack.alignment = .center
		return stack
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	func setupView() {
		contentView.addSubview(contentStack)
		NSLayoutConstraint.activate([
			contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
			contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
		
	}
	
	func updateView(data: ToDo) {
		titleLabel.text = data.title
		// checkState.image = data.isCompleted ? UIImage(named: "check") : nil
		accessoryType = data.isCompleted ? .checkmark : .none
	}
	
}


