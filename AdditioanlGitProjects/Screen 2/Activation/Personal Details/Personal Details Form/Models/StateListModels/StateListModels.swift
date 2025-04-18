//
//  StateListModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation


struct StateListModels : Codable {
	let stateList : [StateList]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case stateList = "stateList"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		stateList = try values.decodeIfPresent([StateList].self, forKey: .stateList)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
