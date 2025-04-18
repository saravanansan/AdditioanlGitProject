//
//  iOS_CL_Cus_PersonalDetailsVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 29/10/24.
//

import Foundation

protocol PersonalDetailsVM_InputDelegate{
	var output : PersonalDetailsVM_OutputDelegate? {get set}
	var networkService: PersonalDetailsService_InputDelegate{get set}
	
	func mobileNumberExistancy(userName: String,completion: @escaping (Bool) -> ())
	func emailExistancyApi(email: String,completion: @escaping (Bool) -> ())
	func getPersonalDetails(userName: String)
	func getStateList(completion: @escaping ([DropdownDataModels]) -> ())
	func getDistrictList(stateID: Int,completion: @escaping ([DropdownDataModels]) -> ())
	func getCityList(stateID: Int,completion: @escaping ([DropdownDataModels]) -> ())
	func getGenderList() -> [DropdownDataModels]
	func personalDetailsSavingApi(param: JSON)
}

protocol PersonalDetailsVM_OutputDelegate{
	func errorMessage(error: String)
	func personalDetailsResponse(data: PersonalDetailsModels)
	var superStarData: HierarchyMapDetails?{get set}
	func personalDetailsSubmitSuccess()
}


class iOS_CL_Cus_PersonalDetailsVM{
	
	var output: PersonalDetailsVM_OutputDelegate?
	var networkService: PersonalDetailsService_InputDelegate
	var userDetails: UserList?
	
	init(networkService: PersonalDetailsService_InputDelegate) {
		self.networkService = networkService
		self.networkService.output = self
	}
}


extension iOS_CL_Cus_PersonalDetailsVM: PersonalDetailsVM_InputDelegate{
	func personalDetailsSavingApi(param: JSON) {
		self.networkService.personalDetailsSavingApi(param: param){ result , error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result.returnMessage == "1"{
				self.output?.personalDetailsSubmitSuccess()
			}else{
				self.output?.errorMessage(error: "Personal Details saving failed, Please try after sometimes")
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
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result == 0{
				completion(true)
			}else{
				completion(false)
				self.output?.errorMessage(error: "Mobile number already exists, Please try different number")
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
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
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
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
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
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
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
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
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
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			if result == 0{
				completion(true)
			}else{
				completion(false)
				self.output?.errorMessage(error: "Mobile number already exists, Please try different number")
				return
			}
			
		}
	}
}

extension iOS_CL_Cus_PersonalDetailsVM: PersonalDetailsService_OutputDelegate{
	
}
