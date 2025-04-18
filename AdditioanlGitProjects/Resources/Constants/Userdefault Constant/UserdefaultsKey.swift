//
//  UserdefaultsKey.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import UIKit


class UserdefaultsKey{
	static let isUserLogedIn = "isUserLogedIn"
	static let userID = "UserID"
	static let membershipID = "membershipID"
	static let userName = "userName"
	
}

struct Constants{
	static var userID: Int{
		return UserDefaults.standard.integer(forKey: UserdefaultsKey.userID)
	}
	
	static var loyaltyID: String{
		return UserDefaults.standard.string(forKey: UserdefaultsKey.membershipID) ?? ""
	}
	
	
}
