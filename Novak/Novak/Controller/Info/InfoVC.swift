//
//  InfoVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 4/5/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import SafariServices

final class InfoVC: UIViewController {
	private let facebookLink = "https://www.facebook.com/novak.andriy.yaremovych"
	private let youtubeLink = "https://www.youtube.com/channel/UCwXADJO3zMteOqTcOodSzew"	
}

//MARK: - @IBAction
private extension InfoVC {
	@IBAction func youtubePresssed() {
		open(link: youtubeLink)
	}
	
	@IBAction func facebookPressed() {
		open(link: facebookLink)
	}
}

private extension InfoVC {
	func open(link: String) {
		if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:])
		}
	}
}
