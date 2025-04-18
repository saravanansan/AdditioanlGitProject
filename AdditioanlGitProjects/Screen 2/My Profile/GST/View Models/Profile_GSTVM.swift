//
//  Profile_GSTVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol Profile_GST_InputProtocol{
	var output : Profile_GST_OutputProtocol? {get set}
	var networkService: Profile_GSTServices_InputProtocol{get set}
	
	func getGSTDetailsAPI(actorId : String)
	func getGSTValidationApi(actorId : String, gstAddress: String, gstDocument:String, gstName:String, gstNumber:String)
}

protocol Profile_GST_OutputProtocol{
	func errorMessage(error: String)
	func gstDetailsData(result: GetGstDetailsModels)
	func gstSubmitSuccessPopop()
}


class Profile_GSTVM{
	var output: Profile_GST_OutputProtocol?
	var networkService: Profile_GSTServices_InputProtocol
	
	init(networkService: Profile_GSTServices_InputProtocol) {
		self.networkService = networkService
	}
}


//MARK: - Viewmodel Input
extension Profile_GSTVM: Profile_GST_InputProtocol{
	// MARK: Get Aadhar Details
	 func getGSTDetailsAPI(actorId : String){
		 let parameter: [String : Any] = [
			 "ActorID": actorId
		 ]
		 self.networkService.getGSTDetailsApi(paramater: parameter) { result, error in
			 guard error == nil else{
				 self.output?.errorMessage(error: "Something went wrong!")
				 
				 return
			 }
			 
			 guard let result else{
				 self.output?.errorMessage(error: "Something went wrong!")
				 return
			 }
			 
			 if result.lstGSTDetails?.count ?? 0 > 0{
				 self.output?.gstDetailsData(result : result)
			 }else{
				 self.output?.errorMessage(error: "Something went wrong!")
				 return
			 }
		 }
	 }

// MARK: Save GST API
func getGSTValidationApi(actorId : String, gstAddress: String, gstDocument:String, gstName:String, gstNumber:String){
	 let parameter: [String : Any] = [
		 "ActorID":actorId,
		 "GstAddress": gstAddress,
		 "GstDocument": gstDocument,
		 "GstName": gstName,
		 "GstNumber": gstNumber
	 ]
	 self.networkService.getGSTValidationApi(paramater: parameter) { result, error in
		 guard error == nil else{
			 self.output?.errorMessage(error: "Something went wrong!")
			 
			 return
		 }
		 
		 guard let result else{
			 self.output?.errorMessage(error: "Something went wrong!")
			 return
		 }
		 
		 if result.returnMessage?.count ?? 0 > 0{
			 self.output?.gstSubmitSuccessPopop()
		 }else{
			 self.output?.errorMessage(error: "Something went wrong!")
			 return
		 }
	 }
 }

}

