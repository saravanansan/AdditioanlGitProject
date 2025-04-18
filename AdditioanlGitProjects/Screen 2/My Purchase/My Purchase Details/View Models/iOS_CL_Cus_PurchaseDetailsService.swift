//
//  iOS_CL_Cus_PurchaseDetailsService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


protocol PurchaseDetailsService_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func myPurchaseDetailsApi(param: JSON,completion: @escaping (MyPurchaseDetailsModels?,DataError?) -> ())
	func downloadInvoiceApi(param: JSON,completion: @escaping (DownloadInvModels?,DataError?) -> ())
}



class iOS_CL_Cus_PurchaseDetailsService{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension iOS_CL_Cus_PurchaseDetailsService: PurchaseDetailsService_InputProtocol{
	func downloadInvoiceApi(param: JSON, completion: @escaping (DownloadInvModels?, DataError?) -> ()) {
			guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
				//No internet connection
				return
			}
			PDFLoader.shared.startLoader()
			self.apiManager.request(modelType: DownloadInvModels.self, params: param, type: ProductEndPoint.myPurchaseList) { response in
				PDFLoader.shared.stopLoader()
				switch response{
					case .success(let result):
						completion(result, nil)
					case .failure(let error):
						completion(nil, error)
				}
			}
	}
	
	
	// MARK: - Purchase Details
	func myPurchaseDetailsApi(param: JSON, completion: @escaping (MyPurchaseDetailsModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: MyPurchaseDetailsModels.self, params: param, type: ProductEndPoint.myPurchaseList) { response in
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
