//
//  iOS_CL_DashboardService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation

protocol DashboardService_InputProtocol{
	var output: DashboardService_OutputProtocol?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func dashboardDetailsApi(paramater: JSON,completion: @escaping (DashboardModels?,DataError?) -> ())
	func offersAndPromotionsList(paramater: JSON,completion: @escaping (DashboardBannerModel?,DataError?) -> ())
}

protocol DashboardService_OutputProtocol{
	
}

class iOS_CL_DashboardService{
	var output: DashboardService_OutputProtocol?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}

extension iOS_CL_DashboardService: DashboardService_InputProtocol{
	func offersAndPromotionsList(paramater: JSON, completion: @escaping (DashboardBannerModel?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			ToastMessage.shared.showToast(message: "No internet connection!")
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: DashboardBannerModel.self, params: paramater, type: ProductEndPoint.getOffersAndPromotion) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	
	//Dashboard Details
	func dashboardDetailsApi(paramater: JSON, completion: @escaping (DashboardModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			ToastMessage.shared.showToast(message: "No internet connection!")
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: DashboardModels.self, params: paramater, type: ProductEndPoint.dashboardDetails) { response in
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

