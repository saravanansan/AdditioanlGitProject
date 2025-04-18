//
//  HelpTopicModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation


struct HelpTopicModels : Codable {
	let objHelpTopicList : [ObjHelpTopicList]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case objHelpTopicList = "objHelpTopicList"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objHelpTopicList = try values.decodeIfPresent([ObjHelpTopicList].self, forKey: .objHelpTopicList)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}
}
