//
//  LstInvoiceListings.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstInvoiceListings : Codable {
	let invoiceNo : String?
	let orderNo : String?
	let locationCode : String?
	let points : Int?
	let invoiceDate : String?

	enum CodingKeys: String, CodingKey {

		case invoiceNo = "invoiceNo"
		case orderNo = "orderNo"
		case locationCode = "locationCode"
		case points = "points"
		case invoiceDate = "invoiceDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		orderNo = try values.decodeIfPresent(String.self, forKey: .orderNo)
		locationCode = try values.decodeIfPresent(String.self, forKey: .locationCode)
		points = try values.decodeIfPresent(Int.self, forKey: .points)
		invoiceDate = try values.decodeIfPresent(String.self, forKey: .invoiceDate)
	}

}
