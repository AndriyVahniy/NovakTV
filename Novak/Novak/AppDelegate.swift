//
//  AppDelegate.swift
//  Novak
//
//  Created by Andriy Vahniy on 3/8/19.
//  Copyright © 2019 Andriy Vahniy. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		configurePushNotification(using: application)
		
		return true
	}
	
	func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
		
		processNotification(userInfo)
		completionHandler(.newData)
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		UIApplication.shared.applicationIconBadgeNumber = 0
	}
}

//MARK: - AppDelegate Helpers
private extension AppDelegate {
	func configurePushNotification(using application: UIApplication) {
		UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in }
		application.registerForRemoteNotifications()
	}
	
	func processNotification(_ userInfo: [AnyHashable : Any]) {
		guard let notification = Notification(userInfo: userInfo) else { return }
		
		var list = Notification.getNotificationList()
		list.append(notification)
		
		Notification.save(list)
	}
}
