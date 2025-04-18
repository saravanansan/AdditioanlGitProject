//
//  LstBrandQuater.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstBrandQuater : Codable {
	let brand : String?
	let quaterlyAmount : String?
	let consumeAmount : String?

	enum CodingKeys: String, CodingKey {

		case brand = "brand"
		case quaterlyAmount = "quaterlyAmount"
		case consumeAmount = "consumeAmount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		brand = try values.decodeIfPresent(String.self, forKey: .brand)
		quaterlyAmount = try values.decodeIfPresent(String.self, forKey: .quaterlyAmount)
		consumeAmount = try values.decodeIfPresent(String.self, forKey: .consumeAmount)
	}

}
