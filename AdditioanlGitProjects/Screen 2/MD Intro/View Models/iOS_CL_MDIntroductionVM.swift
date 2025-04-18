//
//  iOS_CL_MDIntroductionVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation


protocol MDIntroVM_InputDelegate{
	var output : MDIntroVM_OutPutDelegate? {get set}
	var networkService: MDIntroductionService_InputProtocol{get set}
	func mdIntroFetchApi()
}

protocol MDIntroVM_OutPutDelegate{
	func mdIntroDataOutput(result: ObjImageGalleryList?,error: String?)
}

class iOS_CL_MDIntroductionVM{
	var output : MDIntroVM_OutPutDelegate?
	var networkService: MDIntroductionService_InputProtocol
	
	init(networkService: MDIntroductionService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
	
}

extension iOS_CL_MDIntroductionVM: MDIntroVM_InputDelegate{
	func mdIntroFetchApi() {
		let params = [
			"ObjImageGallery": [
					"AlbumCategoryID": "2"
				]
		]
		self.networkService.mdIntroApiFetch(param: params)
		
	}
	
	
	
}

//Api Output
extension iOS_CL_MDIntroductionVM: MDIntroductionService_Output{
	func mdIntroApiOutput(result: MDIntroModels?, error: DataError?) {
		guard let result else{
			self.output?.mdIntroDataOutput(result: nil, error: "Something went wrong!")
			return
		}
		
		guard error == nil else{
			self.output?.mdIntroDataOutput(result: nil, error: "Something went wrong!")
			return
		}
	
		if (result.objImageGalleryList?.count ?? 0) > 0{
			self.output?.mdIntroDataOutput(result: result.objImageGalleryList?[0], error: "")
		}else{
			self.output?.mdIntroDataOutput(result: nil, error: "Something went wrong!")
		}
	}
	
	
}
