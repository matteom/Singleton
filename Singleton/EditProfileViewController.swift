//
//  EditProfileViewController.swift
//  Singleton
//
//  Created by Matteo Manferdini on 16/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController {
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var bioTextView: UITextView!
	
	var storageController: StorageController?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let user = storageController?.fetchUser() else {
			return
		}
		nameTextField.text = user.name
		emailTextField.text = user.email
		bioTextView.text = user.bio
	}
}
