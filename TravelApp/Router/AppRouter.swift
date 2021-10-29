//
//  AppRouter.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/28/21.
//

import UIKit

class AppRouter {
	
	static func navigate(to vc: UIViewController) {
		if let scenceDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
			let nc = UINavigationController(rootViewController: vc)
			scenceDelegate.window?.rootViewController = nc
		}
	}
	
}
