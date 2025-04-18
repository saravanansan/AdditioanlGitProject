//
//  GetQuarterDetails.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 06/11/24.
//

import Foundation


class GetQuarterDetails{
	static var financeYear = GetQuarterDetails.getFinanceYearRange()
	
	static func getCurrentQuarter(for date: Date = Date() ) -> Int {
		let calendar = Calendar.current
			let month = calendar.component(.month, from: date)
			
			// Adjust month to start financial year from April
			let adjustedMonth = (month - 4 + 12) % 12 + 1
			
			// Calculate quarter based on adjusted month
			return (adjustedMonth - 1) / 3 + 1
		
		
	}
	
	static func getFinanceYearRange(for date: Date = Date()) -> (startYear: Int, endYear: Int) {
		let calendar = Calendar.current
		let year = calendar.component(.year, from: date)
		let month = calendar.component(.month, from: date)
		
		// Determine start and end year based on fiscal year beginning in April
		let startYear = month >= 4 ? year : year - 1
		let endYear = startYear + 1
		
		return (startYear: startYear, endYear: endYear)
	}

	
}
