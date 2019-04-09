//
//  PushTableViewCell.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit

final class PushTableViewCell: UITableViewCell {
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var subtitleLabel: UILabel!
	
	var title: String? {
		didSet { titleLabel.text = title }
	}
	
	var subtitle: String? {
		didSet { subtitleLabel.text = subtitle }
	}
}

extension PushTableViewCell {
	static var identifier: String {
		return "PushTableViewCell"
	}
}
