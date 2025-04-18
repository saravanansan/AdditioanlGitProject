//
//  ProfileImageUpdateModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation

struct ProfileImageUpdateModels : Codable {
	let lstCustomer : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstCustomer = "lstCustomer"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstCustomer = try values.decodeIfPresent(String.self, forKey: .lstCustomer)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
