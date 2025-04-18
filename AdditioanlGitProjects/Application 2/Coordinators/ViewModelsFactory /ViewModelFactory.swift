//
//  ViewModelFactory.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 26/10/24.
//

import Foundation


final class VMFactory{
	static var shared = VMFactory()
	var apiManager = APIManager()
	private init(){}
	
	
	func mdIntroVM() -> MDIntroVM_InputDelegate{
		let networkService = iOS_CL_MDIntroductionService(apiManager: self.apiManager)
		let viewModels = iOS_CL_MDIntroductionVM(networkService: networkService)
		return viewModels
	}
	
	func loginVM() -> CL_LoginVM_InputDelegate{
		let networkService = iOS_CL_LoginService(apiManager: self.apiManager)
		let viewModels = iOS_CL_LoginVM(networkService: networkService)
		return viewModels
	}
	
	func termsAndCondVM() -> TermsAndCondVM_InputDelegate{
		let networkService = iOS_CL_Cus_TermsAndCondService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_TermsAndCondVM(networkService: networkService)
		return viewModels
	}
	
	
	func activationContainerVM() -> ActivateContainerVM_InputDelegate{
		let networkService = iOS_CL_Cus_ActivateContainerService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_ActivateContainerVM(networkService: networkService)
		return viewModels
	}
	
	func personalDetailsFormVM() -> PersonalDetailsVM_InputDelegate{
		let networkService = iOS_CL_Cus_PersonalDetailsService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_PersonalDetailsVM(networkService: networkService)
		return viewModels
	}
	
	func aadharFormVM() -> AadharFormVM_InputProtocol{
		let networkService = iOS_CL_Cus_AadharFormServices(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_AadharFormVM(networkService: networkService)
		return viewModels
	}
	
	func panFormVM() -> PANFormVM_InputProtocol{
		let networkService = iOS_CL_Cus_PANFormService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_PANFormVM(networkService: networkService)
		return viewModels
	}
	
	func GSTFormVM() -> GSTFormVM_InputProtocol{
		let networkService = iOS_CL_Cus_GSTFormService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_GSTFormVM(networkService: networkService)
		return viewModels
	}
	
	func customerReffVM() -> CustomerRefferenceVM_InputProtocol{
		let networkService = iOS_CL_Cus_CustomerRefferenceService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_CustomerRefferenceVM(networkService: networkService)
		return viewModels
	}
	
	func dashboardVM() -> DashboardVM_InputProtocol{
		let networkService = iOS_CL_DashboardService(apiManager: self.apiManager)
		let viewModels = iOS_CL_DashboardVM(networkService: networkService)
		return viewModels
	}
	
	func lodgeQueryListVM() -> LodgeQueryListVM_InputProtocol{
		let networkService = iOS_CL_LodgeQueryListService(apiManager: self.apiManager)
		let viewModels = iOS_CL_LodgeQueryListVM(networkService: networkService)
		return viewModels
	}
	

	func createLodgeQuery() -> NewQueryVM_InputProtocol{
		let networkService = iOS_CL_Cus_NewQueryService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_NewQueryVM(networkService: networkService)
		return viewModels
	}
	
	func lodgeQueryDetails() -> QueryChatDetailsVM_InputProtocol{
		let networkService = iOS_CL_Cus_QueryChatDetailsService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_QueryChatDetailsVM(networkService: networkService)
		return viewModels
	}
	
	func purchaseListVM() -> MyPurchaseListVM_InputProtocol{
		let networkService = iOS_CL_Cus_MyPurchaseListService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_MyPurchaseListVM(networkService: networkService)
		return viewModels
	}
	
	func purchaseDetailsVM() -> PurchaseDetailsVM_InputProtocol{
		let networkService = iOS_CL_Cus_PurchaseDetailsService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_PurchaseDetailsVM(networkService: networkService)
		return viewModels
	}
	
	
	func knowMoreTargetVM() -> KnowYourTargetVM_InputProtocol{
		let networkService = iOS_CL_Cus_KnowYourTargetSetvice(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_KnowYourTargetVM(networkService: networkService)
		return viewModels
	}
	
	func regosterOTPVM() -> RegisterOTPVM_InputProtocol{
		let networkService = iOS_CL_Cus_RegisterOTPService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_RegisterOTPVM(networkService: networkService)
		return viewModels
	}
	
	func profilePerosnalVM() -> ProfilePersonalDetails_InputProtocol{
		let networkService = ProfilePersonalDetailsServices(apiManager: self.apiManager)
		let viewModels = ProfilePersonalDetailsVM(networkService: networkService)
		return viewModels
	}
	
	
	func profileAadharVM() -> Profile_Aadhar_InputProtocol{
		let networkService = Profile_AadharServices(apiManager: self.apiManager)
		let viewModels = Profile_AadharVM(networkService: networkService)
		return viewModels
	}
	
	func profilePANVM() -> Profile_PAN_InputProtocol{
		let networkService = Profile_PANServices(apiManager: self.apiManager)
		let viewModels = Profile_PANVM(networkService: networkService)
		return viewModels
	}
	
	func profileGSTVM() -> Profile_GST_InputProtocol{
		let networkService = Profile_GSTServices(apiManager: self.apiManager)
		let viewModels = Profile_GSTVM(networkService: networkService)
		return viewModels
	}
	
	func profileCustomerRefferenceVM() -> Profile_CustomerRefference_InputProtocol{
		let networkService = Profile_CustomerRefferenceServices(apiManager: self.apiManager)
		let viewModels = Profile_CustomerRefferenceVM(networkService: networkService)
		return viewModels
	}
	
	
	func myProfileContainerVM() -> MyProfileContainerVM_InputProtocol{
		let networkService = MyProfileContainerServices(apiManager: self.apiManager)
		let viewModels = MyProfileContainerVM(networkService: networkService)
		return viewModels
	}
	
	func notificationVM() -> NotificationVM_InputProtocol{
		let networkService = NotificationService(apiManager: self.apiManager)
		let viewModels = iOS_CL_Cus_NotificationVM(networkService: networkService)
		return viewModels
	}
    
    func scheemVM() -> ScheemsVM_InputProtocol{
        let networkService = ScheemsService(apiManager: self.apiManager)
        let viewModels = iOS_CL_Cus_ScheemsVM(networkService: networkService)
        return viewModels
    }
    
    func OffersAndPromotionsVM() -> OfferersAndPromotionsVM_InputProtocol{
        let networkService = OffersAndPromotionsService(apiManager: self.apiManager)
        let viewModels = iOS_CL_Cus_OffersAndPromotionsVM(networkService: networkService)
        return viewModels
    }
    
    
    func OrderFulfillmentVM() -> OrderFulillmentVM_InputProtocol{
        let networkService = OrderFulfillmentService(apiManager: self.apiManager)
        let viewModels = iOS_CL_Cus_OrderFulillmentVM(networkService: networkService)
        return viewModels
    }
    
    func MyPerfamanceVM() -> MyPerformanceVM_InputProtocol{
        let networkService = MyPerformanceService(apiManager: self.apiManager)
        let viewModels = iOS_CL_Cus_MyPerformanceVM(networkService: networkService)
        return viewModels
    }
}

