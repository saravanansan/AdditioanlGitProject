//
//  iOS_CL_Cus_RegisterOTPService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation


protocol RegisterOTPService_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	
	func fetchOTP(paramater: JSON,completion: @escaping (OTPModels?,DataError?) -> ())
	func OTPValidationApi(paramater: JSON,completion: @escaping (ServerOTPValidationModels?,DataError?) -> ())
}



class iOS_CL_Cus_RegisterOTPService{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
	
}


extension iOS_CL_Cus_RegisterOTPService: RegisterOTPService_InputProtocol{
	//OTP Fetch
	func fetchOTP(paramater: JSON, completion: @escaping (OTPModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: OTPModels.self, params: paramater, type: ProductEndPoint.fetchOtp) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	
	//OTP Validation
	func OTPValidationApi(paramater: JSON, completion: @escaping (ServerOTPValidationModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: ServerOTPValidationModels.self, params: paramater, type: ProductEndPoint.OTPValidation) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
}
