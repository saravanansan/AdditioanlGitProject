//
//  iOS_CL_Cus_MyPurchaseListService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


protocol MyPurchaseListService_InputProtocol{
	var output: MyPurchaseListService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func myPurchaseListApi(param: JSON,completion: @escaping (MyPurchaseListModels?,DataError?) -> ())
}

protocol MyPurchaseListService_OutputProtocol{
	
}


class iOS_CL_Cus_MyPurchaseListService{
	var output: MyPurchaseListService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_MyPurchaseListService: MyPurchaseListService_InputProtocol{
	
//	MARK: Purchase list
	func myPurchaseListApi(param: JSON, completion: @escaping (MyPurchaseListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			completion(nil,nil)
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: MyPurchaseListModels.self, params: param, type: ProductEndPoint.myPurchaseList) { response in
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
