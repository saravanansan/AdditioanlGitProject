//
//  CustomerRefferenceDetailsModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation


struct CustomerRefferenceDetailsModels : Codable {
	let lstCustomerAnswers : String?
	let lstCustomerQuestions : [LstCustomerQuestions4]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstCustomerAnswers = "lstCustomerAnswers"
		case lstCustomerQuestions = "lstCustomerQuestions"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstCustomerAnswers = try values.decodeIfPresent(String.self, forKey: .lstCustomerAnswers)
		lstCustomerQuestions = try values.decodeIfPresent([LstCustomerQuestions4].self, forKey: .lstCustomerQuestions)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
