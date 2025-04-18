//
//  iOS_CL_Cus_AadharFormServices.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation

protocol AadharFormServices_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
    func aadharNumberValidationApi(paramater: JSON,completion: @escaping (AadharExistancyModels?,DataError?) -> ())
    func aadharNumberSubmitApi(paramater: JSON,completion: @escaping (AadharSubmissionModels?,DataError?) -> ())
    func otpSendApi(paramater: JSON,completion: @escaping (OtpValidationModels?,DataError?) -> ())
    func aadharGetDetailsApi(paramater: JSON,completion: @escaping (AadharGetDetailsModels?,DataError?) -> ())
	func aadharCountCheckApi(paramater: JSON,completion: @escaping (AadharCountModels?,DataError?) -> ())
	
	func aadharOTPValidationApi(paramater: JSON,completion: @escaping (OtpValidationModels?,DataError?) -> ())
	
	func profileNameUpdateApi(paramater: JSON,completion: @escaping (OtpValidationModels?,DataError?) -> ())
}



class iOS_CL_Cus_AadharFormServices{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_AadharFormServices: AadharFormServices_InputProtocol{
	
	
	func profileNameUpdateApi(paramater: JSON, completion: @escaping (OtpValidationModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			ToastMessage.shared.showToast(message: "No Internet connection!",position: .top)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: OtpValidationModels.self, params: paramater, type: ProductEndPoint.profileNameUpdate) { response in
			AppLoader.shared.stopLoader()
			switch response{
			case .success(let result):
				completion(result, nil)
			case .failure(let error):
				completion(nil, error)
			}
		}
	}
	
	func aadharOTPValidationApi(paramater: JSON, completion: @escaping (OtpValidationModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			ToastMessage.shared.showToast(message: "No Internet connection!",position: .top)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: OtpValidationModels.self, params: paramater, type: ProductEndPoint.aadharOTPValidation) { response in
			AppLoader.shared.stopLoader()
			switch response{
			case .success(let result):
				completion(result, nil)
			case .failure(let error):
				completion(nil, error)
			}
		}
	}
	
//	Aadhar Count Check Api
	func aadharCountCheckApi(paramater: JSON, completion: @escaping (AadharCountModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			ToastMessage.shared.showToast(message: "No Internet connection!",position: .top)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: AadharCountModels.self, params: paramater, type: ProductEndPoint.aadharCountCheck) { response in
			AppLoader.shared.stopLoader()
			switch response{
			case .success(let result):
				completion(result, nil)
			case .failure(let error):
				completion(nil, error)
			}
		}
	}
	
    func aadharGetDetailsApi(paramater: JSON, completion: @escaping (AadharGetDetailsModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: AadharGetDetailsModels.self, params: paramater, type: ProductEndPoint.aadharGetDetails) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func otpSendApi(paramater: JSON, completion: @escaping (OtpValidationModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: OtpValidationModels.self, params: paramater, type: ProductEndPoint.aadharOTP) { response in
            AppLoader.shared.stopLoader()
            switch response{
                case .success(let result):
                    completion(result, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
    func aadharNumberValidationApi(paramater: JSON, completion: @escaping (AadharExistancyModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: AadharExistancyModels.self, params: paramater, type: ProductEndPoint.aadharValidation) { response in
            AppLoader.shared.stopLoader()
            switch response{
                case .success(let result):
                    completion(result, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
    func aadharNumberSubmitApi(paramater: JSON, completion: @escaping (AadharSubmissionModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: AadharSubmissionModels.self, params: paramater, type: ProductEndPoint.aadharSubmission) { response in
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
