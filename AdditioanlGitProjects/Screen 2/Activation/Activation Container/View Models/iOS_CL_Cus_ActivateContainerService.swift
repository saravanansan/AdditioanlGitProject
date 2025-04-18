//
//  iOS_CL_Cus_ActivateContainerService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation

protocol ActivateContainerService_InputProtocol{
	var output: ActivateContainerService_Output?{get set}
	var apiManager: ApiManagerProtocol{get set}
	
	func profileImageUpdate(param: JSON,completion: @escaping (ProfileImageUpdateModels?,DataError?) -> ())
}

protocol ActivateContainerService_Output{
	
}

class iOS_CL_Cus_ActivateContainerService{
	var output: ActivateContainerService_Output?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_ActivateContainerService: ActivateContainerService_InputProtocol{
	//Profile Update
	func profileImageUpdate(param: JSON, completion: @escaping (ProfileImageUpdateModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: ProfileImageUpdateModels.self, params: param, type: ProductEndPoint.profileImageUpdate) { response in
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
