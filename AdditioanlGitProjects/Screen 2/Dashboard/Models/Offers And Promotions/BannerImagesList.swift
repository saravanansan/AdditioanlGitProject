//
//  BannerImagesList.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation



struct BannerImagesList : Codable {
	let imageGalleryUrl : String?
	let albumCategoryID : Int?
	let actionImageUrl : String?
	let albumID : Int?
	let displayName : String?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case imageGalleryUrl = "imageGalleryUrl"
		case albumCategoryID = "albumCategoryID"
		case actionImageUrl = "actionImageUrl"
		case albumID = "albumID"
		case displayName = "displayName"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		imageGalleryUrl = try values.decodeIfPresent(String.self, forKey: .imageGalleryUrl)
		albumCategoryID = try values.decodeIfPresent(Int.self, forKey: .albumCategoryID)
		actionImageUrl = try values.decodeIfPresent(String.self, forKey: .actionImageUrl)
		albumID = try values.decodeIfPresent(Int.self, forKey: .albumID)
		displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
