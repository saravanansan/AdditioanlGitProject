//
//  iOS_CL_Cus_CustomerRefferenceService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation

protocol CustomerRefferenceService_InputProtocol{
	var output: CustomerRefferenceService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
    func getBillingPerMonthApi(paramater: JSON,completion: @escaping (BillingPerMonthModels?,DataError?) -> ())
    func deliveryTiming(paramater: JSON,completion: @escaping (DeliveryTimingModels?,DataError?) -> ())
    func billingSoftware(paramater: JSON,completion: @escaping (BillingSoftwareModels?,DataError?) -> ())
    func saveAPI(paramater: JSON,completion: @escaping (CrSubmitModels?,DataError?) -> ())
}

protocol CustomerRefferenceService_OutputProtocol{
	
}

class iOS_CL_Cus_CustomerRefferenceService{
	var output: CustomerRefferenceService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_CustomerRefferenceService: CustomerRefferenceService_InputProtocol{
    
    func getBillingPerMonthApi(paramater: JSON, completion: @escaping (BillingPerMonthModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: BillingPerMonthModels.self, params: paramater, type: ProductEndPoint.billingPerMonth) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func deliveryTiming(paramater: JSON, completion: @escaping (DeliveryTimingModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: DeliveryTimingModels.self, params: paramater, type: ProductEndPoint.delivetTimeing) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    func billingSoftware(paramater: JSON, completion: @escaping (BillingSoftwareModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: BillingSoftwareModels.self, params: paramater, type: ProductEndPoint.billingSoftware) { response in
            AppLoader.shared.stopLoader()
            switch response{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    func saveAPI(paramater: JSON, completion: @escaping (CrSubmitModels?, DataError?) -> ()) {
        guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
            //No internet connection
            return
        }
        AppLoader.shared.startLoader()
        self.apiManager.request(modelType: CrSubmitModels.self, params: paramater, type: ProductEndPoint.crSaveInfo) { response in
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
