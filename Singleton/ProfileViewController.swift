//
//  ViewController.swift
//  Singleton
//
//  Created by Matteo Manferdini on 16/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var bioLabel: UILabel!
	@IBOutlet weak var emailButton: UIButton!
	
	var storageController: StorageController?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let user = storageController?.fetchUser() else {
			return
		}
		nameLabel.text = user.name
		bioLabel.text = user.bio
		emailButton.setTitle(user.email, for: .normal)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {		
		if let navigationController = segue.destination as? UINavigationController,
			let editProfileViewController = navigationController.viewControllers.first as? EditProfileViewController {
			editProfileViewController.storageController = storageController
		}
	}
	
	@IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {}
}
