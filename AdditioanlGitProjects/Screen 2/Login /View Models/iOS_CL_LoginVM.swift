//
//  iOS_CL_LoginVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation

protocol CL_LoginVM_InputDelegate{
	var output : CL_LoginVM_OutPutDelegate? {get set}
	var networkService: LoginService_InputProtocol{get set}
	var userDetails: UserList? {get set}
	func mobileNumberExistancy(userName: String)
	func fetchOTP(userName: String)
	func OTPValidation(OTP: String,userName: String)
	func activationCheckApi(userName: String)
}

protocol CL_LoginVM_OutPutDelegate{
	func errorMessage(error: String)
	func otpTriger()
	func activateAccount(result: ActivationModels)
	
}


class iOS_CL_LoginVM{
	var output: CL_LoginVM_OutPutDelegate?
	var networkService: LoginService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: LoginService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
	
}

// VM Input
extension iOS_CL_LoginVM: CL_LoginVM_InputDelegate{
	func activationCheckApi(userName: String) {
		let parameter : [String : Any] = [
			"LoyaltyId": userName
		]
		
		self.networkService.activationApi(paramater: parameter){ result , error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result.returnValue == 0{
				if result.objCustomerBasicDetailsActivation?.result == 1{
					self.output?.activateAccount(result: result)
				}else{
					self.output?.errorMessage(error: "Something went wrong!")
				}
			}else if result.returnValue == 2{
				self.output?.errorMessage(error: "Your account has been deactivated please contact your admin for more information.")
			}else if result.returnValue == 3{
				self.output?.errorMessage(error: "Your account is already active kindly login")
			}else if result.returnValue == 5{
				self.output?.errorMessage(error: "Please enter membershipID")
			}else if result.returnValue == 6{
				self.output?.errorMessage(error: "Invalid membershipid")
			}else{
				self.output?.errorMessage(error: "Something went wrong!")
			}
		}

	}
	
	func mobileNumberExistancy(userName: String) {
		let parameter : [String : Any] = [
			"ActionType": "57",
			"Location": [
				"UserName": userName
			] as [String : Any]
		]
		
		self.networkService.mobileNumberExistancy(param: parameter){ result , error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result == 1{
				self.loginApi(userName: userName)
			}else{
				self.output?.errorMessage(error: "Please enter a valid customer id or Mobile number")
				return
			}
			
		}
	}
	
	func loginApi(userName: String){
		let parameter: [String : Any] = [
			"UserActionType": "GetPasswordDetails",
			"Browser": "iOS",
			"LoggedDeviceName": "iOS",
			"PushID": API_Url_Constant.shared.pushID,
			"LoggedDeviceID": DeviceInfo.shared.deviceID,
			"UserName": userName,
			"UserType": "Customer"
		]
		
		self.networkService.loginApi(paramater: parameter){ result , error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard  (result.userList?.count ?? 0) > 0 else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result.userList?[0].status == "False"{
				self.output?.errorMessage(error: "Kindly activate your account")
			}else if result.userList?[0].result != 1{
				self.output?.errorMessage(error: "Invalid User")
			}else if result.userList?[0].isUserActive == 0{
				self.output?.errorMessage(error: "Your account has been deactivated please contact your admin for more information")
			}else if result.userList?[0].verifiedStatus == 0{
				self.output?.errorMessage(error: "Kindly activate your account")
			}else{
				//send otp
				self.userDetails = result.userList?[0]
				self.fetchOTP(userName: userName)
			}
		}
	}
	
	func fetchOTP(userName: String){
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
				self.output?.otpTriger()
			}else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
		}
	}
	
	
	func OTPValidation(OTP: String,userName: String){
		let request: [String : Any] = [
			"ActionType": "Get Encrypted OTP",
			"MobileNo": "100200",
			"OTP": "123456",
			"UserName": ""
		]
		
		self.networkService.OTPValidationApi(paramater: request) {  result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if (Int(result.returnMessage ?? "0") ?? 0) >= 1{
				guard let userDetails = self.userDetails else{
					self.output?.errorMessage(error: "Something went wrong!")
					return
				}
				
				UserDefaults.standard.setValue(userDetails.userId, forKey: UserdefaultsKey.userID)
				UserDefaults.standard.setValue(userDetails.membershipID, forKey: UserdefaultsKey.membershipID)
				UserDefaults.standard.setValue(userDetails.userName, forKey: UserdefaultsKey.userName)
				UserDefaults.standard.setValue(true, forKey: UserdefaultsKey.isUserLogedIn)
				
				SceneDelegate.appFlowCoordinator?.dashboard()
			}else{
				self.output?.errorMessage(error: "Invalid OTP!")
			}
		}
	}
	
}

// Viewmodel Output
extension iOS_CL_LoginVM: LoginService_Output{

}
