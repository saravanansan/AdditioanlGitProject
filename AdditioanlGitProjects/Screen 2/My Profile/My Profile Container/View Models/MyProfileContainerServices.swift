//
//  MyProfileContainerServices.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol MyProfileContainerServices_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func profileImageUpdate(param: JSON,completion: @escaping (ProfileImageUpdateModels?,DataError?) -> ())
}

class MyProfileContainerServices{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension MyProfileContainerServices: MyProfileContainerServices_InputProtocol{
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
