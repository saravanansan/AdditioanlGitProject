//
//  MDIntroModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation

struct MDIntroModels : Codable {
	let objImageGalleryList : [ObjImageGalleryList]?

	enum CodingKeys: String, CodingKey {

		case objImageGalleryList = "objImageGalleryList"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objImageGalleryList = try values.decodeIfPresent([ObjImageGalleryList].self, forKey: .objImageGalleryList)
	}

}
