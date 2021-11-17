//
//  AnimationViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/16/21.
//

import UIKit
import Lottie

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
	
	
}

