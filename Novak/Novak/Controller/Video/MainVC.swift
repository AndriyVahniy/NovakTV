//
//  MainVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import AVKit

final class MainVC: UIViewController {
	@IBOutlet private var playerView: PlayerView!
	
	private let facebookLink = "https://www.facebook.com/novak.andriy.yaremovych"
	private let youtubeLink = "https://www.youtube.com/channel/UCwXADJO3zMteOqTcOodSzew"
	private let videoLink = "https://video-weaver.fra02.hls.ttvnw.net/v1/playlist/CsMDtxDA7zlWpzy-4u7Wv9elZSiPgdxzIu6nhJekpNIXF_rf1jDSJKRo0Az8G_G1YsK4aj7E76px15uIXIZWoFvzG_EzRfHwpuDXOO7X8WuchcgyXAu-ACy7GyRG4XCXu41PUiPDyleqNiaop1QbpdCiU5COq6KOgsd8oYFhj_0_Pxe88DkzHOfEpfRIjvalwvx-cQo29kQXar3FPCxd3w3czbm32rxkd8UxEIWLv3oVL1mhq-GVJvglm52nUUTRdxB5bRbfEKr8379cl2tjgX8uXkB_tIQ5b3i8yJmF-e-i2v_pcCbh6V1Ee_JYu4K_Ruvbjfk26aJSQrNuhihWlfLgsj1-Tbu-KgxZRMkBvMD-PyHXKMD_xC-2NkbD43GppT3_z2EnpHneaxxvWJSXKOXiby5DriiYf-yEhutTzveUaImjdZX5NPUmsAgoHQCCFa_HJItG0L_p5HA8dWr0W20LvFO1nNvntOHbu1GTvAM-K7Ysy7tPHlBA1Ebgve_ggrNM_ylOi26wxkjn2Q50N7nQrpaHJn-GZ2wLSg-7tKfCDLI_Luv5A0QrXj9efvk_q05iGauTqz1lDa9CD13_6o26KkNTvRIQMjXgdwLJEjtMbHlrnfhfJBoMruLqCxYSH5gkNoAL.m3u8"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.transparentNavigationBar()
		playerView.url = URL(string: videoLink)
	}
}

//MARK: - @IBAction
private extension MainVC {
	@IBAction func youtubePressed() {
		open(link: youtubeLink)
	}
	
	@IBAction func facebookPressed() {
		open(link: facebookLink)
	}
	
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
