//
//  CustomerFamilyList.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation


struct CustomerFamilyList : Codable {
	let custFamilyId : Int?
	let familyMemberName : String?
	let familyMemberBirthday : String?
	let relationship : String?
	let childGender : String?
	let userId : Int?
	let customerId : Int?
	let firstName : String?
	let lastName : String?
	let loyaltyId : String?
	let title : String?
	let address : String?
	let designation : String?
	let company : String?
	let present : Bool?
	let tardy : Bool?
	let attendanceDate : String?
	let present_Count : Int?
	let tardy_Count : Int?
	let absent_Count : Int?
	let month_Name : String?
	let month_No : Int?
	let locationName : String?
	let territoryName : String?
	let encashBalance : Int?
	let customerGrade : String?
	let languageId : Int?
	let languageName : String?
	let nativeStateId : Int?
	let nativeStateName : String?
	let district : String?
	let locationId : Int?
	let requiredPoints : Int?
	let profilePicture : String?
	let tahasilImage : String?
	let bonusDate : String?
	let bonusName : String?
	let bonusValue : String?
	let issueDescription : String?
	let storeName : String?
	let verifiedStatus : Int?
	let isDelete : Int?
	let cashBack : Int?
	let verificationStatus : String?
	let callStatusId : Int?
	let callRemarks : String?
	let isBlacklisted : Int?
	let isDormant : Int?
	let isOnHold : Int?
	let pinStatus : Int?
	let ownerName : String?
	let walletNumber : String?
	let referenceNo : String?
	let color : String?
	let referralCode : String?
	let accountStatusId : Int?
	let sfaCode : String?
	let onlineAcademy : Int?
	let liveClassRoom : Int?
	let redemptionThreshold : Int?
	let nomineeAge : Int?
	let nomineeRelationShipId : Int?

	enum CodingKeys: String, CodingKey {

		case custFamilyId = "custFamilyId"
		case familyMemberName = "familyMemberName"
		case familyMemberBirthday = "familyMemberBirthday"
		case relationship = "relationship"
		case childGender = "childGender"
		case userId = "userId"
		case customerId = "customerId"
		case firstName = "firstName"
		case lastName = "lastName"
		case loyaltyId = "loyaltyId"
		case title = "title"
		case address = "address"
		case designation = "designation"
		case company = "company"
		case present = "present"
		case tardy = "tardy"
		case attendanceDate = "attendanceDate"
		case present_Count = "present_Count"
		case tardy_Count = "tardy_Count"
		case absent_Count = "absent_Count"
		case month_Name = "month_Name"
		case month_No = "month_No"
		case locationName = "locationName"
		case territoryName = "territoryName"
		case encashBalance = "encashBalance"
		case customerGrade = "customerGrade"
		case languageId = "languageId"
		case languageName = "languageName"
		case nativeStateId = "nativeStateId"
		case nativeStateName = "nativeStateName"
		case district = "district"
		case locationId = "locationId"
		case requiredPoints = "requiredPoints"
		case profilePicture = "profilePicture"
		case tahasilImage = "tahasilImage"
		case bonusDate = "bonusDate"
		case bonusName = "bonusName"
		case bonusValue = "bonusValue"
		case issueDescription = "issueDescription"
		case storeName = "storeName"
		case verifiedStatus = "verifiedStatus"
		case isDelete = "isDelete"
		case cashBack = "cashBack"
		case verificationStatus = "verificationStatus"
		case callStatusId = "callStatusId"
		case callRemarks = "callRemarks"
		case isBlacklisted = "isBlacklisted"
		case isDormant = "isDormant"
		case isOnHold = "isOnHold"
		case pinStatus = "pinStatus"
		case ownerName = "ownerName"
		case walletNumber = "walletNumber"
		case referenceNo = "referenceNo"
		case color = "color"
		case referralCode = "referralCode"
		case accountStatusId = "accountStatusId"
		case sfaCode = "sfaCode"
		case onlineAcademy = "onlineAcademy"
		case liveClassRoom = "liveClassRoom"
		case redemptionThreshold = "redemptionThreshold"
		case nomineeAge = "nomineeAge"
		case nomineeRelationShipId = "nomineeRelationShipId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		custFamilyId = try values.decodeIfPresent(Int.self, forKey: .custFamilyId)
		familyMemberName = try values.decodeIfPresent(String.self, forKey: .familyMemberName)
		familyMemberBirthday = try values.decodeIfPresent(String.self, forKey: .familyMemberBirthday)
		relationship = try values.decodeIfPresent(String.self, forKey: .relationship)
		childGender = try values.decodeIfPresent(String.self, forKey: .childGender)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		designation = try values.decodeIfPresent(String.self, forKey: .designation)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		present = try values.decodeIfPresent(Bool.self, forKey: .present)
		tardy = try values.decodeIfPresent(Bool.self, forKey: .tardy)
		attendanceDate = try values.decodeIfPresent(String.self, forKey: .attendanceDate)
		present_Count = try values.decodeIfPresent(Int.self, forKey: .present_Count)
		tardy_Count = try values.decodeIfPresent(Int.self, forKey: .tardy_Count)
		absent_Count = try values.decodeIfPresent(Int.self, forKey: .absent_Count)
		month_Name = try values.decodeIfPresent(String.self, forKey: .month_Name)
		month_No = try values.decodeIfPresent(Int.self, forKey: .month_No)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		territoryName = try values.decodeIfPresent(String.self, forKey: .territoryName)
		encashBalance = try values.decodeIfPresent(Int.self, forKey: .encashBalance)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		languageId = try values.decodeIfPresent(Int.self, forKey: .languageId)
		languageName = try values.decodeIfPresent(String.self, forKey: .languageName)
		nativeStateId = try values.decodeIfPresent(Int.self, forKey: .nativeStateId)
		nativeStateName = try values.decodeIfPresent(String.self, forKey: .nativeStateName)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
		requiredPoints = try values.decodeIfPresent(Int.self, forKey: .requiredPoints)
		profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
		tahasilImage = try values.decodeIfPresent(String.self, forKey: .tahasilImage)
		bonusDate = try values.decodeIfPresent(String.self, forKey: .bonusDate)
		bonusName = try values.decodeIfPresent(String.self, forKey: .bonusName)
		bonusValue = try values.decodeIfPresent(String.self, forKey: .bonusValue)
		issueDescription = try values.decodeIfPresent(String.self, forKey: .issueDescription)
		storeName = try values.decodeIfPresent(String.self, forKey: .storeName)
		verifiedStatus = try values.decodeIfPresent(Int.self, forKey: .verifiedStatus)
		isDelete = try values.decodeIfPresent(Int.self, forKey: .isDelete)
		cashBack = try values.decodeIfPresent(Int.self, forKey: .cashBack)
		verificationStatus = try values.decodeIfPresent(String.self, forKey: .verificationStatus)
		callStatusId = try values.decodeIfPresent(Int.self, forKey: .callStatusId)
		callRemarks = try values.decodeIfPresent(String.self, forKey: .callRemarks)
		isBlacklisted = try values.decodeIfPresent(Int.self, forKey: .isBlacklisted)
		isDormant = try values.decodeIfPresent(Int.self, forKey: .isDormant)
		isOnHold = try values.decodeIfPresent(Int.self, forKey: .isOnHold)
		pinStatus = try values.decodeIfPresent(Int.self, forKey: .pinStatus)
		ownerName = try values.decodeIfPresent(String.self, forKey: .ownerName)
		walletNumber = try values.decodeIfPresent(String.self, forKey: .walletNumber)
		referenceNo = try values.decodeIfPresent(String.self, forKey: .referenceNo)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
		accountStatusId = try values.decodeIfPresent(Int.self, forKey: .accountStatusId)
		sfaCode = try values.decodeIfPresent(String.self, forKey: .sfaCode)
		onlineAcademy = try values.decodeIfPresent(Int.self, forKey: .onlineAcademy)
		liveClassRoom = try values.decodeIfPresent(Int.self, forKey: .liveClassRoom)
		redemptionThreshold = try values.decodeIfPresent(Int.self, forKey: .redemptionThreshold)
		nomineeAge = try values.decodeIfPresent(Int.self, forKey: .nomineeAge)
		nomineeRelationShipId = try values.decodeIfPresent(Int.self, forKey: .nomineeRelationShipId)
	}

}
