//
//  iOS_CL_Cus_KnowYourTargetVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation

protocol KnowYourTargetVM_InputProtocol{
	var output : KnowYourTargetVM_OutputProtocol? {get set}
	var networkService: KnowYourTargetSetvice_InputProtocol{get set}
	func knowYourTarget()
}

protocol KnowYourTargetVM_OutputProtocol{
	func errorMessage(error: String)
	func knowTargetDetails(result: KnowYourTargetModels?)
}


class iOS_CL_Cus_KnowYourTargetVM{
	var output: KnowYourTargetVM_OutputProtocol?
	var networkService: KnowYourTargetSetvice_InputProtocol
	init(networkService: KnowYourTargetSetvice_InputProtocol) {
		self.networkService = networkService
	}
}


extension iOS_CL_Cus_KnowYourTargetVM: KnowYourTargetVM_InputProtocol{
	func knowYourTarget(){
		let parameter: [String : Any] = [
			"ActionType": 1,
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? ""
		]
		
		self.networkService.knowYourTargetDetailsApi(paramater: parameter){ result , error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
		
			self.output?.knowTargetDetails(result: result)
		}
	}
}
