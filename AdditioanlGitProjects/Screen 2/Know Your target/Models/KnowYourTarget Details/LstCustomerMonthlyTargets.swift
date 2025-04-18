//
//  LstCustomerMonthlyTargets.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstCustomerMonthlyTargets : Codable {
	let april : String?
	let aprilConsume : String?
	let may : String?
	let mayConsume : String?
	let june : String?
	let juneConsume : String?
	let july : String?
	let julyConsume : String?
	let august : String?
	let augustConsume : String?
	let september : String?
	let septemberConsume : String?
	let october : String?
	let octoberConsume : String?
	let november : String?
	let novemberConsume : String?
	let december : String?
	let decemberConsume : String?
	let january : String?
	let januaryConsume : String?
	let february : String?
	let februaryConsume : String?
	let march : String?
	let marchConsume : String?

	enum CodingKeys: String, CodingKey {

		case april = "april"
		case aprilConsume = "aprilConsume"
		case may = "may"
		case mayConsume = "mayConsume"
		case june = "june"
		case juneConsume = "juneConsume"
		case july = "july"
		case julyConsume = "julyConsume"
		case august = "august"
		case augustConsume = "augustConsume"
		case september = "september"
		case septemberConsume = "septemberConsume"
		case october = "october"
		case octoberConsume = "octoberConsume"
		case november = "november"
		case novemberConsume = "novemberConsume"
		case december = "december"
		case decemberConsume = "decemberConsume"
		case january = "january"
		case januaryConsume = "januaryConsume"
		case february = "february"
		case februaryConsume = "februaryConsume"
		case march = "march"
		case marchConsume = "marchConsume"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		april = try values.decodeIfPresent(String.self, forKey: .april)
		aprilConsume = try values.decodeIfPresent(String.self, forKey: .aprilConsume)
		may = try values.decodeIfPresent(String.self, forKey: .may)
		mayConsume = try values.decodeIfPresent(String.self, forKey: .mayConsume)
		june = try values.decodeIfPresent(String.self, forKey: .june)
		juneConsume = try values.decodeIfPresent(String.self, forKey: .juneConsume)
		july = try values.decodeIfPresent(String.self, forKey: .july)
		julyConsume = try values.decodeIfPresent(String.self, forKey: .julyConsume)
		august = try values.decodeIfPresent(String.self, forKey: .august)
		augustConsume = try values.decodeIfPresent(String.self, forKey: .augustConsume)
		september = try values.decodeIfPresent(String.self, forKey: .september)
		septemberConsume = try values.decodeIfPresent(String.self, forKey: .septemberConsume)
		october = try values.decodeIfPresent(String.self, forKey: .october)
		octoberConsume = try values.decodeIfPresent(String.self, forKey: .octoberConsume)
		november = try values.decodeIfPresent(String.self, forKey: .november)
		novemberConsume = try values.decodeIfPresent(String.self, forKey: .novemberConsume)
		december = try values.decodeIfPresent(String.self, forKey: .december)
		decemberConsume = try values.decodeIfPresent(String.self, forKey: .decemberConsume)
		january = try values.decodeIfPresent(String.self, forKey: .january)
		januaryConsume = try values.decodeIfPresent(String.self, forKey: .januaryConsume)
		february = try values.decodeIfPresent(String.self, forKey: .february)
		februaryConsume = try values.decodeIfPresent(String.self, forKey: .februaryConsume)
		march = try values.decodeIfPresent(String.self, forKey: .march)
		marchConsume = try values.decodeIfPresent(String.self, forKey: .marchConsume)
	}

}
