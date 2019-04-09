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
	private let videoLink = "https://video-weaver.fra02.hls.ttvnw.net/v1/playlist/CsMD989AzHhR0Mb5Itbj9DinqYJPIIPlSC0ISGj14ZdsN3N8DTjVjTfMsaU371nnU93LpI4wXXd9KF1ot_ghc9oNjhRhfy5erfEA12xI2NXnw5_rV5BNYLvo4HMotjFAgVG9mcIkEt0c4G_Gf92t_C5TyZC7gNX0CGIP__8nab-7Blx2gcgrnTASLPwXGLBw3FUlBxejcdlIhPhWgrFR_XfeyDvpO_tTLagty9aEdGyIMtMhkoZbJQykDiSfM4_4aRnbIzMBfaTky3AAoeXojTTaxl5HeHiT6bQel3kAgDWokWeotQLQfxhryeXvFIzK0EqJ6DBVVk2n7zL2MXDZNvD7oAGyqqR5P7-GV3gEICvBDhErAWqeKBgtdnICOIIGMGwxrUw9Z7HPIw-SNVlETraJSFjVretINeYAJc4-iVObYL3MG1cMNG1y_tcEnafdOvwc2ff3t675BKpNHeyCmhb04IL8k3W1FOdu5HM4dKI4ODn-qYbB1fxxgRC3LTBRYa9tkLOH1zcr13UbcYcArsMkdpAd0rJ4q4uxL-wCxn8Qi3Ki-JAFkupCEkYtE4h_Z0DA9LHuIoFZLEWmjhuX-AEPsaWQJxIQ67zwjrlq0C7QwJcVvknMfhoMpRSuX2WbfH43xPAt.m3u8"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.transparentNavigationBar()
	}
}

//MARK: - @IBAction
private extension MainVC {
	@IBAction func playButtonPressed() {
		play(videoLink)
	}
}

private extension MainVC {
	func play(_ link: String) {
		guard let url = URL(string: link) else { return }
		
		let playerVC = createPlayer(with: url)
		
		present(playerVC, animated: true) {
			playerVC.player?.play()
		}
	}
	
	func createPlayer(with url: URL) -> AVPlayerViewController {
		let player = AVPlayer(url: url)
		let playerVC = AVPlayerViewController()
		playerVC.player = player
		
		return playerVC
	}
}
