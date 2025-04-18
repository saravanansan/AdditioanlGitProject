//
//  PanCountCheckModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 14/11/24.
//

import Foundation


struct PanCountCheckModels : Codable {
	let isActive : Bool?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case isActive = "isActive"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
