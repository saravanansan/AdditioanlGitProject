//
//  DeviceInfo.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork

final class DeviceInfo{
	private init(){}
	static var shared = DeviceInfo()
	
	
	var bundleIdentifier: String {
		return Bundle.main.bundleIdentifier ?? ""
	}
	
	var versionNumber: String {
		return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
	}
	
	var buildNumber: String {
		return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
	}
	
	var deviceID : String{
		return UIDevice.current.identifierForVendor?.uuidString ?? ""
	}
	
	
	func getIPAddress() -> String? {
		var address: String?
		var ifaddr: UnsafeMutablePointer<ifaddrs>?
		
		if getifaddrs(&ifaddr) == 0 {
			var ptr = ifaddr
			while ptr != nil {
				let interface = ptr!.pointee
				let addrFamily = interface.ifa_addr.pointee.sa_family
				
				if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
					let name = String(cString: interface.ifa_name)
					if name == "en0" { // Wi-Fi interface
						var addr = interface.ifa_addr.pointee
						var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
						if (getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
										&hostname, socklen_t(hostname.count),
										nil, socklen_t(0), NI_NUMERICHOST) == 0) {
							address = String(cString: hostname)
						}
					}
				}
				ptr = interface.ifa_next
			}
			freeifaddrs(ifaddr)
		}
		return address
	}
	
}

