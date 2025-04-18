//
//  iOS_CL_LodgeQueryListVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 31/10/24.
//

import Foundation


protocol LodgeQueryListVM_InputProtocol{
	var output : LodgeQueryListVM_OutputProtocol? {get set}
	var networkService: LodgeQueryListService_InputProtocol{get set}
	func lodgeQueryListApi(statusID: Int,fromDate: String,toDate: String,index: Int)
	func filterStatusDataConfig() -> [DropdownDataModels]
}

protocol LodgeQueryListVM_OutputProtocol{
	func errorMessage(error: String)
	var nodataFound : NoDataFound?{get set}
	func lodgeQueryList(result: LodgeQueryListModels?,error: String?)
}

class iOS_CL_LodgeQueryListVM{
	var output: LodgeQueryListVM_OutputProtocol?
	var networkService: LodgeQueryListService_InputProtocol
	var userDetails: UserList?
	
	init(networkService: LodgeQueryListService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}


extension iOS_CL_LodgeQueryListVM: LodgeQueryListVM_InputProtocol{
	func lodgeQueryListApi(statusID: Int, fromDate: String, toDate: String,index: Int) {
		let parameter: [String : Any] = [
			"ActionType": "1",
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"HelpTopicID": "-1",
			"TicketStatusId": statusID,
			"StartIndex": index,
			"PageSize": 10,
			"JFromDate": DateFormat.shared.customDateFormat(date: fromDate, fromDate: "dd-MM-yyyy", toDate: "yyyy-MM-dd"),
			"JToDate": DateFormat.shared.customDateFormat(date: toDate, fromDate: "dd-MM-yyyy", toDate: "yyyy-MM-dd")
		]
		
		self.networkService.LodgequeryList(param: parameter) { result, error in
			guard error == nil else{
				self.output?.lodgeQueryList(result: nil, error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.lodgeQueryList(result: nil, error: "Something went wrong!")
				return
			}
			self.output?.lodgeQueryList(result: result, error: nil)
		}
	}
	
	
	func filterStatusDataConfig() -> [DropdownDataModels]{
		var filterStatusArray: [DropdownDataModels] = [
			DropdownDataModels(statusName: "Pending",statusId: 1),
			DropdownDataModels(statusName: "Re-Open",statusId: 2),
			DropdownDataModels(statusName: "Resolved",statusId: 3),
			DropdownDataModels(statusName: "Closed",statusId: 4),
			DropdownDataModels(statusName: "Resolved-Follow Up",statusId: 5)
		]
		
		return filterStatusArray
	}
	
	
}


extension iOS_CL_LodgeQueryListVM: LodgeQueryListService_OutputProtocol{
	
}
