//
//  AppDelegate.swift
//  Clima
//
//  Created by Angela Yu on 04/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	var connected = true
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//		Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
//
//			self.isConnectedToInternet()
//		}

//		let notificationCenter = NotificationCenter.default
//		notificationCenter.addObserver(self, selector: #selector((isConnectedToInternet)), name:NSNotification.Name(rawValue: "isConnected"), object: nil)
//
//		self.isConnectedToInternet()
        return true
    }

	@objc func isConnectedToInternet() -> Bool{
		guard let connected = NetworkReachabilityManager()?.isReachable else {return false}
		let reachabilityManager = NetworkReachabilityManager()
		reachabilityManager?.listener = { status in
			print(status)

		}
		reachabilityManager?.startListening()


		return connected
	}
}

