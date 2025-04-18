//
//  ObjCustomerBasicDetailsActivation.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation

struct ObjCustomerBasicDetailsActivation : Codable {
	let loyalityID : String?
	let profilePicture : String?
	let firmName : String?
	let user_ID : Int?
	let password : String?
	let result : Int?

	enum CodingKeys: String, CodingKey {

		case loyalityID = "loyalityID"
		case profilePicture = "profilePicture"
		case firmName = "firmName"
		case user_ID = "user_ID"
		case password = "password"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		loyalityID = try values.decodeIfPresent(String.self, forKey: .loyalityID)
		profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
		firmName = try values.decodeIfPresent(String.self, forKey: .firmName)
		user_ID = try values.decodeIfPresent(Int.self, forKey: .user_ID)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		result = try values.decodeIfPresent(Int.self, forKey: .result)
	}

}
