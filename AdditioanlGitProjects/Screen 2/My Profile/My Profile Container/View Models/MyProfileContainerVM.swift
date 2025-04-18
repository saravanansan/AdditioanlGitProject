//
//  MyProfileContainerVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol MyProfileContainerVM_InputProtocol{
	var output : MyProfileContainerVM_OutputProtocol? {get set}
	var networkService: MyProfileContainerServices_InputProtocol{get set}
	func imageUpdateApi(imageUrl: String)
}

protocol MyProfileContainerVM_OutputProtocol{
	func errorMessage(error: String)
}


class MyProfileContainerVM{
	var output: MyProfileContainerVM_OutputProtocol?
	var networkService: MyProfileContainerServices_InputProtocol
	var userDetails: UserList?
	
	init(networkService: MyProfileContainerServices_InputProtocol) {
		self.networkService = networkService
	}
}


//Input
extension MyProfileContainerVM: MyProfileContainerVM_InputProtocol{
	func imageUpdateApi(imageUrl: String) {
		let parameter: [String : Any] = [
			"ActorId": Constants.userID,
			"ObjCustomerJson": [
				"DisplayImage": imageUrl,
				"LoyaltyId": Constants.loyaltyID
			] as [String : Any]
		]
		self.networkService.profileImageUpdate(param: parameter) {  result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if (Int(result.returnMessage ?? "0") ?? 0) == 1{
				//success
				self.output?.errorMessage(error: "Profile image update successfuly")
			}else{
				self.output?.errorMessage(error: "Profile image update failed!")
			}
		}
	}
	
	
}
