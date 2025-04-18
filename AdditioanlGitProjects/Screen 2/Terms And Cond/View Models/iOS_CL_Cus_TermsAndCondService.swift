//
//  iOS_CL_Cus_TermsAndCondService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import Foundation
import MotionToastView

protocol TermsAndCondService_InputProtocol{
	var output: TermsAndCondService_Output?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func termsCondApi(request: JSON)
}

protocol TermsAndCondService_Output{
	func termsCondApiResponse(result: TermsAndCondModels?,error: DataError?)
}


class iOS_CL_Cus_TermsAndCondService{
	var output: TermsAndCondService_Output?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}

extension iOS_CL_Cus_TermsAndCondService: TermsAndCondService_InputProtocol
{
	func termsCondApi(request: JSON) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: TermsAndCondModels.self, params: request, type: ProductEndPoint.termAndConditions) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					self.output?.termsCondApiResponse(result: result, error: nil)
				case .failure(let error):
					self.output?.termsCondApiResponse(result: nil, error: error)
			}
		}
	}
}
