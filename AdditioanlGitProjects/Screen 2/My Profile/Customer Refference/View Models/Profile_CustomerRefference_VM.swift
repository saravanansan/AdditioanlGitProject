//
//  Profile_CustomerRefference_VM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import Foundation

protocol Profile_CustomerRefference_InputProtocol{
	var output : Profile_CustomerRefference_OutputProtocol? {get set}
	var networkService: Profile_CustomerRefferenceServices_InputProtocol{get set}
	func avarageBillingPerMonth(ActorId: String, answer_id: String,completion: @escaping ([DropdownDataModels]) -> ())
	func deliveryTimeApi(ActorId: String, answer_id: String,completion: @escaping ([DropdownDataModels]) -> ())
	func saveAPI(ActorId: String, billingPerMonth:String, DeliveryTime: String, warehouse: String, OwnWarehouse: String, DeliveryPerion: String, existingRetailser: String, wareHouseSqft: String, deliveryVehicle: String, billingSoftware:String, ownRetailerOrWareHouse: String, firmLocation:String, areaCovered: String)
	func getCustomerRefferenceDetails(ActorId: Int)
	func billingSoftware(ActorId: String, answer_id: String)
}

protocol Profile_CustomerRefference_OutputProtocol{
	func errorMessage(error: String)
	func navigateToDropdown(data: [DropdownDataModels],searchBarIsHidden : Bool)
	func submitCR()
	func customerRefernceDetailsConfig(data: [LstCustomerQuestions4]?)
}


class Profile_CustomerRefferenceVM{
	var output: Profile_CustomerRefference_OutputProtocol?
	var networkService: Profile_CustomerRefferenceServices_InputProtocol
	
	init(networkService: Profile_CustomerRefferenceServices_InputProtocol) {
		self.networkService = networkService
	}
}


// View Models Input
extension Profile_CustomerRefferenceVM: Profile_CustomerRefference_InputProtocol{
	//MARK: DELIVERY TIME API
	func getCustomerRefferenceDetails(ActorId: Int){
		let parameter: [String : Any] = [
			"ActionType": 2,
			"ActorId": ActorId
		]
		self.networkService.customerRefferenceDetailsApi(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			self.output?.customerRefernceDetailsConfig(data: result.lstCustomerQuestions)
			
		}
	}
	
	
	
	//MARK: Expected LINC Average Billing per Month DROP DOWN API÷
	func avarageBillingPerMonth(ActorId: String, answer_id: String,completion: @escaping ([DropdownDataModels]) -> ()){
		let parameter: [String : Any] = [
			"ActionType": "1",
			"ActorId": ActorId,
			"answer_id": answer_id
		]
		self.networkService.getBillingPerMonthApi(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			var data = [DropdownDataModels]()
			result.lstCustomerAnswers?.forEach{
				data.append(DropdownDataModels(statusName: $0.answer,statusId: $0.answerID))
			}
			completion(data)
		}
	}
	
	
	//MARK: DELIVERY TIME API
	func deliveryTimeApi(ActorId: String, answer_id: String,completion: @escaping ([DropdownDataModels]) -> ()){
		let parameter: [String : Any] = [
			"ActionType": "1",
			"ActorId": ActorId,
			"answer_id": answer_id
		]
		self.networkService.deliveryTiming(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			var data = [DropdownDataModels]()
			result.lstCustomerAnswers?.forEach{
				data.append(DropdownDataModels(statusName: $0.answer,statusId: $0.answerID))
			}
			
			completion(data)
		}
	}
	
	
	//MARK: DELIVERY TIME API
	func billingSoftware(ActorId: String, answer_id: String){
		let parameter: [String : Any] = [
			"ActionType": "1",
			"ActorId": ActorId,
			"answer_id": answer_id
		]
		self.networkService.billingSoftware(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			
			var data = [DropdownDataModels]()
			result.lstCustomerAnswers?.forEach{
				data.append(DropdownDataModels(statusName: $0.answer,statusId: $0.answerID))
			}
			self.output?.navigateToDropdown(data: data, searchBarIsHidden: true)
		}
	}
	
	
	//MARK: Save API
	func saveAPI(ActorId: String,billingPerMonth: String, DeliveryTime: String, warehouse: String, OwnWarehouse: String, DeliveryPerion: String, existingRetailser: String, wareHouseSqft: String, deliveryVehicle: String, billingSoftware:String, ownRetailerOrWareHouse: String, firmLocation:String, areaCovered: String) {
		let parameter: [String : Any] = [
				"ActionType": 0,
				"ActorID": ActorId,
				"lstCustomerQuestions": [
					[
						"Answer": "\(billingPerMonth)",
						"Question": "Expected LINC Average Billing per Month "
					],
					[
						"Answer": DeliveryTime,
						"Question": "Delivery Time"
					],
					[
						"Answer": "\(warehouse)",
						"Question": "Do You have Warehouse?"
					],
					[
						"Answer": "\(OwnWarehouse)",
						"Question": "Do you Have Shared Or Own Warehouse?"
					],
					[
						"Answer": "\(DeliveryPerion)",
						"Question": "Do you have a Delivery Person?"
					],
					[
						"Answer": "\(existingRetailser)",
						"Question": "Existing Retailer Base"
					],
					[
						"Answer": "\(wareHouseSqft)",
						"Question": "WareHouse sqFtArea"
					],
					[
						"Answer": "\(deliveryVehicle)",
						"Question": "Do You have Delivery Vechicle?"
					],
					[
						"Answer": "\(billingSoftware)",
						"Question": "Do You have Billing Software?"
					],
					[
						"Answer": "\(ownRetailerOrWareHouse)",
						"Question": "Do you Own Retailer And Warehouse Counter"
					],
					[
						"Answer": "\(firmLocation)",
						"Question": "Firm Location is Your Home Location"
					],
					[
						"Answer": "\(areaCovered)",
						"Question": "Area Covered"
					]
				]
			]
		self.networkService.saveAPI(paramater: parameter) { result, error in
			guard error == nil else{
				self.output?.errorMessage(error: "Something went wrong!")
				
				return
			}
			guard let result else{
				self.output?.errorMessage(error: "Something went wrong!")
				return
			}
			if result.returnMessage == "Saved Successfully" {
				
			print("kjk")
				self.output?.submitCR()
			}
		}
	}
	
}
