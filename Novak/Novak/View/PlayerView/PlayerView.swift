//
//  PlayerView.swift
//  Novak
//
//  Created by Andriy Vahniy on 4/11/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import AVKit

final class PlayerView: UIView {
	var url: URL? {
		didSet { addController() }
	}
	
	private func addController() {
		if let controller = createPlayerController() {
			self.add(controller: controller)
		}
	}
	
	private func createPlayerController() -> UIViewController? {
		guard let url = url else { return nil }
		
		let player = AVPlayer(url: url)
		let playerVC = AVPlayerViewController()
		playerVC.player = player
		
		if #available(iOS 11.0, *) {
			playerVC.entersFullScreenWhenPlaybackBegins = true
		}
		
		return playerVC
	}
}
