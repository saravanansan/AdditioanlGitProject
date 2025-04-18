/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstPanDetails1 : Codable {
	let code : Int?
	let timestamp : Int?
	let transaction_id : String?
	let data : String?
	let panId : String?
	let panName : String?
	let dob : String?
	let isVerified : String?
	let status : String?
	let verifiedStatus : String?
	let verifiedBy : String?
	let modifiedDate : String?
	let modifiedBy : Int?
	let panImage : String?
	let result : String?
	let message : String?
	let aAdharId : String?
	let aAdharName : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case timestamp = "timestamp"
		case transaction_id = "transaction_id"
		case data = "data"
		case panId = "panId"
		case panName = "panName"
		case dob = "dob"
		case isVerified = "isVerified"
		case status = "status"
		case verifiedStatus = "verifiedStatus"
		case verifiedBy = "verifiedBy"
		case modifiedDate = "modifiedDate"
		case modifiedBy = "modifiedBy"
		case panImage = "panImage"
		case result = "result"
		case message = "message"
		case aAdharId = "aAdharId"
		case aAdharName = "aAdharName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
		transaction_id = try values.decodeIfPresent(String.self, forKey: .transaction_id)
		data = try values.decodeIfPresent(String.self, forKey: .data)
		panId = try values.decodeIfPresent(String.self, forKey: .panId)
		panName = try values.decodeIfPresent(String.self, forKey: .panName)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		isVerified = try values.decodeIfPresent(String.self, forKey: .isVerified)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		verifiedStatus = try values.decodeIfPresent(String.self, forKey: .verifiedStatus)
		verifiedBy = try values.decodeIfPresent(String.self, forKey: .verifiedBy)
		modifiedDate = try values.decodeIfPresent(String.self, forKey: .modifiedDate)
		modifiedBy = try values.decodeIfPresent(Int.self, forKey: .modifiedBy)
		panImage = try values.decodeIfPresent(String.self, forKey: .panImage)
		result = try values.decodeIfPresent(String.self, forKey: .result)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		aAdharId = try values.decodeIfPresent(String.self, forKey: .aAdharId)
		aAdharName = try values.decodeIfPresent(String.self, forKey: .aAdharName)
	}

}
