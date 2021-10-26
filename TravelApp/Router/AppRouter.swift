//
//  AppRouter.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/26/21.
//

import UIKit

class AppRouter {
	static func navigate(to vc: UIViewController) {
		if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
			let nc = UINavigationController(rootViewController: vc)
			nc.navigationBar.tintColor = UIColor(hexString: "#58CFC2")
			sceneDelegate.window?.rootViewController = nc
		}
	}
}
