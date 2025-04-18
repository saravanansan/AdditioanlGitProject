//
//  iOS_CL_Cus_PANFormService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


protocol PANFormService_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func panCountCheckApi(paramater: JSON,completion: @escaping (PanCountCheckModels?,DataError?) -> ())
    func getPanDetailsApi(paramater: JSON,completion: @escaping (PanModels?,DataError?) -> ())
    func getPanSubmitApi(paramater: JSON,completion: @escaping (AadharGetDetailsModels?,DataError?) -> ())
    func panExistancyApi(paramater: JSON,completion: @escaping (PanExistancyModels?,DataError?) -> ())
    func panValidationApi(paramater: JSON,completion: @escaping (PanValidationModels?,DataError?) -> ())
}


class iOS_CL_Cus_PANFormService{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_PANFormService: PANFormService_InputProtocol{
	
	//	PAN Count Check Api
		func panCountCheckApi(paramater: JSON, completion: @escaping (PanCountCheckModels?, DataError?) -> ()) {
			guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
				//No internet connection
				ToastMessage.shared.showToast(message: "No Internet connection!",position: .top)
				return
			}
			AppLoader.shared.startLoader()
			self.apiManager.request(modelType: PanCountCheckModels.self, params: paramater, type: ProductEndPoint.panCountCheck) { response in
				AppLoader.shared.stopLoader()
				switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
				}
			}
		}
	
    func getPanDetailsApi(paramater: JSON, completion: @escaping (PanModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: PanModels.self, params: paramater, type: ProductEndPoint.getPanDetails) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    func getPanSubmitApi(paramater: JSON, completion: @escaping (AadharGetDetailsModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: AadharGetDetailsModels.self, params: paramater, type: ProductEndPoint.panSubmission) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    
    func panExistancyApi(paramater: JSON, completion: @escaping (PanExistancyModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: PanExistancyModels.self, params: paramater, type: ProductEndPoint.panExistancy) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    func panValidationApi(paramater: JSON, completion: @escaping (PanValidationModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: PanValidationModels.self, params: paramater, type: ProductEndPoint.panValidation) { response in
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
