//
//  ProfilePersonalDetailsVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol ProfilePersonalDetails_InputProtocol{
	var output : ProfilePersonalDetails_OutputProtocol? {get set}
	var networkService: ProfilePersonalDetailsServices_InputProtocol{get set}
	
	func mobileNumberExistancy(userName: String,completion: @escaping (Bool) -> ())
	func emailExistancyApi(email: String,completion: @escaping (Bool) -> ())
	func getPersonalDetails(userName: String)
	func getStateList(completion: @escaping ([DropdownDataModels]) -> ())
	func getDistrictList(stateID: Int,completion: @escaping ([DropdownDataModels]) -> ())
	func getCityList(stateID: Int,completion: @escaping ([DropdownDataModels]) -> ())
	func getGenderList() -> [DropdownDataModels]
	func personalDetailsSavingApi(param: JSON)
}


protocol ProfilePersonalDetails_OutputProtocol{
	func errorMessage(error: String)
	func personalDetailsResponse(data: PersonalDetailsModels)
	var superStarData: HierarchyMapDetails?{get set}
	func personalDetailsSubmitSuccess()
}

class ProfilePersonalDetailsVM{
	var output: ProfilePersonalDetails_OutputProtocol?
	var networkService: ProfilePersonalDetailsServices_InputProtocol
	var userDetails: UserList?
	
	init(networkService: ProfilePersonalDetailsServices_InputProtocol) {
		self.networkService = networkService
	}
}

extension ProfilePersonalDetailsVM: ProfilePersonalDetails_InputProtocol{
	func personalDetailsSavingApi(param: JSON) {
		self.networkService.personalDetailsSavingApi(param: param){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			if result.returnMessage == "1"{
				self.output?.personalDetailsSubmitSuccess()
			}else{
				ToastMessage.shared.showToast(message: "Personal Details saving failed, Please try after sometimes")
				return
			}
			
		}
	}
	
	
//	Email Api
	func emailExistancyApi(email: String, completion: @escaping (Bool) -> ()) {
		let parameter : [String : Any] = [
			"ActionType": "14",
			"Location": [
				"UserName": email
			]
		]

		
		self.networkService.emailExistancyApi(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			if result == 0{
				completion(true)
			}else{
				completion(false)
				ToastMessage.shared.showToast(message: "Mobile number already exists, Please try different number")
				return
			}
			
		}
	}
	
	// State List
	func getStateList(completion: @escaping ([DropdownDataModels]) -> ()) {
		let parameter : [String : Any] = [
			"ActionType": "2",
			"CountryID": "15",
			"IsActive": "true",
			"SortColumn": "STATE_NAME",
			"SortOrder": "ASC",
			"StartIndex": "1"
		]
		
		self.networkService.getStateListApi(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			var stateList = [DropdownDataModels]()
			result.stateList?.forEach({ data in
				stateList.append(DropdownDataModels(statusName: data.stateName,statusId: data.stateId))
			})
			
			completion(stateList)
			
			
		}
	}
	
//	District List Api
	func getDistrictList(stateID: Int, completion: @escaping ([DropdownDataModels]) -> ()) {
		let parameter : [String : Any] = [
			"StateId": stateID
		]
		
		self.networkService.getDistrictApi(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			var district = [DropdownDataModels]()
			result.lstDistrict?.forEach({ data in
				district.append(DropdownDataModels(statusName: data.districtName,statusId: data.districtId))
			})
			
			completion(district)
		}
	}
	
	// City List
	func getCityList(stateID: Int, completion: @escaping ([DropdownDataModels]) -> ()) {
		let parameter : [String : Any] = [
			"ActionType": "2",
			"IsActive": "true",
			"SortColumn": "CITY_NAME",
			"SortOrder": "ASC",
			"StartIndex": "1",
			"StateId": stateID
		]
		
		self.networkService.getCityListApi(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			var cityList = [DropdownDataModels]()
			result.cityList?.forEach({ data in
				cityList.append(DropdownDataModels(statusName: data.cityName,statusId: data.cityId))
			})
			
			completion(cityList)
			
		}
	}
	
	
//	Gender list
	func getGenderList() -> [DropdownDataModels] {
		
		return [
			DropdownDataModels(statusName: "Male"),
			DropdownDataModels(statusName: "Female")
		]
	}
	

	//	 MARK: - Get personal details
	func getPersonalDetails(userName: String) {
		let parameter : [String : Any] = [
			"LoyaltyId": userName
		]
		
		self.networkService.getPersonalDetails(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			self.output?.superStarData = result.hierarchyMapDetails
			self.output?.personalDetailsResponse(data: result)
		}
	}
	
	
	func mobileNumberExistancy(userName: String,completion: @escaping (Bool) -> ()) {
		let parameter : [String : Any] = [
			"ActionType": "57",
			"Location": [
				"UserName": userName
			] as [String : Any]
		]
		
		self.networkService.mobileNumberExistancy(param: parameter){ result , error in
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			if result == 0{
				completion(true)
			}else{
				completion(false)
				ToastMessage.shared.showToast(message: "Mobile number already exists, Please try different number")
				return
			}
			
		}
	}
}
