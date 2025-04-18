//
//  Profile_PANVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol Profile_PAN_InputProtocol{
	var output : Profile_PAN_OutputProtocol? {get set}
	var networkService: Profile_PANServices_InputProtocol{get set}
	
	func panCountCheck(loyaltyID: String,completionHandler: @escaping (Bool)->())
	func getPanDetailsAPI(actorId : Int, loyaltyId : String,panEditStatus: Bool)
	func panSubmissionAPI(userID: Int,firstName: String,IsAAdharValid: Int, loyaltyId : String,mobile : String, PanNumber: String,remarks: String)
	func panNumberExistancy(UserName: String, userID: Int,completion: @escaping () -> ())
	func panValidationAPI(AAdharNumber: String, loyaltyId: String, mobile: String, panNumber: String)
}

protocol Profile_PAN_OutputProtocol{
	func errorMessage(error: String)
	func panDetailsDataConfig(panEditStatus: Bool,data: LstPanDetails1)
	func emptyPANForm(panEditStatus: Bool)
	func panNumberValidateResponse(data: ObjPanDetailsRetrieverequest1?)
	func panSubmitsSuccess()
}


class Profile_PANVM{
	var aadharRefferID = ""
	var aadharName = ""
	var aadharNumber = ""
	
	var output: Profile_PAN_OutputProtocol?
	var networkService: Profile_PANServices_InputProtocol
	
	init(networkService: Profile_PANServices_InputProtocol) {
		self.networkService = networkService
	}
}


//MARK: - Viewmodel Input
extension Profile_PANVM: Profile_PAN_InputProtocol{
	//	MARK: - Count Check
	func panCountCheck(loyaltyID: String,completionHandler: @escaping (Bool)->()) {
			let request: [String : Any] = [
				"LoyaltyId": loyaltyID,
				"Mobile": "8825917131",
				"PanNumber": ""
			] as [String : Any]
			
			self.networkService.panCountCheckApi(paramater: request) {  result, error in

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
	// MARK: Get PAN Details
	func getPanDetailsAPI(actorId : Int, loyaltyId : String,panEditStatus: Bool){
		 let parameter: [String : Any] = [
			 "ActionType": "4",
			 "ActorId": actorId,
			 "LoyaltyId": loyaltyId
		 ]
		 self.networkService.getPanDetailsApi(paramater: parameter) { result, error in
			 guard error == nil else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 guard let result else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 if let data = result.lstPanDetails?[0]{
				 if (data.panName ?? "") != "" {
					 self.output?.panDetailsDataConfig(panEditStatus: panEditStatus,data: data)
				 }else{
					 self.output?.emptyPANForm(panEditStatus: panEditStatus)
				 }
			 }else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
		 }
	 }
	
	
	// MARK: Pan Submission count API
	func panSubmissionAPI(userID: Int,firstName: String,IsAAdharValid: Int, loyaltyId : String,mobile : String, PanNumber: String,remarks: String){
		let parameter: [String : Any] = [
		   "ActionType": "3",
		   "ActorId": userID,
		   "FirstName": firstName,
		   "IsAAdharValid": IsAAdharValid,
		   "IsPanValid": "1",
		   "LoyaltyId": loyaltyId,
		   "Mobile": mobile,
		   "PanNumber": PanNumber,
		   "Remarks": remarks
		]
		 self.networkService.getPanSubmitApi(paramater: parameter) { result, error in
			 guard error == nil else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 guard let result else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 let returnValue = result.returnMessage?.split(separator: ":")
			 if (returnValue?.count ?? 0) > 0,(Int(returnValue?[0] ?? "0") ?? 0) >= 1{
				 self.output?.panSubmitsSuccess()
			 }else{
				 ToastMessage.shared.showToast(message: "PAN Details Saved failed,Please try again!")
			 }
		 }
	 }
	

	// MARK: Get Aadhar Details
	func panNumberExistancy(UserName: String, userID: Int,completion: @escaping () -> ()){
		 let parameter: [String : Any] = [
			"ActionType":"283",
			"ActorId": userID,
			"Location": [
			"UserName": UserName
			]
		 ]
		 self.networkService.panExistancyApi(paramater: parameter) { result, error in
			 guard error == nil else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 guard let result else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 if result.returnValue == 0{
				 // pan validation api call
				 completion()
				 
			 }else{
				 ToastMessage.shared.showToast(message: "PAN Number already Exists!")
			 }
		 }
	 }
	
	

	//MARK: Pan Validation API
	func panValidationAPI(AAdharNumber: String, loyaltyId: String, mobile: String, panNumber: String){
		 let parameter: [String : Any] = [
			"AAdharNumber": AAdharNumber,
			"LoyaltyId": loyaltyId,
			"Mobile": mobile,
			"PanNumber": panNumber
			]
		self.networkService.panValidationApi(paramater: parameter) { result, error in
			 guard error == nil else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			 guard let result else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
				 return
			 }
			 
			
			if result.objPanDetailsRetrieverequest?.panNumber != ""{
				// Valid pan number
				self.output?.panNumberValidateResponse(data: result.objPanDetailsRetrieverequest)
			}else{
				//inValid PAN
				ToastMessage.shared.showToast(message: "Please enter valid PAN Number")
			}
		 }
	 }

}
