//
//  NetworkStatus.swift
//  Clima
//
//  Created by d.genkov on 10/25/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
import Alamofire

let connected = "co.dgd.connected"
let notConnected = "co.dgd.notConnected"

class NetworkStatus {
	static let sharedInstance = NetworkStatus()

	var isConnected = true

	private init() {}

	let reachabilityManager = NetworkReachabilityManager()

	func startNetworkReachabilityObserver() {
		reachabilityManager?.listener = { status in

			switch status {

			case .notReachable:
				print("not connected")
				self.isConnected = false
				let name = Notification.Name(rawValue: notConnected)
				NotificationCenter.default.post(name: name, object: self)

			case .unknown :
				print("It is unknown whether the network is reachable")

			case .reachable :
				print("connected")
				self.isConnected = true


				let name = Notification.Name(rawValue: connected)
				NotificationCenter.default.post(name: name, object: self)

			default :
				print("ne znam")
			}
		}
		reachabilityManager?.startListening()
	}

	func restartNetworkReachabilityObserver() {
		reachabilityManager?.stopListening()
		reachabilityManager?.startListening()
	}
}
