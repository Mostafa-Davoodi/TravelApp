//
//  Serializer.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/25/21.
//

import UIKit

class Serializer {
	
	static func serialize(user: NewUser) -> String? {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .withoutEscapingSlashes
		
		do {
			let jsonData = try encoder.encode(user)
			let jsonString = String(data: jsonData, encoding: .utf8)
			return jsonString
			
		} catch {
			// respond to error
			return nil
		}
		
		
	}
	
	
	static func deserialize(jsonString: String) -> NewUser? {
		if let jsonData = jsonString.data(using: .utf8) {
			let decoder = JSONDecoder()
			do {
				let user = try decoder.decode(NewUser.self, from: jsonData)
				return user
			} catch {
				print(error.localizedDescription)
				return nil
			}
			
		} else {
			// respond to error
			return nil
		}
	}
	
	static func deserializeArray(jsonString: String) -> [NewUser] {
		if let jsonData = jsonString.data(using: .utf8) {
			let decoder = JSONDecoder()
			do {
				let users = try decoder.decode([NewUser].self, from: jsonData)
				return users
			} catch {
				return []
			}
		} else {
			return []
		}
	}
	
	
	static func rawUserJson() -> String {
		return """
{
"first_name": "Mostafa",
"last_name": "Davoodi",
"country": "Canada"
}
"""
	}
	
	static func rawUserArrayJson() -> String {
		return """
[
{
	"first_name": "John",
	"last_name": "Doe",
	"country": "Canada"
},
{
 "first_name": "Mostafa",
 "last_name": "Davoodi",
 "country": "Canada"
}
]
"""
	}
	
	
	
}

struct NewUser: Codable {
	var firstName: String
	var lastName: String
	var country: String
	
	enum CodingKeys: String, CodingKey {
		case firstName = "first_name"
		case lastName = "last_name"
		case country
	}
}
