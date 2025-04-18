//
//  MyPurchaseDetailsModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct MyPurchaseDetailsModels : Codable {
	let lstInvoiceListings : [LstInvoiceListings]?
	let lstOrderListings : [LstOrderListings]?
	let pdf : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstInvoiceListings = "lstInvoiceListings"
		case lstOrderListings = "lstOrderListings"
		case pdf = "pdf"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstInvoiceListings = try values.decodeIfPresent([LstInvoiceListings].self, forKey: .lstInvoiceListings)
		lstOrderListings = try values.decodeIfPresent([LstOrderListings].self, forKey: .lstOrderListings)
		pdf = try values.decodeIfPresent(String.self, forKey: .pdf)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
