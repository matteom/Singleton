//
//  StorageController.swift
//  Singleton
//
//  Created by Matteo Manferdini on 16/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import Foundation

class StorageController {
	private let userFileURL = FileManager.default
		.urls(for: .documentDirectory, in: .userDomainMask)
		.first!
		.appendingPathComponent("User")
		.appendingPathExtension("plist")
	
	init() {
		guard fetchUser() == nil else {
			return
		}
		let user = User(
			name: "Tiffany Reid",
			email: "tiffany@skivee.org",
			bio: "It was a humorously perilous business for both of us. For, before we proceed further, it must be said that the monkey-rope was fast at both ends; fast to Queequeg's broad canvas belt, and fast to my narrow leather one. So that for better or for worse, we two, for the time, were wedded; and should poor Queequeg sink to rise no more, then both usage and honour demanded, that instead of cutting the cord, it should drag me down in his wake.")
		save(user)
	}
	
	func fetchUser() -> User? {
		guard let data = try? Data(contentsOf: userFileURL) else {
			return nil
		}
		let decoder = PropertyListDecoder()
		return try? decoder.decode(User.self, from: data)
	}
	
	func save(_ user: User) {
		let encoder = PropertyListEncoder()
		if let data = try? encoder.encode(user) {
			try? data.write(to: userFileURL)
		}
	}
}
