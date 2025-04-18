//
//  ObjCustomer.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/11/24.
//

import Foundation


struct ObjCustomer : Codable {
	let financialDate : String?
	let customerId : Int?
	let enrollmentBonus : Int?
	let merchantId : Int?
	let locationId : Int?
	let locationName : String?
	let loyaltyId : String?
	let enrollmentId : String?
	let address3 : String?
	let loyaltyIdAutoGen : Bool?
	let title : String?
	let firstName : String?
	let lastName : String?
	let dob : String?
	let jdob : String?
	let customer_Grade_ID : Int?
	let customerGrade : String?
	let customerType : String?
	let customerTypeID : Int?
	let registrationSource : Int?
	let password : String?
	let profilePicture : String?
	let memberSince : String?
	let customerEmail : String?
	let email : String?
	let userName : String?
	let customerMobile : String?
	let mobile : String?
	let mobilePrefix : String?
	let contactID : Int?
	let image : String?
	let book_App_Date : String?
	let jBook_App_Date : String?
	let customerRewardPoints : Int?
	let customerRewardCardBalance : Int?
	let lastActive : String?
	let frontofficeExecutive : String?
	let address : String?
	let designation : String?
	let company : String?
	let customerDob : String?
	let pointBalance : Int?
	let rewardPoints : Int?
	let pointExpired : Int?
	let giftedPoints : Int?
	let giftCardAmount : Double?
	let issuedGiftCardAmount : Double?
	let debitedGiftCardAmount : Double?
	let refundGiftCardAmount : Double?
	let giftedGiftCardAmount : Double?
	let customersRemarks : String?
	let subscriptionDurationID : Int?
	let merchantName : String?
	let vehicleNumber : String?
	let vehicleType : String?
	let chassisNumber : String?
	let engineNumber : String?
	let modelNumber : String?
	let incorporationDate : String?
	let dateOfSale : String?
	let jDateOfSale : String?
	let invoiceNo : String?
	let invoiceAmount : String?
	let locality : String?
	let customerTypeId : Int?
	let vehicleID : Int?
	let roleID : Int?
	let tradeLicence : String?
	let enrollmentReferenceNumber : String?
	let enrollmentReferenceDate : String?
	let jEnrollmentReferenceDate : String?
	let relateD_PROJECT_TYPE : String?
	let landlineNumber : String?
	let mobile_Two : String?
	let isVerified : Int?
	let district : String?
	let insuranceExpDate : String?
	let jInsuranceExpDate : String?
	let laborAmount : Int?
	let policyNumber : String?
	let policyDate : String?
	let jPolicyDate : String?
	let insuranceRenewalAmount : Int?
	let customerZip : String?
	let zip : String?
	let village : String?
	let tehsilBlockMandal : String?
	let payload : String?
	let presentKM : Double?
	let drivenBy : String?
	let isDriverChanging : String?
	let avgRunningPerMonth : Double?
	let customerIsActive : Bool?
	let isActive : Bool?
	let identificationTypeID : Int?
	let identificationNo : String?
	let displayImage : String?
	let encashBalance : Int?
	let maritalStatus : Int?
	let userId : Int?
	let nativeCountryId : Int?
	let nativeStateId : Int?
	let languageId : Int?
	let domain : String?
	let jD_InvoiceNo : String?
	let jD_InvoiceDate : String?
	let jjD_InvoiceDate : String?
	let isVinChassis_Active : String?
	let regType : String?
	let isUpdatePassword : Bool?
	let createdDate : String?
	let jCreatedDate : String?
	let createdBy : String?
	let nfcTagID : String?
	let accountTypeId : Int?
	let gender : String?
	let isGradeVerified : Bool?
	let isBlackListed : Bool?
	let districtId : Int?
	let talukId : Int?
	let accountNumber : String?
	let talukName : String?
	let districtName : String?
	let acountHolderName : String?
	let bankName : String?
	let bankBranch : String?
	let ifscCode : String?
	let mobileNumberLimitation : Int?
	let anniversary : String?
	let jAnniversary : String?
	let spouseName : String?
	let spouseDOB : String?
	let relationship : String?
	let areaId : Int?
	let areaName : String?
	let customerMenuId : String?
	let verifiedStatus : String?
	let postInternalNote : String?
	let departmentId : Int?
	let designationId : Int?
	let enrolledBy : String?
	let custAccountType : String?
	let gstNumber : String?
	let bankAccountVerifiedStatus : Int?
	let customerCategory : String?
	let customerCategoryId : Int?
	let referedBy : String?
	let nominee : String?
	let sourceOfLogin : String?
	let pushId : String?
	let nomineeDOB : String?
	let jNomineeDOB : String?
	let customerRelationshipId : Int?
	let customerRelationship : String?
	let locationCode : String?
	let walletNumber : String?
	let walletVerifiedStatus : Bool?
	let whatsAppNumber : String?
	let bankAddress : String?
	let bankSwiftCode : String?
	let bankIbanNumber : String?
	let bankRoutingNumber : String?
	let bankCountryID : Int?
	let bankCurrencyID : Int?
	let accountStatus : String?
	let regStatusId : Int?
	let contractName : String?
	let contractFileName : String?
	let sapNo : String?
	let vendorCode : String?
	let industryId : Int?
	let referrerCode : String?
	let referralCode : String?
	let remarks : String?
	let accountComStatus : Int?
	let contractId : Int?
	let regStatus : Int?
	let currency : String?
	let accountType : String?
	let totalNetValue : Int?
	let totalCollection : Int?
	let accountStatusId : Int?
	let targetCreditPeriod : Int?
	let targetValue : Int?
	let addressLatitude : String?
	let addressLongitude : String?
	let bankPassbookImage : String?
	let isBankPassbookNewImage : Bool?
	let parentCustomerId : Int?
	let rewardPoint : Double?
	let walletName : String?
	let customerStateId : Int?
	let stateId : Int?
	let customerCityId : Int?
	let cityId : Int?
	let language : String?
	let panStatus : String?
	let fromDate : String?
	let toDate : String?
	let searchText : String?
	let panStatusId : Int?
	let financeUserName : String?
	let financeEmailId : String?
	let financeName : String?
	let sscUserName : String?
	let sscEmailId : String?
	let sscName : String?
	let enrollmentStatus : Bool?
	let isProfilePictureUploaded : Bool?
	let isIDUploaded : Bool?
	let isF2FMeeting : Bool?
	let isCCVerified : Bool?
	let isSiteVerified : Bool?
	let isSemiUpdated : Bool?
	let isNameUpdated : Bool?
	let payOut : Int?
	let taxId : String?
	let recipientPhonenumber : String?
	let bankCity : String?
	let autoAccountType : String?
	let recipientType : String?
	let autoBankCounty : String?
	let bankPostCode : String?
	let bankCode : String?
	let branchCode : String?
	let customerOrderCount : Int?
	let nomineeAge : Int?
	let isPanVerified : Int?
	let vehicleColorCode : String?
	let vehicleVarientCode : String?
	let bookingId : String?
	let bookingDate : String?
	let bookingAmount : String?
	let vinNumber : String?
	let fileName : String?
	let fileType : String?
	let targetSale : Int?
	let membershipId : String?
	let upiId : String?
	let upiHolderName : String?
	let contactName : String?
	let contactPhone : String?
	let addressId : Int?
	let address1 : String?
	let address2 : String?
	let landmark : String?
	let countryId : Int?
	let cityName : String?
	let stateName : String?
	let countryName : String?
	let token : String?
	let actorId : Int?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case financialDate = "financialDate"
		case customerId = "customerId"
		case enrollmentBonus = "enrollmentBonus"
		case merchantId = "merchantId"
		case locationId = "locationId"
		case locationName = "locationName"
		case loyaltyId = "loyaltyId"
		case enrollmentId = "enrollmentId"
		case address3 = "address3"
		case loyaltyIdAutoGen = "loyaltyIdAutoGen"
		case title = "title"
		case firstName = "firstName"
		case lastName = "lastName"
		case dob = "dob"
		case jdob = "jdob"
		case customer_Grade_ID = "customer_Grade_ID"
		case customerGrade = "customerGrade"
		case customerType = "customerType"
		case customerTypeID = "customerTypeID"
		case registrationSource = "registrationSource"
		case password = "password"
		case profilePicture = "profilePicture"
		case memberSince = "memberSince"
		case customerEmail = "customerEmail"
		case email = "email"
		case userName = "userName"
		case customerMobile = "customerMobile"
		case mobile = "mobile"
		case mobilePrefix = "mobilePrefix"
		case contactID = "contactID"
		case image = "image"
		case book_App_Date = "book_App_Date"
		case jBook_App_Date = "jBook_App_Date"
		case customerRewardPoints = "customerRewardPoints"
		case customerRewardCardBalance = "customerRewardCardBalance"
		case lastActive = "lastActive"
		case frontofficeExecutive = "frontofficeExecutive"
		case address = "address"
		case designation = "designation"
		case company = "company"
		case customerDob = "customerDob"
		case pointBalance = "pointBalance"
		case rewardPoints = "rewardPoints"
		case pointExpired = "pointExpired"
		case giftedPoints = "giftedPoints"
		case giftCardAmount = "giftCardAmount"
		case issuedGiftCardAmount = "issuedGiftCardAmount"
		case debitedGiftCardAmount = "debitedGiftCardAmount"
		case refundGiftCardAmount = "refundGiftCardAmount"
		case giftedGiftCardAmount = "giftedGiftCardAmount"
		case customersRemarks = "customersRemarks"
		case subscriptionDurationID = "subscriptionDurationID"
		case merchantName = "merchantName"
		case vehicleNumber = "vehicleNumber"
		case vehicleType = "vehicleType"
		case chassisNumber = "chassisNumber"
		case engineNumber = "engineNumber"
		case modelNumber = "modelNumber"
		case incorporationDate = "incorporationDate"
		case dateOfSale = "dateOfSale"
		case jDateOfSale = "jDateOfSale"
		case invoiceNo = "invoiceNo"
		case invoiceAmount = "invoiceAmount"
		case locality = "locality"
		case customerTypeId = "customerTypeId"
		case vehicleID = "vehicleID"
		case roleID = "roleID"
		case tradeLicence = "tradeLicence"
		case enrollmentReferenceNumber = "enrollmentReferenceNumber"
		case enrollmentReferenceDate = "enrollmentReferenceDate"
		case jEnrollmentReferenceDate = "jEnrollmentReferenceDate"
		case relateD_PROJECT_TYPE = "relateD_PROJECT_TYPE"
		case landlineNumber = "landlineNumber"
		case mobile_Two = "mobile_Two"
		case isVerified = "isVerified"
		case district = "district"
		case insuranceExpDate = "insuranceExpDate"
		case jInsuranceExpDate = "jInsuranceExpDate"
		case laborAmount = "laborAmount"
		case policyNumber = "policyNumber"
		case policyDate = "policyDate"
		case jPolicyDate = "jPolicyDate"
		case insuranceRenewalAmount = "insuranceRenewalAmount"
		case customerZip = "customerZip"
		case zip = "zip"
		case village = "village"
		case tehsilBlockMandal = "tehsilBlockMandal"
		case payload = "payload"
		case presentKM = "presentKM"
		case drivenBy = "drivenBy"
		case isDriverChanging = "isDriverChanging"
		case avgRunningPerMonth = "avgRunningPerMonth"
		case customerIsActive = "customerIsActive"
		case isActive = "isActive"
		case identificationTypeID = "identificationTypeID"
		case identificationNo = "identificationNo"
		case displayImage = "displayImage"
		case encashBalance = "encashBalance"
		case maritalStatus = "maritalStatus"
		case userId = "userId"
		case nativeCountryId = "nativeCountryId"
		case nativeStateId = "nativeStateId"
		case languageId = "languageId"
		case domain = "domain"
		case jD_InvoiceNo = "jD_InvoiceNo"
		case jD_InvoiceDate = "jD_InvoiceDate"
		case jjD_InvoiceDate = "jjD_InvoiceDate"
		case isVinChassis_Active = "isVinChassis_Active"
		case regType = "regType"
		case isUpdatePassword = "isUpdatePassword"
		case createdDate = "createdDate"
		case jCreatedDate = "jCreatedDate"
		case createdBy = "createdBy"
		case nfcTagID = "nfcTagID"
		case accountTypeId = "accountTypeId"
		case gender = "gender"
		case isGradeVerified = "isGradeVerified"
		case isBlackListed = "isBlackListed"
		case districtId = "districtId"
		case talukId = "talukId"
		case accountNumber = "accountNumber"
		case talukName = "talukName"
		case districtName = "districtName"
		case acountHolderName = "acountHolderName"
		case bankName = "bankName"
		case bankBranch = "bankBranch"
		case ifscCode = "ifscCode"
		case mobileNumberLimitation = "mobileNumberLimitation"
		case anniversary = "anniversary"
		case jAnniversary = "jAnniversary"
		case spouseName = "spouseName"
		case spouseDOB = "spouseDOB"
		case relationship = "relationship"
		case areaId = "areaId"
		case areaName = "areaName"
		case customerMenuId = "customerMenuId"
		case verifiedStatus = "verifiedStatus"
		case postInternalNote = "postInternalNote"
		case departmentId = "departmentId"
		case designationId = "designationId"
		case enrolledBy = "enrolledBy"
		case custAccountType = "custAccountType"
		case gstNumber = "gstNumber"
		case bankAccountVerifiedStatus = "bankAccountVerifiedStatus"
		case customerCategory = "customerCategory"
		case customerCategoryId = "customerCategoryId"
		case referedBy = "referedBy"
		case nominee = "nominee"
		case sourceOfLogin = "sourceOfLogin"
		case pushId = "pushId"
		case nomineeDOB = "nomineeDOB"
		case jNomineeDOB = "jNomineeDOB"
		case customerRelationshipId = "customerRelationshipId"
		case customerRelationship = "customerRelationship"
		case locationCode = "locationCode"
		case walletNumber = "walletNumber"
		case walletVerifiedStatus = "walletVerifiedStatus"
		case whatsAppNumber = "whatsAppNumber"
		case bankAddress = "bankAddress"
		case bankSwiftCode = "bankSwiftCode"
		case bankIbanNumber = "bankIbanNumber"
		case bankRoutingNumber = "bankRoutingNumber"
		case bankCountryID = "bankCountryID"
		case bankCurrencyID = "bankCurrencyID"
		case accountStatus = "accountStatus"
		case regStatusId = "regStatusId"
		case contractName = "contractName"
		case contractFileName = "contractFileName"
		case sapNo = "sapNo"
		case vendorCode = "vendorCode"
		case industryId = "industryId"
		case referrerCode = "referrerCode"
		case referralCode = "referralCode"
		case remarks = "remarks"
		case accountComStatus = "accountComStatus"
		case contractId = "contractId"
		case regStatus = "regStatus"
		case currency = "currency"
		case accountType = "accountType"
		case totalNetValue = "totalNetValue"
		case totalCollection = "totalCollection"
		case accountStatusId = "accountStatusId"
		case targetCreditPeriod = "targetCreditPeriod"
		case targetValue = "targetValue"
		case addressLatitude = "addressLatitude"
		case addressLongitude = "addressLongitude"
		case bankPassbookImage = "bankPassbookImage"
		case isBankPassbookNewImage = "isBankPassbookNewImage"
		case parentCustomerId = "parentCustomerId"
		case rewardPoint = "rewardPoint"
		case walletName = "walletName"
		case customerStateId = "customerStateId"
		case stateId = "stateId"
		case customerCityId = "customerCityId"
		case cityId = "cityId"
		case language = "language"
		case panStatus = "panStatus"
		case fromDate = "fromDate"
		case toDate = "toDate"
		case searchText = "searchText"
		case panStatusId = "panStatusId"
		case financeUserName = "financeUserName"
		case financeEmailId = "financeEmailId"
		case financeName = "financeName"
		case sscUserName = "sscUserName"
		case sscEmailId = "sscEmailId"
		case sscName = "sscName"
		case enrollmentStatus = "enrollmentStatus"
		case isProfilePictureUploaded = "isProfilePictureUploaded"
		case isIDUploaded = "isIDUploaded"
		case isF2FMeeting = "isF2FMeeting"
		case isCCVerified = "isCCVerified"
		case isSiteVerified = "isSiteVerified"
		case isSemiUpdated = "isSemiUpdated"
		case isNameUpdated = "isNameUpdated"
		case payOut = "payOut"
		case taxId = "taxId"
		case recipientPhonenumber = "recipientPhonenumber"
		case bankCity = "bankCity"
		case autoAccountType = "autoAccountType"
		case recipientType = "recipientType"
		case autoBankCounty = "autoBankCounty"
		case bankPostCode = "bankPostCode"
		case bankCode = "bankCode"
		case branchCode = "branchCode"
		case customerOrderCount = "customerOrderCount"
		case nomineeAge = "nomineeAge"
		case isPanVerified = "isPanVerified"
		case vehicleColorCode = "vehicleColorCode"
		case vehicleVarientCode = "vehicleVarientCode"
		case bookingId = "bookingId"
		case bookingDate = "bookingDate"
		case bookingAmount = "bookingAmount"
		case vinNumber = "vinNumber"
		case fileName = "fileName"
		case fileType = "fileType"
		case targetSale = "targetSale"
		case membershipId = "membershipId"
		case upiId = "upiId"
		case upiHolderName = "upiHolderName"
		case contactName = "contactName"
		case contactPhone = "contactPhone"
		case addressId = "addressId"
		case address1 = "address1"
		case address2 = "address2"
		case landmark = "landmark"
		case countryId = "countryId"
		case cityName = "cityName"
		case stateName = "stateName"
		case countryName = "countryName"
		case token = "token"
		case actorId = "actorId"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		financialDate = try values.decodeIfPresent(String.self, forKey: .financialDate)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		enrollmentBonus = try values.decodeIfPresent(Int.self, forKey: .enrollmentBonus)
		merchantId = try values.decodeIfPresent(Int.self, forKey: .merchantId)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		enrollmentId = try values.decodeIfPresent(String.self, forKey: .enrollmentId)
		address3 = try values.decodeIfPresent(String.self, forKey: .address3)
		loyaltyIdAutoGen = try values.decodeIfPresent(Bool.self, forKey: .loyaltyIdAutoGen)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		jdob = try values.decodeIfPresent(String.self, forKey: .jdob)
		customer_Grade_ID = try values.decodeIfPresent(Int.self, forKey: .customer_Grade_ID)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		customerTypeID = try values.decodeIfPresent(Int.self, forKey: .customerTypeID)
		registrationSource = try values.decodeIfPresent(Int.self, forKey: .registrationSource)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
		memberSince = try values.decodeIfPresent(String.self, forKey: .memberSince)
		customerEmail = try values.decodeIfPresent(String.self, forKey: .customerEmail)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		userName = try values.decodeIfPresent(String.self, forKey: .userName)
		customerMobile = try values.decodeIfPresent(String.self, forKey: .customerMobile)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		mobilePrefix = try values.decodeIfPresent(String.self, forKey: .mobilePrefix)
		contactID = try values.decodeIfPresent(Int.self, forKey: .contactID)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		book_App_Date = try values.decodeIfPresent(String.self, forKey: .book_App_Date)
		jBook_App_Date = try values.decodeIfPresent(String.self, forKey: .jBook_App_Date)
		customerRewardPoints = try values.decodeIfPresent(Int.self, forKey: .customerRewardPoints)
		customerRewardCardBalance = try values.decodeIfPresent(Int.self, forKey: .customerRewardCardBalance)
		lastActive = try values.decodeIfPresent(String.self, forKey: .lastActive)
		frontofficeExecutive = try values.decodeIfPresent(String.self, forKey: .frontofficeExecutive)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		designation = try values.decodeIfPresent(String.self, forKey: .designation)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		customerDob = try values.decodeIfPresent(String.self, forKey: .customerDob)
		pointBalance = try values.decodeIfPresent(Int.self, forKey: .pointBalance)
		rewardPoints = try values.decodeIfPresent(Int.self, forKey: .rewardPoints)
		pointExpired = try values.decodeIfPresent(Int.self, forKey: .pointExpired)
		giftedPoints = try values.decodeIfPresent(Int.self, forKey: .giftedPoints)
		giftCardAmount = try values.decodeIfPresent(Double.self, forKey: .giftCardAmount)
		issuedGiftCardAmount = try values.decodeIfPresent(Double.self, forKey: .issuedGiftCardAmount)
		debitedGiftCardAmount = try values.decodeIfPresent(Double.self, forKey: .debitedGiftCardAmount)
		refundGiftCardAmount = try values.decodeIfPresent(Double.self, forKey: .refundGiftCardAmount)
		giftedGiftCardAmount = try values.decodeIfPresent(Double.self, forKey: .giftedGiftCardAmount)
		customersRemarks = try values.decodeIfPresent(String.self, forKey: .customersRemarks)
		subscriptionDurationID = try values.decodeIfPresent(Int.self, forKey: .subscriptionDurationID)
		merchantName = try values.decodeIfPresent(String.self, forKey: .merchantName)
		vehicleNumber = try values.decodeIfPresent(String.self, forKey: .vehicleNumber)
		vehicleType = try values.decodeIfPresent(String.self, forKey: .vehicleType)
		chassisNumber = try values.decodeIfPresent(String.self, forKey: .chassisNumber)
		engineNumber = try values.decodeIfPresent(String.self, forKey: .engineNumber)
		modelNumber = try values.decodeIfPresent(String.self, forKey: .modelNumber)
		incorporationDate = try values.decodeIfPresent(String.self, forKey: .incorporationDate)
		dateOfSale = try values.decodeIfPresent(String.self, forKey: .dateOfSale)
		jDateOfSale = try values.decodeIfPresent(String.self, forKey: .jDateOfSale)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		invoiceAmount = try values.decodeIfPresent(String.self, forKey: .invoiceAmount)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		customerTypeId = try values.decodeIfPresent(Int.self, forKey: .customerTypeId)
		vehicleID = try values.decodeIfPresent(Int.self, forKey: .vehicleID)
		roleID = try values.decodeIfPresent(Int.self, forKey: .roleID)
		tradeLicence = try values.decodeIfPresent(String.self, forKey: .tradeLicence)
		enrollmentReferenceNumber = try values.decodeIfPresent(String.self, forKey: .enrollmentReferenceNumber)
		enrollmentReferenceDate = try values.decodeIfPresent(String.self, forKey: .enrollmentReferenceDate)
		jEnrollmentReferenceDate = try values.decodeIfPresent(String.self, forKey: .jEnrollmentReferenceDate)
		relateD_PROJECT_TYPE = try values.decodeIfPresent(String.self, forKey: .relateD_PROJECT_TYPE)
		landlineNumber = try values.decodeIfPresent(String.self, forKey: .landlineNumber)
		mobile_Two = try values.decodeIfPresent(String.self, forKey: .mobile_Two)
		isVerified = try values.decodeIfPresent(Int.self, forKey: .isVerified)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		insuranceExpDate = try values.decodeIfPresent(String.self, forKey: .insuranceExpDate)
		jInsuranceExpDate = try values.decodeIfPresent(String.self, forKey: .jInsuranceExpDate)
		laborAmount = try values.decodeIfPresent(Int.self, forKey: .laborAmount)
		policyNumber = try values.decodeIfPresent(String.self, forKey: .policyNumber)
		policyDate = try values.decodeIfPresent(String.self, forKey: .policyDate)
		jPolicyDate = try values.decodeIfPresent(String.self, forKey: .jPolicyDate)
		insuranceRenewalAmount = try values.decodeIfPresent(Int.self, forKey: .insuranceRenewalAmount)
		customerZip = try values.decodeIfPresent(String.self, forKey: .customerZip)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		village = try values.decodeIfPresent(String.self, forKey: .village)
		tehsilBlockMandal = try values.decodeIfPresent(String.self, forKey: .tehsilBlockMandal)
		payload = try values.decodeIfPresent(String.self, forKey: .payload)
		presentKM = try values.decodeIfPresent(Double.self, forKey: .presentKM)
		drivenBy = try values.decodeIfPresent(String.self, forKey: .drivenBy)
		isDriverChanging = try values.decodeIfPresent(String.self, forKey: .isDriverChanging)
		avgRunningPerMonth = try values.decodeIfPresent(Double.self, forKey: .avgRunningPerMonth)
		customerIsActive = try values.decodeIfPresent(Bool.self, forKey: .customerIsActive)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		identificationTypeID = try values.decodeIfPresent(Int.self, forKey: .identificationTypeID)
		identificationNo = try values.decodeIfPresent(String.self, forKey: .identificationNo)
		displayImage = try values.decodeIfPresent(String.self, forKey: .displayImage)
		encashBalance = try values.decodeIfPresent(Int.self, forKey: .encashBalance)
		maritalStatus = try values.decodeIfPresent(Int.self, forKey: .maritalStatus)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		nativeCountryId = try values.decodeIfPresent(Int.self, forKey: .nativeCountryId)
		nativeStateId = try values.decodeIfPresent(Int.self, forKey: .nativeStateId)
		languageId = try values.decodeIfPresent(Int.self, forKey: .languageId)
		domain = try values.decodeIfPresent(String.self, forKey: .domain)
		jD_InvoiceNo = try values.decodeIfPresent(String.self, forKey: .jD_InvoiceNo)
		jD_InvoiceDate = try values.decodeIfPresent(String.self, forKey: .jD_InvoiceDate)
		jjD_InvoiceDate = try values.decodeIfPresent(String.self, forKey: .jjD_InvoiceDate)
		isVinChassis_Active = try values.decodeIfPresent(String.self, forKey: .isVinChassis_Active)
		regType = try values.decodeIfPresent(String.self, forKey: .regType)
		isUpdatePassword = try values.decodeIfPresent(Bool.self, forKey: .isUpdatePassword)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		jCreatedDate = try values.decodeIfPresent(String.self, forKey: .jCreatedDate)
		createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
		nfcTagID = try values.decodeIfPresent(String.self, forKey: .nfcTagID)
		accountTypeId = try values.decodeIfPresent(Int.self, forKey: .accountTypeId)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		isGradeVerified = try values.decodeIfPresent(Bool.self, forKey: .isGradeVerified)
		isBlackListed = try values.decodeIfPresent(Bool.self, forKey: .isBlackListed)
		districtId = try values.decodeIfPresent(Int.self, forKey: .districtId)
		talukId = try values.decodeIfPresent(Int.self, forKey: .talukId)
		accountNumber = try values.decodeIfPresent(String.self, forKey: .accountNumber)
		talukName = try values.decodeIfPresent(String.self, forKey: .talukName)
		districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
		acountHolderName = try values.decodeIfPresent(String.self, forKey: .acountHolderName)
		bankName = try values.decodeIfPresent(String.self, forKey: .bankName)
		bankBranch = try values.decodeIfPresent(String.self, forKey: .bankBranch)
		ifscCode = try values.decodeIfPresent(String.self, forKey: .ifscCode)
		mobileNumberLimitation = try values.decodeIfPresent(Int.self, forKey: .mobileNumberLimitation)
		anniversary = try values.decodeIfPresent(String.self, forKey: .anniversary)
		jAnniversary = try values.decodeIfPresent(String.self, forKey: .jAnniversary)
		spouseName = try values.decodeIfPresent(String.self, forKey: .spouseName)
		spouseDOB = try values.decodeIfPresent(String.self, forKey: .spouseDOB)
		relationship = try values.decodeIfPresent(String.self, forKey: .relationship)
		areaId = try values.decodeIfPresent(Int.self, forKey: .areaId)
		areaName = try values.decodeIfPresent(String.self, forKey: .areaName)
		customerMenuId = try values.decodeIfPresent(String.self, forKey: .customerMenuId)
		verifiedStatus = try values.decodeIfPresent(String.self, forKey: .verifiedStatus)
		postInternalNote = try values.decodeIfPresent(String.self, forKey: .postInternalNote)
		departmentId = try values.decodeIfPresent(Int.self, forKey: .departmentId)
		designationId = try values.decodeIfPresent(Int.self, forKey: .designationId)
		enrolledBy = try values.decodeIfPresent(String.self, forKey: .enrolledBy)
		custAccountType = try values.decodeIfPresent(String.self, forKey: .custAccountType)
		gstNumber = try values.decodeIfPresent(String.self, forKey: .gstNumber)
		bankAccountVerifiedStatus = try values.decodeIfPresent(Int.self, forKey: .bankAccountVerifiedStatus)
		customerCategory = try values.decodeIfPresent(String.self, forKey: .customerCategory)
		customerCategoryId = try values.decodeIfPresent(Int.self, forKey: .customerCategoryId)
		referedBy = try values.decodeIfPresent(String.self, forKey: .referedBy)
		nominee = try values.decodeIfPresent(String.self, forKey: .nominee)
		sourceOfLogin = try values.decodeIfPresent(String.self, forKey: .sourceOfLogin)
		pushId = try values.decodeIfPresent(String.self, forKey: .pushId)
		nomineeDOB = try values.decodeIfPresent(String.self, forKey: .nomineeDOB)
		jNomineeDOB = try values.decodeIfPresent(String.self, forKey: .jNomineeDOB)
		customerRelationshipId = try values.decodeIfPresent(Int.self, forKey: .customerRelationshipId)
		customerRelationship = try values.decodeIfPresent(String.self, forKey: .customerRelationship)
		locationCode = try values.decodeIfPresent(String.self, forKey: .locationCode)
		walletNumber = try values.decodeIfPresent(String.self, forKey: .walletNumber)
		walletVerifiedStatus = try values.decodeIfPresent(Bool.self, forKey: .walletVerifiedStatus)
		whatsAppNumber = try values.decodeIfPresent(String.self, forKey: .whatsAppNumber)
		bankAddress = try values.decodeIfPresent(String.self, forKey: .bankAddress)
		bankSwiftCode = try values.decodeIfPresent(String.self, forKey: .bankSwiftCode)
		bankIbanNumber = try values.decodeIfPresent(String.self, forKey: .bankIbanNumber)
		bankRoutingNumber = try values.decodeIfPresent(String.self, forKey: .bankRoutingNumber)
		bankCountryID = try values.decodeIfPresent(Int.self, forKey: .bankCountryID)
		bankCurrencyID = try values.decodeIfPresent(Int.self, forKey: .bankCurrencyID)
		accountStatus = try values.decodeIfPresent(String.self, forKey: .accountStatus)
		regStatusId = try values.decodeIfPresent(Int.self, forKey: .regStatusId)
		contractName = try values.decodeIfPresent(String.self, forKey: .contractName)
		contractFileName = try values.decodeIfPresent(String.self, forKey: .contractFileName)
		sapNo = try values.decodeIfPresent(String.self, forKey: .sapNo)
		vendorCode = try values.decodeIfPresent(String.self, forKey: .vendorCode)
		industryId = try values.decodeIfPresent(Int.self, forKey: .industryId)
		referrerCode = try values.decodeIfPresent(String.self, forKey: .referrerCode)
		referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		accountComStatus = try values.decodeIfPresent(Int.self, forKey: .accountComStatus)
		contractId = try values.decodeIfPresent(Int.self, forKey: .contractId)
		regStatus = try values.decodeIfPresent(Int.self, forKey: .regStatus)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		accountType = try values.decodeIfPresent(String.self, forKey: .accountType)
		totalNetValue = try values.decodeIfPresent(Int.self, forKey: .totalNetValue)
		totalCollection = try values.decodeIfPresent(Int.self, forKey: .totalCollection)
		accountStatusId = try values.decodeIfPresent(Int.self, forKey: .accountStatusId)
		targetCreditPeriod = try values.decodeIfPresent(Int.self, forKey: .targetCreditPeriod)
		targetValue = try values.decodeIfPresent(Int.self, forKey: .targetValue)
		addressLatitude = try values.decodeIfPresent(String.self, forKey: .addressLatitude)
		addressLongitude = try values.decodeIfPresent(String.self, forKey: .addressLongitude)
		bankPassbookImage = try values.decodeIfPresent(String.self, forKey: .bankPassbookImage)
		isBankPassbookNewImage = try values.decodeIfPresent(Bool.self, forKey: .isBankPassbookNewImage)
		parentCustomerId = try values.decodeIfPresent(Int.self, forKey: .parentCustomerId)
		rewardPoint = try values.decodeIfPresent(Double.self, forKey: .rewardPoint)
		walletName = try values.decodeIfPresent(String.self, forKey: .walletName)
		customerStateId = try values.decodeIfPresent(Int.self, forKey: .customerStateId)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		customerCityId = try values.decodeIfPresent(Int.self, forKey: .customerCityId)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		panStatus = try values.decodeIfPresent(String.self, forKey: .panStatus)
		fromDate = try values.decodeIfPresent(String.self, forKey: .fromDate)
		toDate = try values.decodeIfPresent(String.self, forKey: .toDate)
		searchText = try values.decodeIfPresent(String.self, forKey: .searchText)
		panStatusId = try values.decodeIfPresent(Int.self, forKey: .panStatusId)
		financeUserName = try values.decodeIfPresent(String.self, forKey: .financeUserName)
		financeEmailId = try values.decodeIfPresent(String.self, forKey: .financeEmailId)
		financeName = try values.decodeIfPresent(String.self, forKey: .financeName)
		sscUserName = try values.decodeIfPresent(String.self, forKey: .sscUserName)
		sscEmailId = try values.decodeIfPresent(String.self, forKey: .sscEmailId)
		sscName = try values.decodeIfPresent(String.self, forKey: .sscName)
		enrollmentStatus = try values.decodeIfPresent(Bool.self, forKey: .enrollmentStatus)
		isProfilePictureUploaded = try values.decodeIfPresent(Bool.self, forKey: .isProfilePictureUploaded)
		isIDUploaded = try values.decodeIfPresent(Bool.self, forKey: .isIDUploaded)
		isF2FMeeting = try values.decodeIfPresent(Bool.self, forKey: .isF2FMeeting)
		isCCVerified = try values.decodeIfPresent(Bool.self, forKey: .isCCVerified)
		isSiteVerified = try values.decodeIfPresent(Bool.self, forKey: .isSiteVerified)
		isSemiUpdated = try values.decodeIfPresent(Bool.self, forKey: .isSemiUpdated)
		isNameUpdated = try values.decodeIfPresent(Bool.self, forKey: .isNameUpdated)
		payOut = try values.decodeIfPresent(Int.self, forKey: .payOut)
		taxId = try values.decodeIfPresent(String.self, forKey: .taxId)
		recipientPhonenumber = try values.decodeIfPresent(String.self, forKey: .recipientPhonenumber)
		bankCity = try values.decodeIfPresent(String.self, forKey: .bankCity)
		autoAccountType = try values.decodeIfPresent(String.self, forKey: .autoAccountType)
		recipientType = try values.decodeIfPresent(String.self, forKey: .recipientType)
		autoBankCounty = try values.decodeIfPresent(String.self, forKey: .autoBankCounty)
		bankPostCode = try values.decodeIfPresent(String.self, forKey: .bankPostCode)
		bankCode = try values.decodeIfPresent(String.self, forKey: .bankCode)
		branchCode = try values.decodeIfPresent(String.self, forKey: .branchCode)
		customerOrderCount = try values.decodeIfPresent(Int.self, forKey: .customerOrderCount)
		nomineeAge = try values.decodeIfPresent(Int.self, forKey: .nomineeAge)
		isPanVerified = try values.decodeIfPresent(Int.self, forKey: .isPanVerified)
		vehicleColorCode = try values.decodeIfPresent(String.self, forKey: .vehicleColorCode)
		vehicleVarientCode = try values.decodeIfPresent(String.self, forKey: .vehicleVarientCode)
		bookingId = try values.decodeIfPresent(String.self, forKey: .bookingId)
		bookingDate = try values.decodeIfPresent(String.self, forKey: .bookingDate)
		bookingAmount = try values.decodeIfPresent(String.self, forKey: .bookingAmount)
		vinNumber = try values.decodeIfPresent(String.self, forKey: .vinNumber)
		fileName = try values.decodeIfPresent(String.self, forKey: .fileName)
		fileType = try values.decodeIfPresent(String.self, forKey: .fileType)
		targetSale = try values.decodeIfPresent(Int.self, forKey: .targetSale)
		membershipId = try values.decodeIfPresent(String.self, forKey: .membershipId)
		upiId = try values.decodeIfPresent(String.self, forKey: .upiId)
		upiHolderName = try values.decodeIfPresent(String.self, forKey: .upiHolderName)
		contactName = try values.decodeIfPresent(String.self, forKey: .contactName)
		contactPhone = try values.decodeIfPresent(String.self, forKey: .contactPhone)
		addressId = try values.decodeIfPresent(Int.self, forKey: .addressId)
		address1 = try values.decodeIfPresent(String.self, forKey: .address1)
		address2 = try values.decodeIfPresent(String.self, forKey: .address2)
		landmark = try values.decodeIfPresent(String.self, forKey: .landmark)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
