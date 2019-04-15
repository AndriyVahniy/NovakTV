//
//  ErrorAlertable.swift
//  Novak
//
//  Created by Andriy Vahniy on 4/15/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit

protocol ErrorAlertable {
	func showError(error: Error)
}

extension ErrorAlertable where Self: UIViewController {
	func showError(error: Error) {
		let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default) { _ in self.dismiss(animated: true) }
		alert.addAction(okAction)
		present(alert, animated: true)
	}
}
