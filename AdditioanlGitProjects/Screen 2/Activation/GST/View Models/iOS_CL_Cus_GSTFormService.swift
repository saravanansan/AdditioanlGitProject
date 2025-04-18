//
//  iOS_CL_Cus_GSTFormService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation

protocol GSTFormService_InputProtocol{
	var output: GSTFormService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
    func getGSTDetailsApi(paramater: JSON,completion: @escaping (GetGstDetailsModels?,DataError?) -> ())
    func getGSTValidationApi(paramater: JSON,completion: @escaping (GSTValidationModels?,DataError?) -> ())
}


protocol GSTFormService_OutputProtocol{
	
}

class iOS_CL_Cus_GSTFormService{
	var output: GSTFormService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_GSTFormService: GSTFormService_InputProtocol{
    func getGSTDetailsApi(paramater: JSON, completion: @escaping (GetGstDetailsModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: GetGstDetailsModels.self, params: paramater, type: ProductEndPoint.gstDetails) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getGSTValidationApi(paramater: JSON, completion: @escaping (GSTValidationModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: GSTValidationModels.self, params: paramater, type: ProductEndPoint.gstSubmission) { response in
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
