//
//  LstOrderListings.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct LstOrderListings : Codable {
	let rowCount : String?
	let productDetails : String?
	let quanity : String?
	let rate : String?
	let porductAmount : String?
	let gst : String?
	let roundOff : String?
	let total_Amount : String?

	enum CodingKeys: String, CodingKey {

		case rowCount = "rowCount"
		case productDetails = "productDetails"
		case quanity = "quanity"
		case rate = "rate"
		case porductAmount = "porductAmount"
		case gst = "gst"
		case roundOff = "roundOff"
		case total_Amount = "total_Amount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rowCount = try values.decodeIfPresent(String.self, forKey: .rowCount)
		productDetails = try values.decodeIfPresent(String.self, forKey: .productDetails)
		quanity = try values.decodeIfPresent(String.self, forKey: .quanity)
		rate = try values.decodeIfPresent(String.self, forKey: .rate)
		porductAmount = try values.decodeIfPresent(String.self, forKey: .porductAmount)
		gst = try values.decodeIfPresent(String.self, forKey: .gst)
		roundOff = try values.decodeIfPresent(String.self, forKey: .roundOff)
		total_Amount = try values.decodeIfPresent(String.self, forKey: .total_Amount)
	}

}
