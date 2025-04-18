//
//  iOS_CL_Cus_QueryChatDetailsService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation


protocol QueryChatDetailsService_InputProtocol{
	var output: QueryChatDetailsService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func chatListingApi(param: JSON,completion: @escaping (ChatDetailsModel?,DataError?) -> ())
	func sendMSG(param: JSON,completion: @escaping (LodgeQueryListModels?,DataError?) -> ())
}

protocol QueryChatDetailsService_OutputProtocol{
	
}

class iOS_CL_Cus_QueryChatDetailsService{
	var output: QueryChatDetailsService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_QueryChatDetailsService: QueryChatDetailsService_InputProtocol{
	func chatListingApi(param: JSON, completion: @escaping (ChatDetailsModel?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: ChatDetailsModel.self, params: param, type: ProductEndPoint.queryDetailsListing) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	func sendMSG(param: JSON, completion: @escaping (LodgeQueryListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: LodgeQueryListModels.self, params: param, type: ProductEndPoint.newQuerySubmission) { response in
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
