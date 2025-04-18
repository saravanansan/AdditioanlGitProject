/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstGSTDetails : Codable {
	let gstNumber : String?
	let gstName : String?
	let gstDocument : String?
	let gstAddress : String?
	let actorID : Int?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case gstNumber = "gstNumber"
		case gstName = "gstName"
		case gstDocument = "gstDocument"
		case gstAddress = "gstAddress"
		case actorID = "actorID"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gstNumber = try values.decodeIfPresent(String.self, forKey: .gstNumber)
		gstName = try values.decodeIfPresent(String.self, forKey: .gstName)
		gstDocument = try values.decodeIfPresent(String.self, forKey: .gstDocument)
		gstAddress = try values.decodeIfPresent(String.self, forKey: .gstAddress)
		actorID = try values.decodeIfPresent(Int.self, forKey: .actorID)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}