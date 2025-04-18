//
//  API_URLConfig.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 25/10/24.
//

import Foundation
import UIKit

enum Environment {
	case development
	case UAT
	case production
}

class API_Url_Constant {
	static let shared = API_Url_Constant()
	private let environment: Environment
	
	var tokenURL = ""
	var baseURL = ""
	var PROMO_IMG = ""
	var productCatalogueImgURL = ""
	
	var username = ""
	var password = ""
	var grant_type = ""
	var MerchantUserName = ""
	
	var pushID: String = ""
	var helpLineNumber: String = ""
	var maintenanceIsEnable = true
	
	private init() {
		self.environment = .development
		self.apiBaseUrlSetup()
	}
	
	func apiBaseUrlSetup(){
		switch environment {
		case .development:
			self.tokenURL = "https://AdditioanlProjectcserv.ljfhiuerh.com/token"
			self.baseURL = "https://AdditioanlProjectcserv.ljfhiuerh.com/Mobile/"
			self.PROMO_IMG = "https://AdditioanlProjectcserv.ljfhiuerh.com.com/"
			self.productCatalogueImgURL = "https://AdditioanlProjectcserv.ljfhiuerh.com/UploadFiles/CatalogueImages/"
			
			self.username = "AdditionalProject"
			self.password = "HFjf$fgjhksdfl#g"
			self.grant_type = "password"
			self.MerchantUserName = "lejrgheir"
			
		case .UAT:
			
			
		case .production:
				
			
		}
	}
	

	
}


