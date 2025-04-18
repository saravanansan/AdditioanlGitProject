//
//  DashboardBannerModel.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation


struct DashboardBannerModel : Codable {
	let objImageGalleryList : [BannerImagesList]?

	enum CodingKeys: String, CodingKey {

		case objImageGalleryList = "objImageGalleryList"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objImageGalleryList = try values.decodeIfPresent([BannerImagesList].self, forKey: .objImageGalleryList)
	}

}
