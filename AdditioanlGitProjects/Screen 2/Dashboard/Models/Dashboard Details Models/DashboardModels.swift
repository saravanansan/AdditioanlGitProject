//
//  DashboardModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


struct DashboardModels : Codable {
	let objCustomerDashboardMenuList : String?
	let objCustomerDashboardList : [ObjCustomerDashboardList]?
	let objActivityDetailsList : String?
	let objActivityDetailsJsonList : [ObjActivityDetailsJsonList]?
	let objGamificationTransaction : String?
	let lstUserDashboardDetails : String?
	let lstPromotionListJsonApi : [LstPromotionListJsonApi]?
	let lstCustomerFeedBackJsonApi : [LstCustomerFeedBackJsonApi]?
	let lstLoyaltyProgramReport : [LstLoyaltyProgramReport]?
	let objImageGalleryList : String?
	let objCatalogueDetailsForCustomer : String?
	let activeStatus : Bool?
	let objProductList : String?
	let sessionID : String?
	let saP_Code : String?
	let deviceID : String?
	let loggedDeviceName : String?
	let lastActivatedDate : String?
	let totalPendingCount : Int?
	let lstCustomerTargetDetails : [LstCustomerTargetDetails]?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case objCustomerDashboardMenuList = "objCustomerDashboardMenuList"
		case objCustomerDashboardList = "objCustomerDashboardList"
		case objActivityDetailsList = "objActivityDetailsList"
		case objActivityDetailsJsonList = "objActivityDetailsJsonList"
		case objGamificationTransaction = "objGamificationTransaction"
		case lstUserDashboardDetails = "lstUserDashboardDetails"
		case lstPromotionListJsonApi = "lstPromotionListJsonApi"
		case lstCustomerFeedBackJsonApi = "lstCustomerFeedBackJsonApi"
		case lstLoyaltyProgramReport = "lstLoyaltyProgramReport"
		case objImageGalleryList = "objImageGalleryList"
		case objCatalogueDetailsForCustomer = "objCatalogueDetailsForCustomer"
		case activeStatus = "activeStatus"
		case objProductList = "objProductList"
		case sessionID = "sessionID"
		case saP_Code = "saP_Code"
		case deviceID = "deviceID"
		case loggedDeviceName = "loggedDeviceName"
		case lastActivatedDate = "lastActivatedDate"
		case totalPendingCount = "totalPendingCount"
		case lstCustomerTargetDetails = "lstCustomerTargetDetails"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objCustomerDashboardMenuList = try values.decodeIfPresent(String.self, forKey: .objCustomerDashboardMenuList)
		objCustomerDashboardList = try values.decodeIfPresent([ObjCustomerDashboardList].self, forKey: .objCustomerDashboardList)
		objActivityDetailsList = try values.decodeIfPresent(String.self, forKey: .objActivityDetailsList)
		objActivityDetailsJsonList = try values.decodeIfPresent([ObjActivityDetailsJsonList].self, forKey: .objActivityDetailsJsonList)
		objGamificationTransaction = try values.decodeIfPresent(String.self, forKey: .objGamificationTransaction)
		lstUserDashboardDetails = try values.decodeIfPresent(String.self, forKey: .lstUserDashboardDetails)
		lstPromotionListJsonApi = try values.decodeIfPresent([LstPromotionListJsonApi].self, forKey: .lstPromotionListJsonApi)
		lstCustomerFeedBackJsonApi = try values.decodeIfPresent([LstCustomerFeedBackJsonApi].self, forKey: .lstCustomerFeedBackJsonApi)
		lstLoyaltyProgramReport = try values.decodeIfPresent([LstLoyaltyProgramReport].self, forKey: .lstLoyaltyProgramReport)
		objImageGalleryList = try values.decodeIfPresent(String.self, forKey: .objImageGalleryList)
		objCatalogueDetailsForCustomer = try values.decodeIfPresent(String.self, forKey: .objCatalogueDetailsForCustomer)
		activeStatus = try values.decodeIfPresent(Bool.self, forKey: .activeStatus)
		objProductList = try values.decodeIfPresent(String.self, forKey: .objProductList)
		sessionID = try values.decodeIfPresent(String.self, forKey: .sessionID)
		saP_Code = try values.decodeIfPresent(String.self, forKey: .saP_Code)
		deviceID = try values.decodeIfPresent(String.self, forKey: .deviceID)
		loggedDeviceName = try values.decodeIfPresent(String.self, forKey: .loggedDeviceName)
		lastActivatedDate = try values.decodeIfPresent(String.self, forKey: .lastActivatedDate)
		totalPendingCount = try values.decodeIfPresent(Int.self, forKey: .totalPendingCount)
		lstCustomerTargetDetails = try values.decodeIfPresent([LstCustomerTargetDetails].self, forKey: .lstCustomerTargetDetails)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
