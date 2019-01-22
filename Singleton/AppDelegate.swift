//
//  AppDelegate.swift
//  Singleton
//
//  Created by Matteo Manferdini on 16/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		guard let navigationController = window?.rootViewController as? UINavigationController,
			let profileViewController = navigationController.viewControllers.first as? ProfileViewController else {
				return true
		}
		let storageController = StorageController()
		profileViewController.storageController = storageController
		return true
	}
}

