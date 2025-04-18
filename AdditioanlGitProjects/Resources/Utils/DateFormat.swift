//
//  DateFormat.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation

class DateFormat{
	static let shared = DateFormat()
	private init(){}
	
	//    MARK: - DATE FORMAT CHANGER
	func customDateFormat(date: String,fromDate: String = "MM/dd/yyyy",toDate: String = "dd/MM/yyyy") -> String {
		let inputFormatter = DateFormatter()
		inputFormatter.dateFormat = fromDate
		let showDate = inputFormatter.date(from: date)
		inputFormatter.dateFormat = toDate
		if let showDate = showDate{
			let resultString = inputFormatter.string(from: showDate)
			return resultString
		}else{
			return date
		}
	}
	
	func getCurrentDateTimeString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "ddMMyyyy_HH:mm:ss" // Set the desired format
		let currentDateTime = Date()
		return formatter.string(from: currentDateTime)
	}
}

