//
//  iOS_CL_Cus_GSTFormVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation

protocol GSTFormVM_InputProtocol{
	var output : GSTFormVM_OutputProtocol? {get set}
	var networkService: GSTFormService_InputProtocol{get set}
    func getGSTDetailsAPI(actorId : String)
    func getGSTValidationApi(actorId : String, gstAddress: String, gstDocument:String, gstName:String, gstNumber:String)
}

protocol GSTFormVM_OutputProtocol{
    func errorMessage(error: String)
    func gstDetailsData(result: GetGstDetailsModels)
    func gstSubmitSuccessPopop()
}


class iOS_CL_Cus_GSTFormVM{
	var output: GSTFormVM_OutputProtocol?
	var networkService: GSTFormService_InputProtocol
	
	init(networkService: GSTFormService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}

extension iOS_CL_Cus_GSTFormVM: GSTFormService_OutputProtocol{
    
    // MARK: Get Aadhar Details
     func getGSTDetailsAPI(actorId : String){
         let parameter: [String : Any] = [
             "ActorID": actorId
         ]
         self.networkService.getGSTDetailsApi(paramater: parameter) { result, error in
             guard error == nil else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
                 return
             }
             
             guard let result else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
                 return
             }
             
             if result.lstGSTDetails?.count ?? 0 > 0{
                 self.output?.gstDetailsData(result : result)
             }else{
				 ToastMessage.shared.showToast(message: "Something went wrong!")
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
			 ToastMessage.shared.showToast(message: "Something went wrong!")
             return
         }
         
         guard let result else{
			 ToastMessage.shared.showToast(message: "Something went wrong!")
             return
         }
         
         if result.returnMessage?.count ?? 0 > 0{
             self.output?.gstSubmitSuccessPopop()
         }else{
			 ToastMessage.shared.showToast(message: "Something went wrong!")
             return
         }
     }
 }


}

extension iOS_CL_Cus_GSTFormVM: GSTFormVM_InputProtocol{

}
