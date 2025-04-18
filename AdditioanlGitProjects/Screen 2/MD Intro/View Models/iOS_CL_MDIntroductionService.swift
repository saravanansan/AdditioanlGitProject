//
//  iOS_CL_MDIntroductionService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation


protocol MDIntroductionService_InputProtocol{
	var output: MDIntroductionService_Output?{get set}
	var apiManager: ApiManagerProtocol{get set}
	
	func mdIntroApiFetch(param: JSON)
}

protocol MDIntroductionService_Output{
	func mdIntroApiOutput(result: MDIntroModels?, error: DataError?)
}

class iOS_CL_MDIntroductionService{
	var output: MDIntroductionService_Output?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}

extension iOS_CL_MDIntroductionService: MDIntroductionService_InputProtocol{
	func mdIntroApiFetch(param: JSON) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: MDIntroModels.self, params: param, type: ProductEndPoint.mdIntro) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					self.output?.mdIntroApiOutput(result: result, error: nil)
				case .failure(let error):
					self.output?.mdIntroApiOutput(result: nil, error: error)
			}
		}
	}
}
