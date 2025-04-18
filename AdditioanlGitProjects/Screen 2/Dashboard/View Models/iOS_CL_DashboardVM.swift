//
//  iOS_CL_DashboardVM.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/10/24.
//

import Foundation
import ImageSlideshow

protocol DashboardVM_InputProtocol{
	var output : DashboardVM_OutputProtocol? {get set}
	var networkService: DashboardService_InputProtocol{get set}
	func dashboardApi()
	func slideshowBannerApi()
	
}

protocol DashboardVM_OutputProtocol{
	func errorMessage(error: String)
	func dashboardDataUpdate(result: DashboardDetailsModels)
	func accountDeactivated(error: String)
	func loginInOtherDevice(error: String)
	func bannerImagesSetup(data: [AlamofireSource])
}


class iOS_CL_DashboardVM{
	var output: DashboardVM_OutputProtocol?
	var networkService: DashboardService_InputProtocol
	
	
	
	init(networkService: DashboardService_InputProtocol) {
		self.networkService = networkService
		self.networkService.output = self
	}
}


//MARK: View models input
extension iOS_CL_DashboardVM: DashboardVM_InputProtocol{
	func slideshowBannerApi() {
		let parameter: [String : Any] = [
			"ObjImageGallery": [
				"AlbumCategoryID": "1",
				"ActorId": Constants.userID
			] as [String: Any]
		]
		self.networkService.offersAndPromotionsList(paramater: parameter){ result , error in
			var customerDetails = DashboardDetailsModels()
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			var imageSet = [AlamofireSource]()
			
			for image in result.objImageGalleryList ?? [] {
				
				let imageURL = image.imageGalleryUrl ?? ""
				let filteredURLArray = (imageURL.replacingOccurrences(of: "~", with: "")).replacingOccurrences(of: " ", with: "%20")
				imageSet.append(AlamofireSource(urlString: "\(API_Url_Constant.shared.PROMO_IMG)\(filteredURLArray)", placeholder: UIImage(named: "Logo"))!)
			}
			self.output?.bannerImagesSetup(data: imageSet)
			
		}
	}
	
	
	func dashboardApi() {
		let parameter: [String : Any] = [
			"ActorId": Constants.userID
		]
		
		self.networkService.dashboardDetailsApi(paramater: parameter){ result , error in
			var customerDetails = DashboardDetailsModels()
			guard error == nil else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			
			guard let result else{
				ToastMessage.shared.showToast(message: "Something went wrong!")
				return
			}
			if (result.lstCustomerFeedBackJsonApi?.count ?? 0) > 0,let lstCustomer = result.lstCustomerFeedBackJsonApi?[0]{
				if let customerImage = lstCustomer.customerImage{
					customerDetails.customerImage = "\((customerImage.replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: ""))"
				}else{
					customerDetails.customerImage = nil
				}
								
				customerDetails.firstName = lstCustomer.firstName ?? ""
				customerDetails.lastName = lstCustomer.lastName ?? ""
				customerDetails.membershipId = lstCustomer.loyaltyId ?? ""
				customerDetails.userActiveStatus = lstCustomer.customerStatus == 1
			}
			
			
			if (result.lstCustomerTargetDetails?.count ?? 0) > 0,let annualTarget = result.lstCustomerTargetDetails?[0]{
				customerDetails.annualTarget = numbersFormat.format(value: Int(annualTarget.annualTarget ?? "") ?? 0)
				let achive = (Double(annualTarget.annualTarget ?? "") ?? 0) * 0.6
				
				customerDetails.annualTargetStartDate = annualTarget.yearStart ?? ""
				customerDetails.annualTagetEndDate = annualTarget.yearEnd ?? ""
				customerDetails.annualTagetPointsValue = Int(annualTarget.consumeTarget ?? "0") ?? 0
				if let value = Double(annualTarget.annualTarget ?? "1"),value > 0{
					customerDetails.annualTargetProgressbarValue = (Double(annualTarget.consumeTarget ?? "") ?? 0) / value
				}else{
					customerDetails.annualTargetProgressbarValue = (Double(annualTarget.consumeTarget ?? "") ?? 0) / 1
				}
				
				customerDetails.achieveTarget = "Achieve \(numbersFormat.format(value: Int(achive))) of your annual target 31st Dec \(annualTarget.yearStart ?? "")"
				
			}
	
			
			guard DeviceInfo.shared.deviceID == result.deviceID else{
				self.output?.loginInOtherDevice(error: "This account is login another device")
				return
			}
			
			guard !self.is_sessionTimeOut(lastLoginDate: result.lastActivatedDate ?? "") else{
				self.output?.loginInOtherDevice(error: "Oops !! You are logged out due to session time out. Please Login again to continue")
				return
			}
			
			self.output?.dashboardDataUpdate(result: customerDetails)
			
			
		}
	}
	
	func is_sessionTimeOut(lastLoginDate: String) -> Bool{
		let date = lastLoginDate.split(separator: " ")
		guard date.count > 0 else{return false}
		let inputFormatter = DateFormatter()
		inputFormatter.dateFormat = "MM-dd-yyyy"
		guard let lastLogin = inputFormatter.date(from: "\(date[0])") else{
		   return false
		}
		let timeInterval = Date().daysBetween(Date(), and: lastLogin)
		return timeInterval > 30
	}
}

extension iOS_CL_DashboardVM: DashboardService_OutputProtocol{
	
}
