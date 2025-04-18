//
//  iOS_CL_Cus_PurchaseDetailsVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 05/11/24.
//

import Foundation

protocol PurchaseDetailsVM_InputProtocol{
	var output : PurchaseDetailsVM_OutputProtocol? {get set}
	var networkService: PurchaseDetailsService_InputProtocol{get set}
	func myPurchaseDetailsListApi(orderNumber: String,invNo: String)
	func downloadInvoiceApi(orderNumber: String, invNo: String)
}

protocol PurchaseDetailsVM_OutputProtocol{
	func errorMessage(error: String)
	func MypurchaseDetailsListResponse(result: [LstOrderListings])
	func saveBase64StringToPDF(pdfString: String, fileName: String)
}


class iOS_CL_Cus_PurchaseDetailsVM{
	var output: PurchaseDetailsVM_OutputProtocol?
	var networkService: PurchaseDetailsService_InputProtocol
	
	init(networkService: PurchaseDetailsService_InputProtocol) {
		self.networkService = networkService
	}
}


extension iOS_CL_Cus_PurchaseDetailsVM: PurchaseDetailsVM_InputProtocol{
	func myPurchaseDetailsListApi(orderNumber: String, invNo: String) {
		let param: [String : Any] = [
			"ActionType": 2,
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"InvoiceNumber": invNo,
			"OrderNumber": orderNumber
		]
		self.networkService.myPurchaseDetailsApi(param: param) { result, error in
			guard error == nil else{
				self.output?.MypurchaseDetailsListResponse(result: [])
				return
			}
			
			guard let result else{
				self.output?.MypurchaseDetailsListResponse(result: [])
				return
			}
			let listData = result.lstOrderListings ?? []
			
			self.output?.MypurchaseDetailsListResponse(result: listData)
		}
	}
	
	func downloadInvoiceApi(orderNumber: String, invNo: String) {
		let param: [String : Any] = [
			"ActionType": 2,
			"ActorId": UserDefaults.standard.string(forKey: UserdefaultsKey.userID) ?? "",
			"InvoiceNumber": invNo,
			"OrderNumber": orderNumber,
			"PDF": 1
		]
		self.networkService.downloadInvoiceApi(param: param) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Invoice download faild!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Invoice download faild!")
				return
			}
			guard let pdfBase64 = result.pdf else{
				self.output?.errorMessage(error: "Invoice download faild!")
				return
			}
			
			let fileName = ("Sales_Invoice_" + invNo + "_" + DateFormat.shared.getCurrentDateTimeString()).replacingOccurrences(of: "/", with: "_")
			self.output?.saveBase64StringToPDF(pdfString: pdfBase64, fileName: fileName)
		}
	}
}

