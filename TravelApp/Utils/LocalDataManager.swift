//
//  LocalDataManager.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/2/21.
//

import Foundation

class LocalDataManager {
	
	static let AUTH_KEY = "isAuthorized"
	static let USERNAME_KEY = "username"
	static let EMAIL_KEY = "email"
	
	static func isOnboarded(flag: Bool) {
		UserDefaults.standard.set(flag, forKey: AUTH_KEY)
	}
	
	static func isOnboarded() -> Bool {
		return UserDefaults.standard.bool(forKey: AUTH_KEY)
	}
	
	
	static func setUsername(userName: String) {
		UserDefaults.standard.set(userName, forKey: USERNAME_KEY)
	}
	
	static func setEmail(email: String) {
		UserDefaults.standard.set(email, forKey: EMAIL_KEY)
	}
	
	static func getUsername() -> String? {
		return UserDefaults.standard.string(forKey: USERNAME_KEY)
	}
	
	static func getEmail() -> String? {
		return UserDefaults.standard.string(forKey: EMAIL_KEY)
	}
	
	static func logout() {
		let defaults = UserDefaults.standard
		defaults.removeObject(forKey: AUTH_KEY)
		defaults.removeObject(forKey: USERNAME_KEY)
		defaults.removeObject(forKey: EMAIL_KEY)
	}
	
}
