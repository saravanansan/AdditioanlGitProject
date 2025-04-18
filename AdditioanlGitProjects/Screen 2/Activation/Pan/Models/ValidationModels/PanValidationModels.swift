

import Foundation
struct PanValidationModels : Codable {
	let objPanDetailsRetrieverequest : ObjPanDetailsRetrieverequest1?
	let lstPanDetails : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case objPanDetailsRetrieverequest = "objPanDetailsRetrieverequest"
		case lstPanDetails = "lstPanDetails"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objPanDetailsRetrieverequest = try values.decodeIfPresent(ObjPanDetailsRetrieverequest1.self, forKey: .objPanDetailsRetrieverequest)
		lstPanDetails = try values.decodeIfPresent(String.self, forKey: .lstPanDetails)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
