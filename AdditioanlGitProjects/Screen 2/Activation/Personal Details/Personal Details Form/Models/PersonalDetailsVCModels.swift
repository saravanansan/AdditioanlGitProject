//
//  PersonalDetailsVCModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation


struct PersonalDetailsVCModels{
	var dropdownSelection: DropdownMenuOptions = .stateList
	var datePickerType: DatePickerCategoryEnum = .birthDay
	var dateFormat : DateFormatString = .dd_mm_yyyy_slag
	var maritalStatus = -1
	var whatsAppCheckBoxStatus = false
	var stateID: Int = -1
	var cityId = -1
	var districtID: Int = -1
	var isFormEditable: Bool = false
	
	
	enum DropdownMenuOptions{
		case stateList
		case cityList
		case district
		case child1Gender
		case child2Gender
		case child3Gender
	}
	
	enum DatePickerCategoryEnum{
		case anivarasary
		case birthDay
		case spouseDOB
		case child1DOB
		case child2DOB
		case Child3DOB
	}
}
