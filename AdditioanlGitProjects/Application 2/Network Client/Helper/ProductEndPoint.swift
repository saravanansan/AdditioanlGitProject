//
//  ProductEndPoint.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation


enum ProductEndPoint {
	case mdIntro
	case termAndConditions
	case mobileNumberExistancy
	case loginSubmission
	case fetchOtp
	case OTPValidation
	case activation
	case profileImageUpdate
	case dashboardDetails
	case lodgeQueryList
	case helpTopicList
	case newQuerySubmission
	case queryDetailsListing
	case myPurchaseList
	case knowYourTarget
	case getPersonalDetails
	case getStateList
	case getCityList
	case getDistrict
	case emailExistancy
	case personalDetailSubmission
	case aadharValidation
	case aadharSubmission
	case aadharGetDetails
	case aadharOTP
	case getPanDetails
	case panExistancy
	case panValidation
	case aadharCountCheck
	case aadharOTPValidation
	case profileNameUpdate
	case gstDetails
	case billingPerMonth
	case delivetTimeing
	case billingSoftware
	case crSaveInfo
	case panCountCheck
	case getCustomerRefferenceDetails
	case getOffersAndPromotion
	case getNotificationList
	case notificationRead
	case notificationDelete
	case panSubmission
	case gstSubmission
}

extension ProductEndPoint: EndPointType {
	var path: String {
		switch self {
			case .mdIntro:
				return "BindLandingImageList"
			case .termAndConditions:
				return "SaveOrGetTermAndConditions"
			case .mobileNumberExistancy:
				return "CheckCustomerExistancyAndVerification"
			case .loginSubmission:
				return "CheckIsAuthenticatedMobileApp"
			case .fetchOtp:
				return "SaveAndGetOTPDetails"
			case .OTPValidation:
				return "IsvalidateOTP"
			case .activation:
				return "GetCustomerDetailsForActivation"
			case .profileImageUpdate:
				return "UpdateCustomerProfileMobileApp"
			case .dashboardDetails:
				return "GetDashBoardDetailsApi"
			case .lodgeQueryList:
				return "SaveCustomerQueryTicket"
			case .newQuerySubmission:
				return "SaveCustomerQueryTicket"
			case .queryDetailsListing:
				return "GetQueryResponseInformation"
			case .helpTopicList:
				return "GetHelpTopics"
			case .myPurchaseList:
				return "GetMyPurchaseDetails"
			case .knowYourTarget:
				return "GetCustomerTargetDetailsThroughMobileApp"
			case .getPersonalDetails:
				return "GetCustomerDetailsByID"
			case .getStateList:
				return "GetStateDetailsMobileApp"
			case .getCityList:
				return "GetCityDetailsMobileApp"
			case .getDistrict:
				return "GetDistrictDetails"
			case .emailExistancy:
				return "CheckCustomerExistancyAndVerification"
			case .personalDetailSubmission:
				return "SaveCustomerDetails"
			case .aadharValidation:
				return "CheckIdentityExists"
			case .aadharSubmission:
				return "SaveCustomerAAdharDetails"
			case .aadharGetDetails:
				return "GetAAdharDetails"
			case .aadharOTP:
				return "ValidateAAdharDetails"
			case .getPanDetails:
				return "getPanDetails"
			case .panExistancy:
				return "CheckIdentityExists"
			case .panValidation:
				return "ValidatePanDetails"
			case .aadharCountCheck:
				return "CustomerRegisterAttemptsValidationAAdhar"
			case .aadharOTPValidation:
				return "VerifyOTPDeatils"
			case .profileNameUpdate:
				return "UpdateCustomerAadharName"
				
			case .gstDetails:
				return "GetGSTDetailsCustomer"
			case .billingPerMonth:
				return "GetQuestionSurveyDetails"
			case .delivetTimeing:
				return "GetQuestionSurveyDetails"
			case .billingSoftware:
				return "GetQuestionSurveyDetails"
			case .crSaveInfo:
				return "SaveCustomerPerferenceDetails"
				
			case .panCountCheck:
				return "CustomerRegisterAttemptsValidationPan"
			case .getCustomerRefferenceDetails:
				return "GetCustomerPerferenceDetails"
			case .getOffersAndPromotion:
				return "BindLandingImageList"
			case .getNotificationList:
				return "GetPushHistoryDetails"
			case .notificationRead:
				return "SavePushHistoryDetails"
			case .notificationDelete:
				return "GetPushHistoryDetails"
			case .panSubmission:
				return "SaveCustomerPanDetails"
			case .gstSubmission:
				return "SaveAndUpdateGSTDetails"
		}
	}

	var baseURL: String {
		return API_Url_Constant.shared.baseURL
	}

	var url: URL? {
		return URL(string: "\(baseURL)\(path)")
	}

	var method: HTTPMethods {
		return .post
	}

	var body: Encodable? {
		return nil
	}

	var headers: [String : String]? {
		APIManager.commonHeaders
	}
	
	var tokenData: String?{
		return UserDefaults.standard.string(forKey: "TOKEN")
	}
}
