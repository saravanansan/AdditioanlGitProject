//
//  MyCommonFunctionalUtilities.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation


class MyCommonFunctionalUtilities: NSObject {
   
	// Below code to calculate if the Data taken from DB And Then converted to Modal Objects.

	class func isInternetCallTheApi() -> Bool {
		let status = Reach().connectionStatus()
		switch status {
		case .unknown, .offline:
			return false
		case .online(.wwan):
			return true
		case .online(.wiFi):
			return true
		}
	}
	
}

