//
//  Profile_CustomerRefferenceServices.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol Profile_CustomerRefferenceServices_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func getBillingPerMonthApi(paramater: JSON,completion: @escaping (BillingPerMonthModels?,DataError?) -> ())
	func deliveryTiming(paramater: JSON,completion: @escaping (DeliveryTimingModels?,DataError?) -> ())
	func billingSoftware(paramater: JSON,completion: @escaping (BillingSoftwareModels?,DataError?) -> ())
	func customerRefferenceDetailsApi(paramater: JSON,completion: @escaping (CustomerRefferenceDetailsModels?,DataError?) -> ())
	func saveAPI(paramater: JSON,completion: @escaping (CrSubmitModels?,DataError?) -> ())
}


class Profile_CustomerRefferenceServices{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}



extension Profile_CustomerRefferenceServices: Profile_CustomerRefferenceServices_InputProtocol{
	func customerRefferenceDetailsApi(paramater: JSON, completion: @escaping (CustomerRefferenceDetailsModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: CustomerRefferenceDetailsModels.self, params: paramater, type: ProductEndPoint.getCustomerRefferenceDetails) { response in
			AppLoader.shared.stopLoader()
			switch response{
			case .success(let result):
				completion(result, nil)
			case .failure(let error):
				completion(nil, error)
			}
		}
	}
	
	

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
