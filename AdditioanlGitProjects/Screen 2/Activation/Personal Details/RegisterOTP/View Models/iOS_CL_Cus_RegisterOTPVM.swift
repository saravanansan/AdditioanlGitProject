//
//  iOS_CL_Cus_RegisterOTPVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation

protocol RegisterOTPVM_InputProtocol{
	var output : RegisterOTPVM_OutputProtcol? {get set}
	var networkService: RegisterOTPService_InputProtocol{get set}
	
	func fetchMobileOTP(userName: String)
	func fetchEmailOTP(userName: String)
	func OTPValidation(mobile: String?,mobileOTP: String?,email: String?,emailOTP: String)
}


protocol RegisterOTPVM_OutputProtcol{
	func errorMessage(error: String)
	func emailOtpTriger()
	func mobileOtpTriger()
	func otpValidationSuccess()
}

class iOS_CL_Cus_RegisterOTPVM{
	var output: RegisterOTPVM_OutputProtcol?
	var networkService: RegisterOTPService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: RegisterOTPService_InputProtocol) {
		self.networkService = networkService
	}
}


extension iOS_CL_Cus_RegisterOTPVM: RegisterOTPVM_InputProtocol{
	func fetchMobileOTP(userName: String) {
		let parameter: [String : Any] = [
			"MerchantUserName": API_Url_Constant.shared.MerchantUserName,
			"MobileNo": userName,
			"OTPType": "Enrollment",
			"UserId": -1,
			"UserName": ""
		]
		
		self.networkService.fetchOTP(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if (result.returnValue ?? 0) > 0{
				self.output?.mobileOtpTriger()
			}else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
		}
	}
	
	func fetchEmailOTP(userName: String) {
		let parameter: [String : Any] = [
			"MerchantUserName": API_Url_Constant.shared.MerchantUserName,
			"MobileNo": userName,
			"OTPType": "Enrollment",
			"UserId": -1,
			"UserName": ""
		]
		
		self.networkService.fetchOTP(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			if (result.returnValue ?? 0) > 0{
				self.output?.emailOtpTriger()
			}else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
		}
	}
	
	func OTPValidation(mobile: String?, mobileOTP: String?, email: String?, emailOTP: String) {
		var param: [String : Any] = [
			"UserName": ""
		]
		
		if let mobile ,mobile.count > 0{
			param["MobileNo"] = mobile
			param["SMSOTP"] = mobileOTP ?? ""
		}
		
		if let email,email.count > 0{
			param["EmailID"] = email
			param["EmailOTP"] = emailOTP
		}
		
		self.networkService.OTPValidationApi(paramater: param) {  result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if (Int(result.returnMessage ?? "0") ?? 0) == 0{
//			if (Int(result.returnMessage ?? "0") ?? 0) >= 1{
				self.output?.otpValidationSuccess()
			}else{
				self.output?.errorMessage(error: "Invalid OTP!")
			}
		}
	}
	
	
}



