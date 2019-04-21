//
//  MainVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import FirebaseAuth

final class MainVC: UIViewController {
	private let youtubeLink = "https://www.youtube.com/channel/UCwXADJO3zMteOqTcOodSzew"
	private let facebbokLink = "https://www.facebook.com/novak.andriy.yaremovych"
	private let shareLink = "https://www.twitch.tv/novaktvradio"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.transparentNavigationBar()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
}

//MARK: - @IBAction
private extension MainVC {
	@IBAction func youtubePressed() {
		open(youtubeLink)
	}
	
	@IBAction func facebookPressed() {
		open(facebbokLink)
	}
	
	@IBAction func sharePressed() {
		share(shareLink)
	}
	
	@IBAction func logout() {
		try? Auth.auth().signOut()
		navigationController?.popViewController(animated: true)
	}
}

//MARK: - Controller Helpers
private extension MainVC {
	func share(_ shareLink: String) {
		let web = URL(string: shareLink) as Any
		let shareArray = [web]
		let activityViewController = UIActivityViewController(activityItems: shareArray, applicationActivities: nil)
		
		self.present(activityViewController, animated: true, completion: nil)
	}
	
	func open(_ link: String) {
		if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:])
		}
	}
}
