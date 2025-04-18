//
//  iOS_CL_Cus_NewQueryVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 04/11/24.
//

import Foundation

protocol NewQueryVM_InputProtocol{
	var output : NewQueryVM_OutputProtocol? {get set}
	var networkService: NewQueryService_InputProtocol{get set}
	func helpToicListApi()
	func newQueryTicketRiseApi(helpTopicName: String,helpTopicID: Int,qryDetails: String,qrySummary: String,qryImg: String,fileType: String)
}

protocol NewQueryVM_OutputProtocol{
	func errorMessage(error: String)
	func helpTopicDropDown(data : [DropdownDataModels])
	func querySubmissionSuccessPopup()
	
}


class iOS_CL_Cus_NewQueryVM{
	var output: NewQueryVM_OutputProtocol?
	var networkService: NewQueryService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: NewQueryService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}

extension iOS_CL_Cus_NewQueryVM: NewQueryVM_InputProtocol{
//	New Query Ticket rise
	func newQueryTicketRiseApi(helpTopicName: String,
							   helpTopicID: Int,
							   qryDetails: String,
							   qrySummary: String,
							   qryImg: String,
							   fileType: String){
		
		let param: [String : Any] = [
			"ActionType": "0",
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"HelpTopic": helpTopicName,
			"HelpTopicID": helpTopicID,
			"IsQueryFromMobile": "true",
			"LoyaltyID": UserDefaults.standard.string(forKey: UserdefaultsKey.membershipID) ?? "",
			"QueryDetails": qryDetails,
			"QuerySummary": qrySummary,
			"SourceType": "3",
			"ImageUrl": qryImg,
			"FileType": fileType
		]
		self.networkService.newQuerySubmission(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			let returnMessage = result.returnMessage?.split(separator: "~")
			
			guard (returnMessage?.count ?? 0) > 0 else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if let returnMsg = returnMessage?[0]{
				if (Int(returnMsg) ?? 0) > 0{
					self.output?.querySubmissionSuccessPopup()
				}else{
					self.output?.errorMessage(error: "Something went wrong!")
				}
			}else{
				self.output?.errorMessage(error: "Something went wrong!")
			}
			
		}
		
	}
	
	// Help Topic
	func helpToicListApi() {
		let param: [String : Any] = [
			"ActionType": "4",
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"IsActive": "true"
		]
		self.networkService.helpTopicListApi(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			var data = [DropdownDataModels]()
			result.objHelpTopicList?.forEach{
				data.append(DropdownDataModels(statusName: $0.helpTopicName,statusId: $0.helpTopicId))
			}
			self.output?.helpTopicDropDown(data: data)
		}
	}
	
	
}


extension iOS_CL_Cus_NewQueryVM: NewQueryService_OutputProtocol{
	
}
