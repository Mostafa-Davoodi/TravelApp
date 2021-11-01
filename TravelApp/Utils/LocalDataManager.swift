//
//  LocalDataManager.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 10/31/21.
//

import Foundation

class LocalDataManager {
	
	static let AUTH_KEY = "isAuthorized"
	static let EMAIL_KEY = "email"
	static let USERNAME_KEY = "username"
	static let PASS_KEY = "pass"
	
	static func isOnboarded(flag: Bool) {
		UserDefaults.standard.set(flag, forKey: AUTH_KEY)
	}
	
	static func isOnboarded() -> Bool {
		return UserDefaults.standard.bool(forKey: AUTH_KEY)
	}
	
	static func setData(userName: String, email: String, password: String) {
		let defaults = UserDefaults.standard
		defaults.set(userName, forKey: USERNAME_KEY)
		defaults.set(email, forKey: EMAIL_KEY)
		defaults.set(password, forKey: PASS_KEY)
	}
	
	static func setData(email: String, password: String) {
		let defaults = UserDefaults.standard
		defaults.set(email, forKey: EMAIL_KEY)
		defaults.set(password, forKey: PASS_KEY)
	}
	
	static func logout() {
		let defaults = UserDefaults.standard
		defaults.removeObject(forKey: AUTH_KEY)
		defaults.removeObject(forKey: USERNAME_KEY)
		defaults.removeObject(forKey: EMAIL_KEY)
		defaults.removeObject(forKey: PASS_KEY)
	}
	
	static func getUsername() -> String? {
		return UserDefaults.standard.string(forKey: USERNAME_KEY)
	}
	
	static func getEmail() -> String? {
		return UserDefaults.standard.string(forKey: EMAIL_KEY)
	}
	
}
