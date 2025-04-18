//
//  LstQuaterlyBaseTargetDetails.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstQuaterlyBaseTargetDetails : Codable {
	let quaterly_1 : String?
	let consumeQuaterly_1 : String?
	let quaterly_2 : String?
	let consumeQuaterly_2 : String?
	let quaterly_3 : String?
	let consumeQuaterly_3 : String?
	let quaterly_4 : String?
	let consumeQuaterly_4 : String?

	enum CodingKeys: String, CodingKey {

		case quaterly_1 = "quaterly_1"
		case consumeQuaterly_1 = "consumeQuaterly_1"
		case quaterly_2 = "quaterly_2"
		case consumeQuaterly_2 = "consumeQuaterly_2"
		case quaterly_3 = "quaterly_3"
		case consumeQuaterly_3 = "consumeQuaterly_3"
		case quaterly_4 = "quaterly_4"
		case consumeQuaterly_4 = "consumeQuaterly_4"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quaterly_1 = try values.decodeIfPresent(String.self, forKey: .quaterly_1)
		consumeQuaterly_1 = try values.decodeIfPresent(String.self, forKey: .consumeQuaterly_1)
		quaterly_2 = try values.decodeIfPresent(String.self, forKey: .quaterly_2)
		consumeQuaterly_2 = try values.decodeIfPresent(String.self, forKey: .consumeQuaterly_2)
		quaterly_3 = try values.decodeIfPresent(String.self, forKey: .quaterly_3)
		consumeQuaterly_3 = try values.decodeIfPresent(String.self, forKey: .consumeQuaterly_3)
		quaterly_4 = try values.decodeIfPresent(String.self, forKey: .quaterly_4)
		consumeQuaterly_4 = try values.decodeIfPresent(String.self, forKey: .consumeQuaterly_4)
	}

}
