//
//  iOS_CL_Cus_TermsAndCondVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation

protocol TermsAndCondVM_InputDelegate{
	var output : TermsAndCondVM_OutPutDelegate? {get set}
	var networkService: TermsAndCondService_InputProtocol{get set}
	
}


protocol TermsAndCondVM_OutPutDelegate{
	func termsCondData(result: LstTermsAndCondition?,error: String?)
}


class iOS_CL_Cus_TermsAndCondVM{
	var output: TermsAndCondVM_OutPutDelegate?
	var networkService: TermsAndCondService_InputProtocol
	
	init(networkService: TermsAndCondService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}

extension iOS_CL_Cus_TermsAndCondVM: TermsAndCondVM_InputDelegate{
	func termsCondApi(request: JSON) {
		
	}
	
	
}

extension iOS_CL_Cus_TermsAndCondVM: TermsAndCondService_Output{
	func termsCondApiResponse(result: TermsAndCondModels?, error: DataError?) {
		guard let result else{
			self.output?.termsCondData(result: nil, error: "Something went wrong!")
			return
		}
		
		guard error == nil else{
			self.output?.termsCondData(result: nil, error: "Something went wrong!")
			return
		}
	
		if (result.lstTermsAndCondition?.count ?? 0) > 0{
			self.output?.termsCondData(result: result.lstTermsAndCondition?[0], error: "")
		}else{
			self.output?.termsCondData(result: nil, error: "Something went wrong!")
		}
	}
	
	
}
