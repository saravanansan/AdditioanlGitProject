//
//  LstCustomerQuestions4.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation


struct LstCustomerQuestions4 : Codable {
	let question : String?
	let answer : String?
	let questionType : String?

	enum CodingKeys: String, CodingKey {

		case question = "question"
		case answer = "answer"
		case questionType = "questionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		question = try values.decodeIfPresent(String.self, forKey: .question)
		answer = try values.decodeIfPresent(String.self, forKey: .answer)
		questionType = try values.decodeIfPresent(String.self, forKey: .questionType)
	}

}
