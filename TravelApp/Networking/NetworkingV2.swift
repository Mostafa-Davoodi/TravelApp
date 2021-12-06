//
//  NetworkingV2.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 12/5/21.
//

import Alamofire

class NetworkingV2 {
	
	// #1
	static func mockApi1() {
		// AF == Session.default
		AF.request("https://httpbin.org/get").response { response in
			debugPrint(response)
		}
	}
	
	// #2
	static func mockApi2() {
		let url = "https://httpbin.org/get"
		Session.default.request(url).responseJSON { response in
			switch response.result {
			case .success(let data):
				if let users = data as? [[String: Any]] {
					for user in users {
						print(user["first_name"] ?? "")
					}
				}
			case .failure(let error):
				print("Something went wrong \(error)")
			}
			debugPrint(response.result)
		}
	}
	
	
	// #3
	static func mockApi3() {
		AF.request("https://httpbin.org/status/404")
			.validate(statusCode: 200..<300)
			.response { response in
				switch response.result {
				case .success:
					print("success!")
				case .failure(let error):
					print(error)
					print(response.response?.statusCode)
				}
			}
	}
	
	// #4
	static func mockApi4() {
		let url = ""
		Session.default.request(url).responseDecodable(of: [AFUser].self) { response in
			switch response.result  {
			case .success(let users):
				print(users.map { "\($0.first_name) \($0.last_name)"})
			case .failure(let error):
				print(error)
			}
		}
	}
	
	// #5
	static func mockApi5() {
		AF.request("https://httpbin.org/get?foo=bar&lorem=ipsum").responseDecodable(of: HTTPBinResponse.self) { response in
			if case let .success(data) = response.result {
				print(data.args)
			}
		}
	}
	
	// #6
	static func mockApi6() {
		let params: [String: Any] = [
			"v": "20210505",
			"type": "venues",
			"page": Int.random(in: 0..<99)
		]
		
		AF.request("https://httpbin.org/get", parameters: params).responseDecodable(of: HTTPBinResponse.self) { response in
			if case let .success(data) = response.result {
				print(data.args)
			}
		}
	}
	
	// #7
	static func mockApi7() {
		let params = [
			"first_name": "Arthur",
			"last_name": "Dent",
			"email": "arthur@dent.com"
		]
		
		AF.request("https://httpbin.org/post", method: .post, parameters: params).responseJSON { response in
			debugPrint(response)
		}
	}
	
	
	// #8
	static func mockApi8() {
		let params = [
			"first_name": "Arthur",
			"last_name": "Dent",
			"email": "arthur@dent.com"
		]
		
		AF.request("https://httpbin.org/post", method: .post, parameters: params, encoder: JSONParameterEncoder.default).responseJSON { response in
			debugPrint(response)
		}
	}
	
	// #9
	static func mockApi9() {
		let data = LoginData(username: "arthur@dent.com", password: "iluvtrillian")
		AF.request("https://httpbin.org/post", method: .post, parameters: data, encoder: JSONParameterEncoder.default).responseJSON { response in
			debugPrint(response)
		}
	}
	
	// #10
	static func mockApi10() {
		let headers: HTTPHeaders = [
			"Authorization": "Basic am9lkfjdasklfjasd"
		]
		
		AF.request("https://httpbin.org/basic-auth/johndoe/abcd1234", headers: headers).responseJSON {
			response in
			debugPrint(response)
		}
	}
	
	// #11
	static func mockApi11() {
		let headers: HTTPHeaders = [
			.authorization(username: "johndoe", password: "abcd1234"),
			.accept("application/json")
		]
		
		AF.request("https://httpbin.org/basic-auth/johndoe/abcd1234", headers: headers).responseJSON {
			response in
			debugPrint(response)
		}
	}
	
}

struct AFUser: Codable {
	let first_name: String
	let last_name: String
	let age: Int
}

struct HTTPBinResponse: Codable {
	let args: [String: String]
}

struct LoginData: Codable {
	let username: String
	let password: String
}
