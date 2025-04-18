/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjPanDetailsRetrieverequest1 : Codable {
	let panNumber : String?
	let firstName : String?
	let lastName : String?
	let dateOfBirth : String?
	let isPanValid : Int?
	let panImage : String?
	let loyaltyId : String?
	let aAdharNumber : String?
	let aAdharImage : String?
	let refferID : String?
	let otp : String?
	let transactionID : String?
	let promotID : String?
	let responseCode : Int?
	let identityStatus : String?
	let identity_ID : Int?
	let l_IdentityTypeID : Int?
	let identificationList : String?
	let checkReferenceList : String?
	let isAAdharValid : Int?
	let isAAdharValidMessage : String?
	let remarks : String?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case panNumber = "panNumber"
		case firstName = "firstName"
		case lastName = "lastName"
		case dateOfBirth = "dateOfBirth"
		case isPanValid = "isPanValid"
		case panImage = "panImage"
		case loyaltyId = "loyaltyId"
		case aAdharNumber = "aAdharNumber"
		case aAdharImage = "aAdharImage"
		case refferID = "refferID"
		case otp = "otp"
		case transactionID = "transactionID"
		case promotID = "promotID"
		case responseCode = "responseCode"
		case identityStatus = "identityStatus"
		case identity_ID = "identity_ID"
		case l_IdentityTypeID = "l_IdentityTypeID"
		case identificationList = "identificationList"
		case checkReferenceList = "checkReferenceList"
		case isAAdharValid = "isAAdharValid"
		case isAAdharValidMessage = "isAAdharValidMessage"
		case remarks = "remarks"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		panNumber = try values.decodeIfPresent(String.self, forKey: .panNumber)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
		isPanValid = try values.decodeIfPresent(Int.self, forKey: .isPanValid)
		panImage = try values.decodeIfPresent(String.self, forKey: .panImage)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		aAdharNumber = try values.decodeIfPresent(String.self, forKey: .aAdharNumber)
		aAdharImage = try values.decodeIfPresent(String.self, forKey: .aAdharImage)
		refferID = try values.decodeIfPresent(String.self, forKey: .refferID)
		otp = try values.decodeIfPresent(String.self, forKey: .otp)
		transactionID = try values.decodeIfPresent(String.self, forKey: .transactionID)
		promotID = try values.decodeIfPresent(String.self, forKey: .promotID)
		responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)
		identityStatus = try values.decodeIfPresent(String.self, forKey: .identityStatus)
		identity_ID = try values.decodeIfPresent(Int.self, forKey: .identity_ID)
		l_IdentityTypeID = try values.decodeIfPresent(Int.self, forKey: .l_IdentityTypeID)
		identificationList = try values.decodeIfPresent(String.self, forKey: .identificationList)
		checkReferenceList = try values.decodeIfPresent(String.self, forKey: .checkReferenceList)
		isAAdharValid = try values.decodeIfPresent(Int.self, forKey: .isAAdharValid)
		isAAdharValidMessage = try values.decodeIfPresent(String.self, forKey: .isAAdharValidMessage)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
