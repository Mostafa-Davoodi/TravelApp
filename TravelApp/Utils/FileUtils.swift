//
//  FileUtils.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 1/12/22.
//

import Foundation

class FileUtils {
	
	static func readToDos() {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.txt")
		do {
			let todos = try String(contentsOf: path)
			for todo in todos.split(separator: ";") {
				print(todo)
			}
			logPath()
		} catch {
			print(error.localizedDescription)
		}
		
	}
	
	static func writeToDos() {
		let todos = "Eat;Sleep;Work"
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.txt")
		do {
			try todos.write(to: path, atomically: true, encoding: .utf8)
			logPath()
		} catch {
			print(error.localizedDescription)
		}
		
	}
	
	static func getDocumentDirectory() -> URL {
		return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
	
	static func logPath() {
		let path = getDocumentDirectory()
		print("path is : \(path)")
	}
}


extension FileManager {
	func documentDirectory() -> URL {
		return self.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}
