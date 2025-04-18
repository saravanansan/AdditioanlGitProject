//
//  LstDistrict.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation


struct LstDistrict : Codable {
	let districtId : Int?
	let stateId : Int?
	let districtName : String?
	let districtCode : String?
	let isActive : Bool?
	let totalRows : Int?
	let row : Int?

	enum CodingKeys: String, CodingKey {

		case districtId = "districtId"
		case stateId = "stateId"
		case districtName = "districtName"
		case districtCode = "districtCode"
		case isActive = "isActive"
		case totalRows = "totalRows"
		case row = "row"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		districtId = try values.decodeIfPresent(Int.self, forKey: .districtId)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
		districtCode = try values.decodeIfPresent(String.self, forKey: .districtCode)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		row = try values.decodeIfPresent(Int.self, forKey: .row)
	}

}
