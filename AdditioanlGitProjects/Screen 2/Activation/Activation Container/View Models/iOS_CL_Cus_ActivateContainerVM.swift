//
//  iOS_CL_Cus_ActivateContainerVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation


protocol ActivateContainerVM_InputDelegate{
	var output : ActivateContainerVM_OutPutDelegate? {get set}
	var networkService: ActivateContainerService_InputProtocol{get set}
	
	func imageUpdateApi(imageUrl: String)
}



protocol ActivateContainerVM_OutPutDelegate{
	func errorMessage(error: String)
	var customerDetails: ObjCustomerBasicDetailsActivation{get set}
}

class iOS_CL_Cus_ActivateContainerVM{
	
	var output: ActivateContainerVM_OutPutDelegate?
	var networkService: ActivateContainerService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: ActivateContainerService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}

//Input
extension iOS_CL_Cus_ActivateContainerVM: ActivateContainerVM_InputDelegate{
	func imageUpdateApi(imageUrl: String) {
		let parameter: [String : Any] = [
			"ActorId": self.output?.customerDetails.user_ID ?? "",
			"ObjCustomerJson": [
				"DisplayImage": imageUrl,
				"LoyaltyId": self.output?.customerDetails.loyalityID ?? ""
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


//Output
extension iOS_CL_Cus_ActivateContainerVM: ActivateContainerService_Output{
	
}
