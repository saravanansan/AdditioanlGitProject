//
//  MyPurchaseFilterModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


struct MyPurchaseFilterModels{
	var datePickerType: DatePickerCategorys = .toDate
	var dateFormat : DateFormatString = .dd_mm_yyyy
	
	
	var startIndex = 1
	var noOfElement = 0
	var statusID = -1
	var fromDate = ""
	var toDate = ""
	
	
	@frozen enum DatePickerCategorys{
		case fromDate
		case toDate
	}
}
