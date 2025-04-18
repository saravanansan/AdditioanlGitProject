//
//  ProfileNameUpdateModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 14/11/24.
//

import Foundation

struct ProfileNameUpdateModels : Codable {
	let objPanDetailsRetrieverequest : String?
	let lstPanDetails : String?
	let checkReferenceList : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case objPanDetailsRetrieverequest = "objPanDetailsRetrieverequest"
		case lstPanDetails = "lstPanDetails"
		case checkReferenceList = "checkReferenceList"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objPanDetailsRetrieverequest = try values.decodeIfPresent(String.self, forKey: .objPanDetailsRetrieverequest)
		lstPanDetails = try values.decodeIfPresent(String.self, forKey: .lstPanDetails)
		checkReferenceList = try values.decodeIfPresent(String.self, forKey: .checkReferenceList)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
