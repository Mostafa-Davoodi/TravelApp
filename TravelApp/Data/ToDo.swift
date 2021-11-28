//
//  ToDo.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/27/21.
//
import Firebase

struct ToDo {
	let ref: DatabaseReference?
	let key: String
	var title: String
	var isCompleted: Bool = false
	let addedByUser: String
	
	// MARK: Initialize with Raw Data
	init(title: String, addedByUser: String, isCompleted: Bool = false, key: String = "") {
		self.ref = nil
		self.key = key
		self.title = title
		self.addedByUser = addedByUser
		self.isCompleted = isCompleted
	}

	// MARK: Initialize with Firebase DataSnapshot
	init?(snapshot: DataSnapshot) {
		guard
			let value = snapshot.value as? [String: AnyObject],
			let title = value["title"] as? String,
			let addedByUser = value["addedByUser"] as? String,
			let isCompleted = value["isCompleted"] as? Bool
		else {
			return nil
		}

		self.ref = snapshot.ref
		self.key = snapshot.key
		self.title = title
		self.addedByUser = addedByUser
		self.isCompleted = isCompleted
	}
	
	func toAnyObject() -> Any {
		return [
			"title": title,
			"addedByUser": addedByUser,
			"isCompleted": isCompleted
		]
	}
}
