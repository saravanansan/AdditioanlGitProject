//
//  iOS_CL_Cus_CustomerRefferenceVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation


protocol CustomerRefferenceVM_InputProtocol{
	var output : CustomerRefferenceVM_OutputProtocol? {get set}
	var networkService: CustomerRefferenceService_InputProtocol{get set}
    func avarageBillingPerMonth(ActorId: String, answer_id: String)
    func deliveryTimeApi(ActorId: String, answer_id: String)
    func saveAPI(ActorId: String, billingPerMonth:String, DeliveryTime: String, warehouse: String, OwnWarehouse: String, DeliveryPerion: String, existingRetailser: String, wareHouseSqft: String, deliveryVehicle: String, billingSoftware:String, ownRetailerOrWareHouse: String, firmLocation:String, areaCovered: String)
}

protocol CustomerRefferenceVM_OutputProtocol{
    func errorMessage(error: String)
	func navigateToDropdown(data: [DropdownDataModels],searchBarIsHidden : Bool)
    func submitCR()
	
}

class iOS_CL_Cus_CustomerRefferenceVM{
	var output: CustomerRefferenceVM_OutputProtocol?
	var networkService: CustomerRefferenceService_InputProtocol
	
	init(networkService: CustomerRefferenceService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}

// View Models Input
extension iOS_CL_Cus_CustomerRefferenceVM: CustomerRefferenceVM_InputProtocol{
    
    //MARK: Expected LINC Average Billing per Month DROP DOWN API÷
    func avarageBillingPerMonth(ActorId: String, answer_id: String){
        let parameter: [String : Any] = [
            "ActionType": "1",
            "ActorId": ActorId,
            "answer_id": answer_id
        ]
        self.networkService.getBillingPerMonthApi(paramater: parameter) { result, error in
            guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            var data = [DropdownDataModels]()
            result.lstCustomerAnswers?.forEach{
                data.append(DropdownDataModels(statusName: $0.answer,statusId: $0.answerID))
            }
            self.output?.navigateToDropdown(data: data, searchBarIsHidden: true)
        }
    }
    
    
    //MARK: DELIVERY TIME API
    func deliveryTimeApi(ActorId: String, answer_id: String){
        let parameter: [String : Any] = [
            "ActionType": "1",
            "ActorId": ActorId,
            "answer_id": answer_id
        ]
        self.networkService.deliveryTiming(paramater: parameter) { result, error in
            guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            var data = [DropdownDataModels]()
            result.lstCustomerAnswers?.forEach{
                data.append(DropdownDataModels(statusName: $0.answer,statusId: $0.answerID))
            }
			self.output?.navigateToDropdown(data: data, searchBarIsHidden: true)
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
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
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
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
                return
            }
            if result.returnMessage == "Saved Successfully" {
                self.output?.submitCR()
            }
        }
    }
    
}


// servie output
extension iOS_CL_Cus_CustomerRefferenceVM: CustomerRefferenceService_OutputProtocol{
	
}
