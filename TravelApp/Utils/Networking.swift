//
//  Networking.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 12/2/21.
//

import Foundation

struct Employee: Codable {

	var id: Int?
	var name: String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "employee_name"
	}
	
}

struct EmployeeResponse: Codable {
	
	var status: String?
	var data: [Employee]
	var message: String?
	
}

struct PostResponse: Codable {
	var status: String?
}

class Networking {
	
	static func samplePostApi(body: Employee) {
		let session = URLSession.shared
		let url = URL(string: "http://dummy.restapiexample.com/api/v1/create")!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
//		request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
		if let bodyJson = try? JSONEncoder().encode(body) {
//			request.httpBody = bodyJson
			
			let task = session.dataTask(with: request) { data, response, error in
				
				if let error = error {
					self.handle(error: error)
				} else {
					if let data = data,
						 let response = response as? HTTPURLResponse,
						 (200...299).contains(response.statusCode) {
						let deserializedResponse = self.deserializePostResponse(data: data)
						print(deserializedResponse)
					} else {
						self.handleServerError(response: response)
					}
					print(data)
					print(response)
				}
				
			}
			
			task.resume()
		}
		
		
		
	}
	
	static func sampleApi() {
		let session = URLSession.shared
		let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
		let task = session.dataTask(with: url) { data, response, error in

			
			if let error = error {
				self.handle(error: error)
			} else {
				if let data = data,
					 let response = response as? HTTPURLResponse,
					 (200...299).contains(response.statusCode) {
					let deserializedResponse = self.deserialize(data: data)
					print(deserializedResponse)
				} else {
					self.handleServerError(response: response)
				}
				print(data)
				print(response)
			}
		}
		task.resume()
	}
	
	static func deserialize(data: Data) -> EmployeeResponse? {
		let decoder = JSONDecoder()
		do {
			return try decoder.decode(EmployeeResponse.self, from: data)
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
	
	static func deserializePostResponse(data: Data) -> PostResponse? {
		let decoder = JSONDecoder()
		do {
			return try decoder.decode(PostResponse.self, from: data)
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
	
	static func handleServerError(response: URLResponse?) {
		
	}
	
	static func handle(error: Error) {
		print(error)
	}
}
