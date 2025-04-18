//
//  iOS_CL_Cus_AadharFormVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


protocol AadharFormVM_InputProtocol{
	var output : AadharFormVM_OutputProtocol? {get set}
	var networkService: AadharFormServices_InputProtocol{get set}
	
	func aadharCountCheck(completionHandler: @escaping (Bool)->())
	func getAadharDetailsAPI(countStatus: Bool)
    func aadharNumberExistancy(aadharNumber: String)
	func fetchAadharOTP(aadharNumber: String)
	func aadharOTPValidation(OTP: String,aadharNumber: String)
    func aadharNumberSubmit(aadharNumber: String)
	
	func updateProfileNameAsAadhar(aadharNumber: String)
    
	
}

protocol AadharFormVM_OutputProtocol{
	func errorMessage(error: String)
	var customerDetails: ObjCustomerBasicDetailsActivation{get set}
	func otpTriger(status: Bool)
	func emptyAadharForm(editStatus: Bool)
	func aadharDetailsConfig(aadharNumber: String,aadharName: String,editStatus: Bool)
	func OTPSubmited(status: Bool,aadharDetails: ObjPanDetailsRetrieverequest?)
	func profileNameUpdated()
	func aadharSubmitSuccessPopop()
}

class iOS_CL_Cus_AadharFormVM{
	var aadharRefferID = ""
	var aadharName = ""
	var aadharNumber = ""
	
	var output: AadharFormVM_OutputProtocol?
	var networkService: AadharFormServices_InputProtocol
	
	init(networkService: AadharFormServices_InputProtocol) {
		self.networkService = networkService
	}
}

// Viewmodel Input
extension iOS_CL_Cus_AadharFormVM: AadharFormVM_InputProtocol{
//	MARK: - Profile Name Updating
	func updateProfileNameAsAadhar(aadharNumber: String) {
		
		let adharName = self.aadharName.split(separator: " ")
		var lastName = ""
		if adharName.count > 1{
			var value = ""
			for data in adharName.enumerated(){
				if data.offset > 0{
					value += " \(data.element)"
				}
			}
			lastName = "\(value.dropFirst())"
		}
		
		
		let request: [String : Any] = [
			"AAdharNumber": aadharNumber,
			"ActionType": 1,
			"ActorId": self.output?.customerDetails.user_ID ?? "",
			"FirstName": "\(adharName[0])" ,
			"Identity_ID": 6,
			"LastName": "\(lastName)"
		] as [String : Any]
		
		self.networkService.profileNameUpdateApi(paramater: request) {  result, error in

			guard  error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			let returnValue = result.returnMessage?.split(separator: ":")
			if returnValue?[0] == "1"{
				/***
				 show success message pop up
				 */
				self.output?.profileNameUpdated()
				
			}else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
			}
		}
	}
	
	
//	MARK: - Aadhar OTP Validation
	func aadharOTPValidation(OTP: String, aadharNumber: String) {
		let request: [String : Any] = [
			"OTP": OTP,
			"RefferID": self.aadharRefferID,
			"AAdharNumber": aadharNumber,
			"LoyaltyId": self.output?.customerDetails.loyalityID ?? ""
		] as [String : Any]
		
		self.networkService.aadharOTPValidationApi(paramater: request) {  result, error in

			guard  error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let aadharDetails = result.objPanDetailsRetrieverequest else {
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			if (aadharDetails.aAdharNumber ?? "") != ""{
				//Valid OTP
				self.output?.OTPSubmited(status: true, aadharDetails: aadharDetails)
				self.aadharName = aadharDetails.firstName ?? ""
				self.aadharNumber = aadharDetails.aAdharNumber ?? ""
				
			}else{
				//invalid OTP
				ToastMessage.shared.showToast(message: "Please enter valid OTP")
//				self.output?.OTPSubmited(status: false, aadharDetails: aadharDetails)
			}
		}
	}
	
	
//	MARK: - Count Check
	func aadharCountCheck(completionHandler: @escaping (Bool)->()) {
		let request: [String : Any] = [
			"ActionType": 2,
			"IdentificationId": 4,
			"LoyaltyID": self.output?.customerDetails.loyalityID ?? ""
		] as [String : Any]
		
		self.networkService.aadharCountCheckApi(paramater: request) {  result, error in

			guard  error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			completionHandler(result.returnMessage == "1")
			/*
			 return message: 0 - Disable the edit
							 1 - Allow to edit form
			 */
			
		}
	}
	
    // MARK: Aadhar Existancy check Api
	func aadharNumberExistancy(aadharNumber: String) {
        let request: [String : Any] = [
            "ActionType":"284",
			"ActorId": self.output?.customerDetails.user_ID ?? "",
            "Location": [
                "UserName": aadharNumber
            ]
        ] as [String : Any]
        
        self.networkService.aadharNumberValidationApi(paramater: request) {  result, error in
            guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            if result.returnMessage == "1" {
                self.output?.errorMessage(error: "Aadhar Already Exist")
            }else{
				self.fetchAadharOTP(aadharNumber: aadharNumber)
            }
        }
    }
    
    // MARK: Aadhar Submit Api
    func aadharNumberSubmit(aadharNumber: String) {
        let request: [String : Any] = [
			"ActionType": "3",
			"ActorId": self.output?.customerDetails.user_ID ?? "",
			"FirstName": self.aadharName,
			"IsAAdharValid": "1",
			"LoyaltyId": self.output?.customerDetails.loyalityID ?? "",
			"AAdharNumber": aadharNumber,
        ] as [String : Any]
        
        self.networkService.aadharNumberSubmitApi(paramater: request) {  result, error in
            guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
			let returnValue = result.returnMessage?.split(separator: ":")
			if (returnValue?[0] ?? "0") >= "1"{
				self.output?.aadharSubmitSuccessPopop()
			}else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
			}
           
        }
    }
    
    
    // MARK: OTP API
    func fetchAadharOTP(aadharNumber: String){
        let parameter: [String : Any] = [
            "AAdharNumber": aadharNumber,
			"ActorId": self.output?.customerDetails.user_ID ?? "",
			"LoyaltyId": self.output?.customerDetails.loyalityID ?? ""
        ]
        self.networkService.otpSendApi(paramater: parameter) { result, error in
            guard error == nil else{
				self.output?.otpTriger(status: false)
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				self.output?.otpTriger(status: false)
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            if result.objPanDetailsRetrieverequest?.isAAdharValid == 1{
				/*OTP Trigger*/
				self.output?.otpTriger(status: true)
				self.aadharRefferID = result.objPanDetailsRetrieverequest?.refferID ?? ""
            }else if result.objPanDetailsRetrieverequest?.isAAdharValid == 0{
				self.output?.otpTriger(status: false)
				ToastMessage.shared.showToast(message: "Something went wrong!")
            }else{
				self.output?.otpTriger(status: false)
                self.output?.errorMessage(error: "Please enter a valid Aadhar Number")
            }
        }
    }
    
   // MARK: Get Aadhar Details
    func getAadharDetailsAPI(countStatus: Bool){
        let parameter: [String : Any] = [
            "ActionType": "4",
			"ActorId": self.output?.customerDetails.user_ID ?? "",
			"LoyaltyId": self.output?.customerDetails.loyalityID ?? ""
        ]
		self.networkService.aadharGetDetailsApi(paramater: parameter) { result, error in
			guard error == nil else{
				//error
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				//no data found
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard (result.lstPanDetails?.count ?? 0) > 0 else{
				//no data found
//				ToastMessage.shared.showToast(message: "Something went wrong!")
				self.output?.emptyAadharForm(editStatus: countStatus)
				return
			}
			
			let aadhardetails = result.lstPanDetails?[0]
			
			if (aadhardetails?.aAdharId ?? "") == "" {
				//no data found
				self.output?.emptyAadharForm(editStatus: countStatus)
			}else{
				// data bind
				self.output?.aadharDetailsConfig(aadharNumber: aadhardetails?.aAdharId ?? "", aadharName: aadhardetails?.aAdharName ?? "", editStatus: countStatus)
			}
		}
    }
}
