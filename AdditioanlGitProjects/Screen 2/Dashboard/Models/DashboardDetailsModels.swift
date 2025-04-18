//
//  DashboardDetailsModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


struct DashboardDetailsModels{
	var customerImage: String?
	var firstName: String?
	var lastName: String?
	var customerEmail: String?
	var customerMobile: String?
	var membershipId: String?
	var tierGarde: String?
	var eligiblePoints: String?
	var redemablePoints: String?
	var annualTarget: String?
	var achieveTarget: String = "Achieve -- of your annual target by --"
	var annualTargetProgressbarValue: Double? = 0.0
	var annualTagetPointsValue : Int?
	var annualTargetStartDate: String?
	var annualTagetEndDate: String?
	var userActiveStatus: Bool?
}
