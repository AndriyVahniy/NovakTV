//
//  LoginVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 4/15/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

final class LoginVC: UIViewController, ErrorAlertable {
	@IBOutlet private var emailTextField: UITextField!
	@IBOutlet private var passwordTextField: UITextField!
	
	private let showMainVCAnimated = "showMainVCAnimated"
	private let showMainVC = "showMainVC"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		skipAuthIfNeeded()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
}

//MARK: - @IBAction
private extension LoginVC {
	@IBAction func registerPressed() {
		handleTap(with: registerUser(email:password:completion:))
	}
	
	@IBAction func loginPressed() {
		handleTap(with: loginUser(email:password:completion:))
	}
}

//MARK: - Controller Helpers
private extension LoginVC {
	func handleTap(with function: (_ email: String, _ password: String, _ completion: AuthDataResultCallback?) -> Void) {
		guard
			let email = emailTextField.text,
			let password = passwordTextField.text else { return }
		
		function(email, password, handleResult(result:error:))
	}
}

//MARK: - Server Communication
private extension LoginVC {
	func skipAuthIfNeeded() {
		if Auth.auth().currentUser != nil {
			performSegue(withIdentifier: showMainVC, sender: nil)
		}
	}
	
	func registerUser(email: String, password: String, completion: AuthDataResultCallback?) {
		Auth.auth().createUser(withEmail: email, password: password, completion: completion)
	}
	
	func loginUser(email: String, password: String, completion: AuthDataResultCallback?) {
		Auth.auth().signIn(withEmail: email, password: password, completion: completion)
	}
	
	func handleResult(result: AuthDataResult?, error: Error?) {
		if let error = error {
			showError(error: error)
			return
		}
		
		performSegue(withIdentifier: showMainVCAnimated, sender: nil)
	}
}

//MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case emailTextField:
			passwordTextField.becomeFirstResponder()
		default:
			textField.endEditing(true)
		}
		
		return true
	}
}
