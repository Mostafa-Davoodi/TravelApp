//
//  PlaceDetailView.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/9/21.
//

import UIKit
import ComponentKit

class PlaceDetailViewController: UIViewController,
																 UICollectionViewDelegate,
																 UICollectionViewDataSource,
																 UICollectionViewDelegateFlowLayout {
	
	let data = DataProvider.photoDataProvider()
	
	lazy var collectionView: UICollectionView = {
		let viewLayout = UICollectionViewFlowLayout()
		viewLayout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
		cv.backgroundColor = .white
		cv.delegate = self
		cv.dataSource = self
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.showsHorizontalScrollIndicator = false
		cv.heightAnchor.constraint(equalToConstant: 100).isActive = true
		return cv
	}()
	
	lazy var coverImageView: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "popularPlace")
		iv.heightAnchor.constraint(equalToConstant: 300).isActive = true
		return iv
	}()
	
	lazy var titleLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Roberts Creek Park Tiny House"
		return label
	}()
	
	lazy var authorDesc: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Tiny house hosted by Cory Lyne"
		return label
	}()
	
	lazy var authorImageView: BaseUIImageView = {
		let iv = BaseUIImageView()
		iv.image = UIImage(named: "author")
		iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
		iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
		iv.layer.cornerRadius = 30
		return iv
	}()
	
	lazy var photoLabel: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "Photo"
		return label
	}()
	
	lazy var viewAll: BaseUILabel = {
		let label = BaseUILabel()
		label.text = "VIEW ALL"
		return label
	}()
	
	lazy var photoHeaderStack: HStack = {
		let stack = HStack()
		stack.addArrangedSubview(photoLabel)
		stack.addArrangedSubview(viewAll)
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		return stack
	}()
	
	lazy var authorStack: HStack = {
		let stack = HStack()
		stack.addArrangedSubview(authorDesc)
		stack.addArrangedSubview(authorImageView)
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		return stack
	}()
	
	lazy var stack: VStack = {
		let stack = VStack()
		stack.addArrangedSubview(coverImageView)
		stack.addArrangedSubview(authorStack)
		stack.addArrangedSubview(photoHeaderStack)
		stack.addArrangedSubview(collectionView)
		stack.spacing = 18
		return stack
	}()
	
	lazy var scrollView = VScrollableView(content: stack)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		title = "Details"
		
		view.addSubview(scrollView)
		
		NSLayoutConstraint.activate([
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
		
		collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
		cell.imageView.image = data[indexPath.row]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 80, height: 80)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let vc = ImageViewerViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
