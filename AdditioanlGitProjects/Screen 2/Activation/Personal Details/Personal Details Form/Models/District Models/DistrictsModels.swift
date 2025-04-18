//
//  DistrictsModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation

struct DistrictsModels : Codable {
	let lstDistrict : [LstDistrict]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstDistrict = "lstDistrict"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstDistrict = try values.decodeIfPresent([LstDistrict].self, forKey: .lstDistrict)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
