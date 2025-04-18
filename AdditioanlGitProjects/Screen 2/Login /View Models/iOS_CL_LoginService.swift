//
//  iOS_CL_LoginService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation


protocol LoginService_InputProtocol{
	var output: LoginService_Output?{get set}
	var apiManager: ApiManagerProtocol{get set}

	func mobileNumberExistancy(param: JSON,completion: @escaping (Int?,DataError?) -> ())
	func loginApi(paramater: JSON,completion: @escaping (LoginModels?,DataError?) -> ())
	func fetchOTP(paramater: JSON,completion: @escaping (OTPModels?,DataError?) -> ())
	func OTPValidationApi(paramater: JSON,completion: @escaping (ServerOTPValidationModels?,DataError?) -> ())
	func activationApi(paramater: JSON,completion: @escaping (ActivationModels?,DataError?) -> ())
}

protocol LoginService_Output{
	
}


class iOS_CL_LoginService{
	var output: LoginService_Output?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}

extension iOS_CL_LoginService: LoginService_InputProtocol{

//	Mobile Existancy
	func mobileNumberExistancy(param: JSON, completion: @escaping (Int?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: Int.self, params: param, type: ProductEndPoint.mobileNumberExistancy) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	//Login
	func loginApi(paramater: JSON, completion: @escaping (LoginModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: LoginModels.self, params: paramater, type: ProductEndPoint.loginSubmission) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
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
	
	
	// Activation
	func activationApi(paramater: JSON,completion: @escaping (ActivationModels?,DataError?) -> ()){
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: ActivationModels.self, params: paramater, type: ProductEndPoint.activation) { response in
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

