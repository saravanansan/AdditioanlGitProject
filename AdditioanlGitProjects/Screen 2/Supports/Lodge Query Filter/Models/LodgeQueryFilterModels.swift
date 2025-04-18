//
//  LodgeQueryFilterModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation

struct LodgeQueryFilterModels{
	var datePickerType: DatePickerCategorys = .toDate
	var dateFormat : DateFormatString = .dd_mm_yyyy
	var filterStatusList = [DropdownDataModels]()
	
	var startIndex = 1
	var noOfElement = 0
	var statusID = -1
	var fromDate = ""
	var toDate = ""
	var statusName = ""
	
	@frozen enum DatePickerCategorys{
		case fromDate
		case toDate
	}
}
