//
//  Profile_GSTServices.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol Profile_GSTServices_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func getGSTDetailsApi(paramater: JSON,completion: @escaping (GetGstDetailsModels?,DataError?) -> ())
	func getGSTValidationApi(paramater: JSON,completion: @escaping (GSTValidationModels?,DataError?) -> ())
}

class Profile_GSTServices{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension Profile_GSTServices: Profile_GSTServices_InputProtocol{
	
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
