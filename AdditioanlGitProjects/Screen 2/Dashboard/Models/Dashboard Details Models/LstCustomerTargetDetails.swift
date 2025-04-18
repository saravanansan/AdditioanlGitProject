//
//  LstCustomerTargetDetails.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


struct LstCustomerTargetDetails : Codable {
	let annualTarget : String?
	let consumeTarget : String?
	let percentageTarget : String?
	let yetAchivedTarget : String?
	let yearStart : String?
	let yearEnd : String?

	enum CodingKeys: String, CodingKey {

		case annualTarget = "annualTarget"
		case consumeTarget = "consumeTarget"
		case percentageTarget = "percentageTarget"
		case yetAchivedTarget = "yetAchivedTarget"
		case yearStart = "yearStart"
		case yearEnd = "yearEnd"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		annualTarget = try values.decodeIfPresent(String.self, forKey: .annualTarget)
		consumeTarget = try values.decodeIfPresent(String.self, forKey: .consumeTarget)
		percentageTarget = try values.decodeIfPresent(String.self, forKey: .percentageTarget)
		yetAchivedTarget = try values.decodeIfPresent(String.self, forKey: .yetAchivedTarget)
		yearStart = try values.decodeIfPresent(String.self, forKey: .yearStart)
		yearEnd = try values.decodeIfPresent(String.self, forKey: .yearEnd)
	}

}
