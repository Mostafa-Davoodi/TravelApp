//
//  AnimationViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/16/21.
//

import UIKit
import Lottie
import ComponentKit

class AnimationViewController: UIViewController {
	
	lazy var animationView: AnimationView = {
		let anim = AnimationView(name: "animation")
		anim.translatesAutoresizingMaskIntoConstraints = false
		anim.play(toFrame: .infinity)
		anim.loopMode = .loop
		anim.contentMode = .scaleAspectFit
		return anim
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		view.addSubview(animationView)
		
		NSLayoutConstraint.activate([
			animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			animationView.topAnchor.constraint(equalTo: view.topAnchor),
		])
		
		
		animationView.play()
		
	}
	
//	func checkDifferentScenarios() {
//		let userJson = Serializer.rawUserJson()
//		let arrayJson = Serializer.rawUserArrayJson()
//
//		// #1
//		if let user = Serializer.deserialize(jsonString: userJson) {
//			print(user.firstName)
//			print(user.lastName)
//			print(user.country)
//		}
//
//		// #2
//		let array = Serializer.deserializeArray(jsonString: arrayJson)
//		print("count is \(array.count)")
//		print(array[0].firstName)
//		print(array[0].lastName)
//		print(array[0].country)
//
//		// #3
//		let user = NewUser(firstName: "ALI", lastName: "DAEI", country: "IRAN")
//		if let jsonValue = Serializer.serialize(user: user) {
//			print(jsonValue)
//		}
//		
//
//	}
	
	
}

