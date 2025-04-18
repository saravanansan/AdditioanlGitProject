//
//  iOS_CL_Cus_QueryChatDetailsVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation

protocol QueryChatDetailsVM_InputProtocol{
	var output : QueryChatDetailsVM_OutputProtocol? {get set}
	var networkService: QueryChatDetailsService_InputProtocol{get set}
	func chatListApi()
	func sendMSGApi(msg: String,qryStatus: Int,completion: @escaping (Bool)->())
	func sendImgApi(qryImg: String, fileType: String, qryStatus: Int)
}

protocol QueryChatDetailsVM_OutputProtocol{
	var lodgeQueryDetails: ObjCustomerAllQueryJsonList?{get set}
	func errorMessage(error: String)
	func chatListUpdate(list: [ObjQueryResponseJsonList]?)
	
}


class iOS_CL_Cus_QueryChatDetailsVM{
	var output: QueryChatDetailsVM_OutputProtocol?
	var networkService: QueryChatDetailsService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: QueryChatDetailsService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}


extension iOS_CL_Cus_QueryChatDetailsVM: QueryChatDetailsVM_InputProtocol{
	func chatListApi() {
		let param: [String: Any] = [
			"ActionType":"171",
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"CustomerTicketID": self.output?.lodgeQueryDetails?.customerTicketID ?? 0
		]
		
		self.networkService.chatListingApi(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				self.output?.chatListUpdate(list: nil)
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				self.output?.chatListUpdate(list: nil)
				return
			}
			self.output?.chatListUpdate(list: result.objQueryResponseJsonList)
		}
	}
	
	func sendMSGApi(msg: String, qryStatus: Int,completion: @escaping (Bool)->()) {
		let param: [String: Any] = [
			"ActionType":"4",
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"CustomerTicketID": self.output?.lodgeQueryDetails?.customerTicketID ?? 0,
			"HelpTopic": self.output?.lodgeQueryDetails?.helpTopic ?? "",
			"HelpTopicID": self.output?.lodgeQueryDetails?.helpTopicID ?? 0,
			"IsQueryFromMobile":false,
			"QueryDetails": msg,
			"QueryStatus": qryStatus
		]
		
		self.networkService.sendMSG(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				completion(false)
				return
			}
			
			guard let result else{
				completion(false)
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			completion(true)
			self.chatListApi()
			
			
		}
	}
	
	func sendImgApi(qryImg: String, fileType: String, qryStatus: Int) {
		let param: [String: Any] = [
			"ActionType": "4",
			"FileType": fileType,
			"ImageUrl": qryImg,
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"CustomerTicketID": self.output?.lodgeQueryDetails?.customerTicketID ?? 0,
			"HelpTopic": self.output?.lodgeQueryDetails?.helpTopic ?? "",
			"HelpTopicID": self.output?.lodgeQueryDetails?.helpTopicID ?? 0,
			"IsQueryFromMobile": true,
			"QueryStatus": qryStatus
		]
		
		self.networkService.sendMSG(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			self.chatListApi()
			
			
		}
	}
	
	
}

extension iOS_CL_Cus_QueryChatDetailsVM: QueryChatDetailsService_OutputProtocol{
	
}
