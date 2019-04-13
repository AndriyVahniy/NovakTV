//
//  MainVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit

final class MainVC: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.transparentNavigationBar()
	}
}

//MARK: - @IBAction
private extension MainVC {
	@IBAction func sharePressed() {
		shareLink()
	}
}

//MARK: - Controller Helpers
private extension MainVC {
	func shareLink() {
		let web = URL(string:"https://www.twitch.tv/novaktvradio") as Any
		let shareArray = [web]
		let activityViewController = UIActivityViewController(activityItems: shareArray, applicationActivities: nil)
		
		self.present(activityViewController, animated: true, completion: nil)
	}
	
	func open(link: String) {
		if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:])
		}
	}
}
