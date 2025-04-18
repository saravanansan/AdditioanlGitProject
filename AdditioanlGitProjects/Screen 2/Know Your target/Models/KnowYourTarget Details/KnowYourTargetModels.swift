//
//  KnowYourTargetModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation

struct KnowYourTargetModels : Codable {
	let lstAnnualCustomerTargetDetails : [LstAnnualCustomerTargetDetails]?
	let lstQuaterlyBaseTargetDetails : [LstQuaterlyBaseTargetDetails]?
	let lstBrandQuaterlyBaseTargetDetails : [LstBrandQuaterlyBaseTargetDetails]?
	let lstCustomerMonthlyTargets : [LstCustomerMonthlyTargets]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case lstAnnualCustomerTargetDetails = "lstAnnualCustomerTargetDetails"
		case lstQuaterlyBaseTargetDetails = "lstQuaterlyBaseTargetDetails"
		case lstBrandQuaterlyBaseTargetDetails = "lstBrandQuaterlyBaseTargetDetails"
		case lstCustomerMonthlyTargets = "lstCustomerMonthlyTargets"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lstAnnualCustomerTargetDetails = try values.decodeIfPresent([LstAnnualCustomerTargetDetails].self, forKey: .lstAnnualCustomerTargetDetails)
		lstQuaterlyBaseTargetDetails = try values.decodeIfPresent([LstQuaterlyBaseTargetDetails].self, forKey: .lstQuaterlyBaseTargetDetails)
		lstBrandQuaterlyBaseTargetDetails = try values.decodeIfPresent([LstBrandQuaterlyBaseTargetDetails].self, forKey: .lstBrandQuaterlyBaseTargetDetails)
		lstCustomerMonthlyTargets = try values.decodeIfPresent([LstCustomerMonthlyTargets].self, forKey: .lstCustomerMonthlyTargets)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
