//
//  iOS_CL_Cus_KnowYourTargetSetvice.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation

protocol KnowYourTargetSetvice_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func knowYourTargetDetailsApi(paramater: JSON,completion: @escaping (KnowYourTargetModels?,DataError?) -> ())
}

class iOS_CL_Cus_KnowYourTargetSetvice{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_KnowYourTargetSetvice: KnowYourTargetSetvice_InputProtocol{
	func knowYourTargetDetailsApi(paramater: JSON, completion: @escaping (KnowYourTargetModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: KnowYourTargetModels.self, params: paramater, type: ProductEndPoint.knowYourTarget) { response in
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
