//
//  iOS_CL_DashboardVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 20/09/24.
//

import UIKit
import ImageSlideshow
import SDWebImage

class iOS_CL_DashboardVC: AppViewController {

	@IBOutlet weak var imaegSlideShowView: ImageSlideshow!
	@IBOutlet weak var customerNameLbl: UILabel!
	@IBOutlet weak var membershipIdLbl: UILabel!
	
	@IBOutlet weak var tierNameLbl: UILabel!
	@IBOutlet weak var tierImage: UIImageView!
	
	@IBOutlet weak var eligibleAmountLbl: UILabel!
	@IBOutlet weak var redeemableAmountLbl: UILabel!
	
	@IBOutlet weak var annualTargetProgressbar: CustomeProgressBar!
	
	@IBOutlet weak var annualTargetStartDateLbl: UILabel!
	@IBOutlet weak var annualTargetEnddateLbl: UILabel!
	@IBOutlet weak var annualTargetPointsLbl: UILabel!
	
	@IBOutlet weak var achivePointsValueLbl: UILabel!
	
	@IBOutlet weak var customerImage: UIImageDesignable!
	
	var slideshowImgList = [AlamofireSource]()
	var slideshow: ImageSlideshow?
	
	
	var dashboardData = DashboardDetailsModels()
	var viewModel: DashboardVM_InputProtocol
	init(viewModel: DashboardVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.promotionPopop()
		self.applySidemenuSwipeGesture()
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewModel.dashboardApi()
		self.viewModel.slideshowBannerApi()
	}
	
	@IBAction func didSelectNotificationBtn(_ sender: UIButton) {
		let viewModels = VMFactory.shared.notificationVM()
		let view = iOS_CL_Cus_NotificationVC(viewModel: viewModels)
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	@IBAction func didSelectSideMenuBtn(_ sender: UIButton) {
		self.sidemenuOpen()
	}
	

	@IBAction func didSelectOrderNow(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "Order Now")
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	@IBAction func didSelctRedeemNow(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "Redeem Now")
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	@IBAction func didSelectMySchemes(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "My Schemes")
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	@IBAction func didSelectOffersAndPromotions(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "Offers and Promotions")
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	@IBAction func didSelectAnnualTarget(_ sender: UIButton) {
		let viewmodel = VMFactory.shared.knowMoreTargetVM()
		let vc = iOS_CL_Cus_KnowYourTargetVC(viewModel: viewmodel)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	
	
	@IBAction func didSelectMyOrdersBtn(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "My Orders")
		self.navigationController?.pushViewController(view, animated: true)
	}
	
	
	@IBAction func didSelectSupportBtn(_ sender: UIButton) {
		let vc = iOS_CL_SupportsVC()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	
	@IBAction func didSelectMyRedemptions(_ sender: UIButton) {
		let view = iOS_CL_Cus_ComingSoonVC(pageName: "My Redemptions")
		self.navigationController?.pushViewController(view, animated: true)
	}
    
    
    @IBAction func didTappedMyPerfamence(_ sender: Any) {
        let viewmodel = VMFactory.shared.MyPerfamanceVM()
        let vc = iOS_CL_Cus_MyPerformanceVC(viewModel: viewmodel)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
	
	
	private func promotionPopop(){
		let vc = iOS_CL_PromotionAdsVC()
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		self.navigationController?.present(vc, animated: true)
	}

}


extension iOS_CL_DashboardVC{
	private func applySidemenuSwipeGesture() {
		let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(sidemenuOpen))
		swipeGesture.direction = .right
		view.addGestureRecognizer(swipeGesture)
	}
	
	@objc private func sidemenuOpen() {
		let sidemenu = iOS_CL_Cus_SideMenuVC(navigation: self.navigationController)
		sidemenu.modalPresentationStyle = .overFullScreen
		sidemenu.modalTransitionStyle = .crossDissolve
		sidemenu.dashboardData = self.dashboardData
		self.present(sidemenu, animated: true)
	}
}

//MARK: - View models Output
extension iOS_CL_DashboardVC: DashboardVM_OutputProtocol,AlertMessageDelegate{
	func bannerImagesSetup(data: [AlamofireSource]) {
		self.slideshow?.removeFromSuperview()
		self.slideshow = ImageSlideshow()
		self.slideshowImgList = data
		if data.count > 0{
			let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.bannerImageDetails))
			self.slideshow?.addGestureRecognizer(gestureRecognizer)
			self.slideshow?.setImageInputs(data)
			self.slideshow?.slideshowInterval = 2.0
			self.slideshow?.zoomEnabled = true
			self.slideshow?.contentScaleMode = .scaleToFill
			self.slideshow?.pageControl.currentPageIndicatorTintColor = AppColor.yellow1
			self.slideshow?.pageControl.pageIndicatorTintColor = AppColor.customeGray
		}else{
			self.imaegSlideShowView.setImageInputs([ImageSource(image: UIImage(named: "Logo")!)])
		}
		
		if let slideshow{
			self.imaegSlideShowView.addSubview(slideshow)
			self.slideshow?.frame = self.imaegSlideShowView.bounds
		}
	}
	
	
	func didSelectAlertOKBtn() {
		SceneDelegate.appFlowCoordinator?.logoutApp()
	}
	
	func accountDeactivated(error: String) {
		UserDefaults.standard.set(false, forKey: UserdefaultsKey.isUserLogedIn)
		let vc = iOS_CL_Cus_AlertMessageVC()
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		vc.alertMessage = error
		vc.okBtnName = "OK"
		vc.isErrorImageHidden = false
		vc.delegate = self
		self.present(vc, animated: true)
	}
	
	func loginInOtherDevice(error: String) {
		UserDefaults.standard.set(false, forKey: UserdefaultsKey.isUserLogedIn)
		let vc = iOS_CL_Cus_AlertMessageVC()
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		vc.alertMessage = error
		vc.okBtnName = "OK"
		vc.isErrorImageHidden = false
		vc.delegate = self
		self.present(vc, animated: true)
	}
	
	func errorMessage(error: String) {
		
	}
	
	func dashboardDataUpdate(result: DashboardDetailsModels) {
		self.dashboardData = result
		
		self.customerNameLbl.text = result.firstName ?? "-"
		self.membershipIdLbl.text = result.membershipId ?? ""
		self.tierNameLbl.text = result.tierGarde ?? "-"
		self.eligibleAmountLbl.text = result.eligiblePoints ?? "-"
		self.redeemableAmountLbl.text = result.redemablePoints ?? "-"
		
		self.annualTargetPointsLbl.text = result.annualTarget ?? "-"
		self.achivePointsValueLbl.text = result.achieveTarget
		self.annualTargetProgressbar.progressTrackValue = result.annualTargetProgressbarValue ?? 0
		self.annualTargetProgressbar.pointsValue = "\(result.annualTagetPointsValue ?? 0)"
		self.annualTargetStartDateLbl.text = "April \(result.annualTargetStartDate ?? "")"
		self.annualTargetEnddateLbl.text = "March \(result.annualTagetEndDate ?? "")"
		
		if let img = result.customerImage{
			self.profileImageConfig(imageUrl: img)
		}else{
			self.customerImage.image = UIImage(named: "default_profile")
		}
		
		guard result.userActiveStatus ?? true else{
			self.accountDeactivated(error: "Your account has been deactivated! Kindly contact to administrator or contact center at +91-\(API_Url_Constant.shared.helpLineNumber)")
			return
		}

	}
	
	func profileImageConfig(imageUrl: String){
		let img = (imageUrl.replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
		self.customerImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(img)"), placeholderImage: UIImage(named: "default_profile"))
	}
	
}


extension iOS_CL_DashboardVC: ImageDetailsDelegate{
	func imageDetailsDismiss() {
		self.slideshow?.unpauseTimer()
	}
	
	@objc func bannerImageDetails() {
		guard let slideshow else{return}
		let imgUrl = self.slideshowImgList[slideshow.currentPage].url
		slideshow.pauseTimer()
		let vc = ImageDetailsViewVC()
		vc.imgURL = imgUrl
		vc.isRotate = true
		vc.delegate = self
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		present(vc, animated: true)
		
	}
}

