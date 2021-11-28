//
//  CurrentUser.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/27/21.
//

import Firebase

struct CurrentUser {
	let uid: String
	let email: String

	init(authData: Firebase.User) {
		uid = authData.uid
		email = authData.email ?? ""
	}

	init(uid: String, email: String) {
		self.uid = uid
		self.email = email
	}
}
