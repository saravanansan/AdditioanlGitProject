//
//  iOS_CL_Cus_NewQueryService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation


protocol NewQueryService_InputProtocol{
	var output: NewQueryService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func newQuerySubmission(param: JSON,completion: @escaping (NewQuerySubmissionModel?,DataError?) -> ())
	
	func helpTopicListApi(param: JSON,completion: @escaping (HelpTopicModels?,DataError?) -> ())
}

protocol NewQueryService_OutputProtocol{
	
}

class iOS_CL_Cus_NewQueryService{
	var output: NewQueryService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_NewQueryService: NewQueryService_InputProtocol{
//	New Query Ticket Rise
	func newQuerySubmission(param: JSON, completion: @escaping (NewQuerySubmissionModel?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			completion(nil,nil)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: NewQuerySubmissionModel.self, params: param, type: ProductEndPoint.newQuerySubmission) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
//	HelpTopic List Api
	func helpTopicListApi(param: JSON, completion: @escaping (HelpTopicModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			completion(nil,nil)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: HelpTopicModels.self, params: param, type: ProductEndPoint.helpTopicList) { response in
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
