//
//  DropdownDataModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import Foundation


struct DropdownDataModels{
	var statusName: String?
	var statusId: Int?
	init(statusName: String? = nil, statusId: Int? = nil) {
		self.statusName = statusName
		self.statusId = statusId
	}
}

struct MyDealerFilterModels{
	var statusName: String?
	var statusId : Int?
}

