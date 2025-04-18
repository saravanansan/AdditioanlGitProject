//
//  SideMenuDataModels.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 22/10/24.
//

import Foundation

struct SideMenuSectionModels{
	var sectionName: String
	var menuDetails: [SideMenuModels]
	
	init(sectionName: String, menuDetails: [SideMenuModels]) {
		self.sectionName = sectionName
		self.menuDetails = menuDetails
	}
	
}

struct SideMenuModels{
	var menuName: String
	var menuIcon: String
	var selectedMenuName : SideMenuPageName
	
	init(menuName: String, menuIcon: String, selectedMenuName: SideMenuPageName) {
		self.menuName = menuName
		self.menuIcon = menuIcon
		self.selectedMenuName = selectedMenuName
	}
}


enum SideMenuPageName{
	case myProfile
	case mySchemes
	case orderNow
	case myOrders
	case orderFulfilment
	case retailerOrderSummary
	case myPurchase
	case myRedemptions
	case gift
	case offresAndPromotions
	case aboutProgram
	case support
}
