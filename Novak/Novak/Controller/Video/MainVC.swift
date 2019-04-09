//
//  MainVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import TwitchPlayer
import AVKit

final class MainVC: UIViewController {
	@IBOutlet private var twitchPlayer: TwitchPlayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.transparentNavigationBar()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		twitchPlayer.isHidden = !Reachability.isConnectedToNetwork()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		twitchPlayer.pause()
	}
}

//MARK: - @IBAction
private extension MainVC {
	@IBAction func playButtonPressed() {
		twitchPlayer.togglePlaybackState()
	}
}
