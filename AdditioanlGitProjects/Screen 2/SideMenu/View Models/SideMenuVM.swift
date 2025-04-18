//
//  SideMenuVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 22/10/24.
//

import Foundation

//Input
protocol SideMenuInput_Delegate{
  func sideMenuList() -> [SideMenuSectionModels]
	func deleteAccountApi(mobileNumber: String,userID: String,firstName: String)
	var VC : SideMenuVMOutput_Delegate? {get set}
}

//Output
protocol SideMenuVMOutput_Delegate{

}



struct SideMenuVM{
	var VC : SideMenuVMOutput_Delegate?

	
	
}


extension SideMenuVM: SideMenuInput_Delegate{
	func sideMenuList() -> [SideMenuSectionModels] {
		//profile section
		let profileSection = SideMenuSectionModels(sectionName: "Profile",
												   menuDetails: [
			SideMenuModels(menuName: "My Profile", menuIcon: "sm_myProfile", selectedMenuName: .myProfile)
		])
		
		//myscheme section
		let myschemeSection = SideMenuSectionModels(sectionName: "Schemes",
													menuDetails: [
			SideMenuModels(menuName: "My Schemes", menuIcon: "sm_myScheme", selectedMenuName: .mySchemes)
		])

		//order section
		let orderSection = SideMenuSectionModels(sectionName: "Order",
												 menuDetails: [
			SideMenuModels(menuName: "Order Now", menuIcon: "sm_oderNow", selectedMenuName: .orderNow),
			SideMenuModels(menuName: "My Orders", menuIcon: "sm_myOders", selectedMenuName: .myOrders),
			SideMenuModels(menuName: "Order Fulfillment", menuIcon: "sm_oderNow", selectedMenuName: .orderFulfilment),
			SideMenuModels(menuName: "Retailer Order Summary", menuIcon: "sm_oderNow", selectedMenuName: .retailerOrderSummary)
		])
		
		//Rewards section
		let rewardsSection = SideMenuSectionModels(sectionName: "Rewards",
												   menuDetails: [
			SideMenuModels(menuName: "My Purchase", menuIcon: "sm_myPurchase", selectedMenuName: .myPurchase),
			SideMenuModels(menuName: "My Redemption", menuIcon: "sm_Myredemption", selectedMenuName: .myRedemptions)
		])

		//Redemption Catalog section
		let redemptionCatalogSection = SideMenuSectionModels(sectionName: "Redemption Catalog",
															 menuDetails: [
			SideMenuModels(menuName: "Gifts", menuIcon: "sm_Myredemption", selectedMenuName: .gift)
		])
		
		
		//Program & Support section
		let programSupportSection = SideMenuSectionModels(sectionName: "Program & Support",
														  menuDetails: [
			SideMenuModels(menuName: "Offers & Promotions", menuIcon: "sm_myScheme", selectedMenuName: .offresAndPromotions),
			SideMenuModels(menuName: "About Program", menuIcon: "sm_about", selectedMenuName: .aboutProgram),
			SideMenuModels(menuName: "Support", menuIcon: "sm_support", selectedMenuName: .support)
		])
		
		
		return [profileSection,myschemeSection,orderSection,rewardsSection,redemptionCatalogSection,programSupportSection]
		
	}
	
	func deleteAccountApi(mobileNumber: String, userID: String, firstName: String) {
		
	}
	
	
}
