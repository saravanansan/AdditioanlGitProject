//
//  LstBrandQuaterlyBaseTargetDetails.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstBrandQuaterlyBaseTargetDetails : Codable {
	let lstBrandQuater1 : [LstBrandQuater]?
	let lstBrandQuater2 : [LstBrandQuater]?
	let lstBrandQuater3 : [LstBrandQuater]?
	let lstBrandQuater4 : [LstBrandQuater]?

	enum CodingKeys: String, CodingKey {

		case lstBrandQuater1 = "lstBrandQuater1"
		case lstBrandQuater2 = "lstBrandQuater2"
		case lstBrandQuater3 = "lstBrandQuater3"
		case lstBrandQuater4 = "lstBrandQuater4"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstBrandQuater1 = try values.decodeIfPresent([LstBrandQuater].self, forKey: .lstBrandQuater1)
		lstBrandQuater2 = try values.decodeIfPresent([LstBrandQuater].self, forKey: .lstBrandQuater2)
		lstBrandQuater3 = try values.decodeIfPresent([LstBrandQuater].self, forKey: .lstBrandQuater3)
		lstBrandQuater4 = try values.decodeIfPresent([LstBrandQuater].self, forKey: .lstBrandQuater4)
	}

}
