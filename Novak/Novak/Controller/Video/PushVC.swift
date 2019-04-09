//
//  PushVC.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit

final class PushVC: UIViewController {
	@IBOutlet private var tableView: UITableView! {
		didSet {
			let nib = UINib(nibName: PushTableViewCell.identifier, bundle: nil)
			tableView.register(nib, forCellReuseIdentifier: PushTableViewCell.identifier)
		}
	}
	
	var data: [Notification] {
		return Notification.getNotificationList().reversed()
	}
}

//MARK: - Helpers
private extension PushVC {
	@IBAction func closePressed() {
		navigationController?.popViewController(animated: true)
	}
	
	func addNoDataIfNeeded() {
		if data.count < 1 {
			let label = UILabel()
			label.text = "Повідомлення відсутні"
			label.textAlignment = .center
			label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			
			tableView.backgroundView = label
		} else {
			tableView.backgroundView = nil
		}
	}
}

//MARK: - UITableViewDataSource
extension PushVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		addNoDataIfNeeded()
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PushTableViewCell.identifier) as? PushTableViewCell
		let cellData = data[indexPath.row]
		
		cell?.title = cellData.title
		cell?.subtitle = cellData.subtitle
		
		return cell ?? UITableViewCell()
	}
}
