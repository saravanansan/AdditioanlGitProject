//
//  LoginModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation


struct LoginModels : Codable {
	let userList : [UserList]?
	let objUserDetailedInfo : String?
	let merchantImageDetails : String?
	let lstMerchantImageDetails : String?
	let userId : Int?
	let returnMessage : String?
	let emailResponce : String?
	let smsResponce : String?

	enum CodingKeys: String, CodingKey {

		case userList = "userList"
		case objUserDetailedInfo = "objUserDetailedInfo"
		case merchantImageDetails = "merchantImageDetails"
		case lstMerchantImageDetails = "lstMerchantImageDetails"
		case userId = "userId"
		case returnMessage = "returnMessage"
		case emailResponce = "emailResponce"
		case smsResponce = "smsResponce"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userList = try values.decodeIfPresent([UserList].self, forKey: .userList)
		objUserDetailedInfo = try values.decodeIfPresent(String.self, forKey: .objUserDetailedInfo)
		merchantImageDetails = try values.decodeIfPresent(String.self, forKey: .merchantImageDetails)
		lstMerchantImageDetails = try values.decodeIfPresent(String.self, forKey: .lstMerchantImageDetails)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		emailResponce = try values.decodeIfPresent(String.self, forKey: .emailResponce)
		smsResponce = try values.decodeIfPresent(String.self, forKey: .smsResponce)
	}

}
