//
//  TermsAndCondModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation


struct TermsAndCondModels : Codable {
	let lstTermsAndCondition : [LstTermsAndCondition]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstTermsAndCondition = "lstTermsAndCondition"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstTermsAndCondition = try values.decodeIfPresent([LstTermsAndCondition].self, forKey: .lstTermsAndCondition)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
