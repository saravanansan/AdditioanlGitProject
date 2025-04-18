//
//  iOS_CL_LodgeQueryListService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 31/10/24.
//

import Foundation


protocol LodgeQueryListService_InputProtocol{
	var output: LodgeQueryListService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
	
	func LodgequeryList(param: JSON,completion: @escaping (LodgeQueryListModels?,DataError?) -> ())
	
}

protocol LodgeQueryListService_OutputProtocol{
	
}


class iOS_CL_LodgeQueryListService{
	var output: LodgeQueryListService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


// Input
extension iOS_CL_LodgeQueryListService: LodgeQueryListService_InputProtocol{
	
	//Lodge Query List
	func LodgequeryList(param: JSON, completion: @escaping (LodgeQueryListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: LodgeQueryListModels.self, params: param, type: ProductEndPoint.lodgeQueryList) { response in
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
