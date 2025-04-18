//
//  iOS_CL_Cus_NotificationVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation

protocol NotificationVM_InputProtocol{
	var output : NotificationVM_OutputProtocol? {get set}
	var networkService: NotificationService_InputProtocol{get set}
	
	func getNotificationListApi()
	func notificationReadApi(pushID: String)
	func notificationDeleteApi(pushID: String)
}

protocol NotificationVM_OutputProtocol{
	func notificationListResponse(result: NotificationListModels)
}

class iOS_CL_Cus_NotificationVM{
	var output: NotificationVM_OutputProtocol?
	var networkService: NotificationService_InputProtocol
	
	init(networkService: NotificationService_InputProtocol) {
		self.networkService = networkService
	}
}

extension iOS_CL_Cus_NotificationVM: NotificationVM_InputProtocol{
	
	func getNotificationListApi(){
		let parameter = [
			"ActionType": "0",
			"ActorId": Constants.userID,
			"LoyaltyId": Constants.loyaltyID
		] as [String : Any]
		
		self.networkService.notificationListApi(param: parameter) { result, error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			self.output?.notificationListResponse(result: result)
		}
	}
	
	func notificationReadApi(pushID: String){

		let parameter = [
			"ActorId": Constants.userID,
			"CustomerGroupType": "READ_PUSH",
			"LoyaltyId": Constants.loyaltyID,
			"PushHistoryIds": pushID
		] as [String : Any]
		
		
		self.networkService.notificationReadApi(param: parameter) { result, error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			/*guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}*/
		}
	}
	
	func notificationDeleteApi(pushID: String){

		let parameter = [
			"ActionType":"2",
			"ActorId": Constants.userID,
			"LoyaltyId": Constants.loyaltyID,
			"PushHistoryIds": pushID
		] as [String : Any]
		
		
		self.networkService.notificationDeleteApi(param: parameter) { result, error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			/*guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}*/
		}
	}

}
