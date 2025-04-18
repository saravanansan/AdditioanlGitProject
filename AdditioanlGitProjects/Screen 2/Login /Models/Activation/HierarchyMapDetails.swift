//
//  HierarchyMapDetails.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation

struct HierarchyMapDetails : Codable {
	let userUserID : Int?
	let locationID : Int?
	let parentUserID : Int?
	let customerType : String?
	let user2UserID : Int?
	let customerUserID : Int?
	let seName : String?
	let seMobileNo : String?
	let asmName : String?
	let customerUserName : String?
	let locationName : String?
	let userUseruName : String?
	let hieracMasterMapID : Int?
	let beName : String?
	let beMobileNo : String?
	let beEmail : String?
	let role : String?

	enum CodingKeys: String, CodingKey {

		case userUserID = "userUserID"
		case locationID = "locationID"
		case parentUserID = "parentUserID"
		case customerType = "customerType"
		case user2UserID = "user2UserID"
		case customerUserID = "customerUserID"
		case seName = "seName"
		case seMobileNo = "seMobileNo"
		case asmName = "asmName"
		case customerUserName = "customerUserName"
		case locationName = "locationName"
		case userUseruName = "userUseruName"
		case hieracMasterMapID = "hieracMasterMapID"
		case beName = "beName"
		case beMobileNo = "beMobileNo"
		case beEmail = "beEmail"
		case role = "role"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userUserID = try values.decodeIfPresent(Int.self, forKey: .userUserID)
		locationID = try values.decodeIfPresent(Int.self, forKey: .locationID)
		parentUserID = try values.decodeIfPresent(Int.self, forKey: .parentUserID)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		user2UserID = try values.decodeIfPresent(Int.self, forKey: .user2UserID)
		customerUserID = try values.decodeIfPresent(Int.self, forKey: .customerUserID)
		seName = try values.decodeIfPresent(String.self, forKey: .seName)
		seMobileNo = try values.decodeIfPresent(String.self, forKey: .seMobileNo)
		asmName = try values.decodeIfPresent(String.self, forKey: .asmName)
		customerUserName = try values.decodeIfPresent(String.self, forKey: .customerUserName)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		userUseruName = try values.decodeIfPresent(String.self, forKey: .userUseruName)
		hieracMasterMapID = try values.decodeIfPresent(Int.self, forKey: .hieracMasterMapID)
		beName = try values.decodeIfPresent(String.self, forKey: .beName)
		beMobileNo = try values.decodeIfPresent(String.self, forKey: .beMobileNo)
		beEmail = try values.decodeIfPresent(String.self, forKey: .beEmail)
		role = try values.decodeIfPresent(String.self, forKey: .role)
	}

}
