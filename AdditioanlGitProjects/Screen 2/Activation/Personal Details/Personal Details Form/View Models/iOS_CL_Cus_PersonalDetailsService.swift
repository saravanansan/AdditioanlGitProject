//
//  iOS_CL_Cus_PersonalDetailsService.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation

protocol PersonalDetailsService_InputDelegate{
	var output: PersonalDetailsService_OutputDelegate?{get set}
	var apiManager: ApiManagerProtocol{get set}
	func mobileNumberExistancy(param: JSON,completion: @escaping (Int?,DataError?) -> ())
	func emailExistancyApi(param: JSON,completion: @escaping (Int?,DataError?) -> ())
	func getPersonalDetails(param: JSON,completion: @escaping (PersonalDetailsModels?,DataError?) -> ())
	func getStateListApi(param: JSON,completion: @escaping (StateListModels?,DataError?) -> ())
	func getCityListApi(param: JSON,completion: @escaping (CityListModels?,DataError?) -> ())
	func getDistrictApi(param: JSON,completion: @escaping (DistrictsModels?,DataError?) -> ())
	
	func personalDetailsSavingApi(param: JSON,completion: @escaping (ProfileSubmissionModels?,DataError?) -> ())
}


protocol PersonalDetailsService_OutputDelegate{
	
	
}


class iOS_CL_Cus_PersonalDetailsService{
	
	var output: PersonalDetailsService_OutputDelegate?
	var apiManager: ApiManagerProtocol
	
	init(apiManager: ApiManagerProtocol){
		self.apiManager = apiManager
	}
	
}


extension iOS_CL_Cus_PersonalDetailsService: PersonalDetailsService_InputDelegate{
	func personalDetailsSavingApi(param: JSON, completion: @escaping (ProfileSubmissionModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: ProfileSubmissionModels.self, params: param, type: ProductEndPoint.personalDetailSubmission) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	
	//	 Email existancy
	func emailExistancyApi(param: JSON, completion: @escaping (Int?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: Int.self, params: param, type: ProductEndPoint.mobileNumberExistancy) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	func getStateListApi(param: JSON, completion: @escaping (StateListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: StateListModels.self, params: param, type: ProductEndPoint.getStateList) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	func getCityListApi(param: JSON, completion: @escaping (CityListModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: CityListModels.self, params: param, type: ProductEndPoint.getCityList) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	func getDistrictApi(param: JSON, completion: @escaping (DistrictsModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: DistrictsModels.self, params: param, type: ProductEndPoint.getDistrict) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	
	//	 Get Personal Details
	func getPersonalDetails(param: JSON, completion: @escaping (PersonalDetailsModels?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: PersonalDetailsModels.self, params: param, type: ProductEndPoint.getPersonalDetails) { response in
			AppLoader.shared.stopLoader()
			switch response{
				case .success(let result):
					completion(result, nil)
				case .failure(let error):
					completion(nil, error)
			}
		}
	}
	
	
	//	Mobile Number Existancy
	func mobileNumberExistancy(param: JSON, completion: @escaping (Int?, DataError?) -> ()) {
		guard MyCommonFunctionalUtilities.isInternetCallTheApi() else{
			//No internet connection
			return
		}
		AppLoader.shared.startLoader()
		self.apiManager.request(modelType: Int.self, params: param, type: ProductEndPoint.mobileNumberExistancy) { response in
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
