//
//  Notification.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import Foundation

final class Notification: NSObject, NSCoding {
	let title: String?
	let subtitle: String?
	
	init?(userInfo: [AnyHashable : Any]) {
		guard
			let info = userInfo as? [String : Any],
			let aps = info["aps"] as? [String : Any] else {
				return nil
		}
		
		if let alert = aps["alert"] as? [String : Any] {
			self.title = alert["title"] as? String
			self.subtitle = alert["body"] as? String
			
			return
		}
		
		if let subtitle = aps["alert"] as? String {
			self.title = nil
			self.subtitle = subtitle
			
			return
		}
		
		return nil
	}
	
	required init(coder aDecoder: NSCoder) {
		title = aDecoder.decodeObject(forKey: "title") as? String
		subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(title, forKey: "title")
		aCoder.encode(subtitle, forKey: "subtitle")
	}
}

extension Notification {
	static func save(_ notificationList: [Notification]) {
		let data = NSKeyedArchiver.archivedData(withRootObject: notificationList)
		UserDefaults.standard.set(data, forKey: "notificationList")
	}
	
	static func getNotificationList() -> [Notification] {
		guard
			let data = UserDefaults.standard.object(forKey: "notificationList") as? Data,
			let notificationList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Notification] else {
				return []
		}
		
		return notificationList
	}
}
