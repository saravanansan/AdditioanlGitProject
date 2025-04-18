//
//  iOS_CL_Cus_MyPurchaseListVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation


protocol MyPurchaseListVM_InputProtocol{
	var output : MyPurchaseListVM_OutputProtocol? {get set}
	var networkService: MyPurchaseListService_InputProtocol{get set}
	func myPurchaseListApi(searchText: String)
}

protocol MyPurchaseListVM_OutputProtocol{
	var filterData: MyPurchaseFilterModels{get set}
	func MypurchaseListResponse(result: [LstInvoiceListings])
}


class iOS_CL_Cus_MyPurchaseListVM{
	var output: MyPurchaseListVM_OutputProtocol?
	var networkService: MyPurchaseListService_InputProtocol
	
	init(networkService: MyPurchaseListService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}


extension iOS_CL_Cus_MyPurchaseListVM: MyPurchaseListVM_InputProtocol{
	func myPurchaseListApi(searchText: String) {
		let param: [String : Any] = [
			"ActionType": 1,
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"JFromDate": DateFormat.shared.customDateFormat(date: self.output?.filterData.fromDate ?? "", fromDate: "dd-MM-yyyy", toDate: "yyyy-MM-dd") ,
			"JToDate": DateFormat.shared.customDateFormat(date: self.output?.filterData.toDate ?? "", fromDate: "dd-MM-yyyy", toDate: "yyyy-MM-dd") ,
			"SearhText": searchText,
			"StartIndex": self.output?.filterData.startIndex ?? 1,
			"PageCount": "10"
		]
		self.networkService.myPurchaseListApi(param: param) { result, error in
			guard error == nil else{
				self.output?.MypurchaseListResponse(result: [])
				return
			}
			
			guard let result else{
				self.output?.MypurchaseListResponse(result: [])
				return
			}
			let listData = result.lstInvoiceListings ?? []
			
			self.output?.MypurchaseListResponse(result: listData)
		}
	}
}



extension iOS_CL_Cus_MyPurchaseListVM: MyPurchaseListService_OutputProtocol{
	
}
