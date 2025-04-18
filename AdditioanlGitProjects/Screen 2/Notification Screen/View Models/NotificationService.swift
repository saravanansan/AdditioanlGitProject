//
//  NotificationService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation

protocol NotificationService_InputProtocol{
	var apiManager: ApiManagerProtocol{get set}
	func notificationListApi(param: JSON,completion: @escaping (NotificationListModels?,DataError?) -> ())
	func notificationReadApi(param: JSON,completion: @escaping (NotificationListModels?,DataError?) -> ())
	func notificationDeleteApi(param: JSON,completion: @escaping (NotificationListModels?,DataError?) -> ())
}




class NotificationService{
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
}


extension NotificationService: NotificationService_InputProtocol{
/*Notification Read Api*/
	func notificationReadApi(param: JSON, completion: @escaping (NotificationListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			ToastMessage.shared.showToast(message: "No internet connections!")
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: NotificationListModels.self, params: param, type: ProductEndPoint.notificationRead) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
/*Notification Delete APi*/
	func notificationDeleteApi(param: JSON, completion: @escaping (NotificationListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			ToastMessage.shared.showToast(message: "No internet connections!")
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: NotificationListModels.self, params: param, type: ProductEndPoint.notificationDelete) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
/*Get Notification List APi*/
	func notificationListApi(param: JSON, completion: @escaping (NotificationListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			ToastMessage.shared.showToast(message: "No internet connections!")
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: NotificationListModels.self, params: param, type: ProductEndPoint.getNotificationList) { response in
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
