//
//  iOS_CL_Cus_SideMenuVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/10/24.
//

import UIKit
import SDWebImage

class iOS_CL_Cus_SideMenuVC: AppViewController {

	@IBOutlet weak var customerProfileImage: UIImageDesignable!
	@IBOutlet weak var customerNameLbl: UILabel!
	@IBOutlet weak var sidemenuTV: UITableView!
	@IBOutlet weak var containerView: UIView!
	
	var dashboardData = DashboardDetailsModels()
	var viewModels: SideMenuInput_Delegate
	var sidemenuListArray = [SideMenuSectionModels]()
	
	 private var sidemenuNavigation: UINavigationController?
	
	
	init(viewModels: SideMenuInput_Delegate = SideMenuVM(),navigation: UINavigationController?) {
		self.viewModels = viewModels
		self.sidemenuNavigation = navigation
		super.init(nibName: nil, bundle: nil)
		self.viewModels.VC = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.sidemenuListArray = viewModels.sideMenuList()
		self.sidemenuTVConfig()
		self.applySwipeGesture()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		self.animateIn()
		self.dataBind()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else{return}
		if touch.view == self.view {
			self.animateOut()
		}
	}
	
	@IBAction func didSelectSignoutBtn(_ sender: GradientButton) {
		let view = iOS_CL_Cus_ConfirmationPopopVC()
		view.modalPresentationStyle = .overFullScreen
		view.message = "Are you sure you want to logout?"
		view.isWarningIconHidden = false
		view.delegate = self
		self.present(view, animated: false)
	}
	
	func dataBind(){
		self.customerNameLbl.text = self.dashboardData.firstName ?? "-"
		if let img = self.dashboardData.customerImage{
			self.profileImageConfig(imageUrl: img)
		}else{
			self.customerProfileImage.image = UIImage(named: "default_profile")
		}
		
	}
	
	func profileImageConfig(imageUrl: String){
		let img = (imageUrl.replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
		self.customerProfileImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(img)"), placeholderImage: UIImage(named: "default_profile"))
	}
	
}

extension iOS_CL_Cus_SideMenuVC: UITableViewDelegate,UITableViewDataSource{
	private func sidemenuTVConfig(){
		self.sidemenuTV.register(iOS_CL_Cus_SideMenuTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_SideMenuTVC.identifier)
		self.sidemenuTV.register(iOS_CL_Cus_SideMenuSectionTVC.nib(), forCellReuseIdentifier: iOS_CL_Cus_SideMenuSectionTVC.identifier)
		self.sidemenuTV.delegate = self
		self.sidemenuTV.dataSource = self
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.sidemenuListArray.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.sidemenuListArray[section].menuDetails.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		if indexPath.row == 0{
//			return sectionDataTV(tableView, cellForRowAt: indexPath)
//		}else{
			return sidemenuDataConfigTV(tableView, cellForRowAt: indexPath)
//		}
		
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		if indexPath.row == 0{
//			return 25
//		}else{
			return 40
//		}
		
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_SideMenuSectionTVC.identifier) as? iOS_CL_Cus_SideMenuSectionTVC
		guard let cell else{return UITableViewCell()}
		cell.sectionNameLbl.text = self.sidemenuListArray[section].sectionName
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 14
	}
	
	func sectionDataTV(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_SideMenuSectionTVC.identifier, for: indexPath) as? iOS_CL_Cus_SideMenuSectionTVC
		guard let cell else{return UITableViewCell()}
		cell.sectionNameLbl.text = self.sidemenuListArray[indexPath.section].sectionName
		return cell
	}
	
	func sidemenuDataConfigTV(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: iOS_CL_Cus_SideMenuTVC.identifier, for: indexPath) as? iOS_CL_Cus_SideMenuTVC
		guard let cell else{return UITableViewCell()}
		let data = self.sidemenuListArray[indexPath.section].menuDetails[indexPath.row]
		cell.sideMenuNameLbl.text = data.menuName
		cell.sideMenuIcon.image = UIImage(named: data.menuIcon)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedMenuData = self.sidemenuListArray[indexPath.section].menuDetails[indexPath.row]
		self.routePage(selectedMenu: selectedMenuData.selectedMenuName)
	}
	
	private func routePage(selectedMenu: SideMenuPageName){
		self.animateOut()
		switch selectedMenu{
			case .myProfile:
				let viewmodels = VMFactory.shared.myProfileContainerVM()
				let view = iOS_CL_Cus_MyProfileContainerVC(viewModel: viewmodels)
				self.sidemenuNavigation?.pushViewController(view, animated: true)
			case .mySchemes:
            let viewmodels = VMFactory.shared.scheemVM()
            let view = iOS_CL_MySchemesVC(viewModel: viewmodels)
            self.sidemenuNavigation?.pushViewController(view, animated: true)
			case .orderNow:
				self.commingSoon(pageName: "Order Now")
			case .myOrders:
//				self.commingSoon(pageName: "My Orders")
            let vc = iOS_CL_Cus_MyOrdersVC()
            self.sidemenuNavigation?.pushViewController(vc, animated: true)
			case .orderFulfilment:
//				self.commingSoon(pageName: "Order Fulfilment")
            let viewmodels = VMFactory.shared.OrderFulfillmentVM()
            let vc = iOS_CL_Cus_OrderFulfillmentVC(viewModel: viewmodels)
            self.sidemenuNavigation?.pushViewController(vc, animated: true)
			case .retailerOrderSummary:
//				self.commingSoon(pageName: "Retailer Order Summary")
            let vc = iOS_CL_Cus_RetailerOrderSummeryVC()
            self.sidemenuNavigation?.pushViewController(vc, animated: true)
			case .myPurchase:
				let viewmodel = VMFactory.shared.purchaseListVM()
				let view = iOS_CL_Cus_MyPurchaseListVC(viewModel: viewmodel)
				self.sidemenuNavigation?.pushViewController(view, animated: true)
			case .myRedemptions:
//				self.commingSoon(pageName: "My Redemptions")
            let vc = iOS_CL_Cus_MyRedemptionVC()
            self.sidemenuNavigation?.pushViewController(vc, animated: true)
			case .gift:
//				self.commingSoon(pageName: "Gifts")
            let vc = iOS_CL_Cus_RedemptionCatalogueListingVC()
            self.sidemenuNavigation?.pushViewController(vc, animated: true)
			case .offresAndPromotions:
            let viewmodels = VMFactory.shared.OffersAndPromotionsVM()
            let view = iOS_CL_Cus_Offers_PromotionsVC(viewModel: viewmodels)
            self.sidemenuNavigation?.pushViewController(view, animated: true)
			case .aboutProgram:
				self.commingSoon(pageName: "About Program")
			case .support:
				let vc = iOS_CL_SupportsVC()
				self.sidemenuNavigation?.pushViewController(vc, animated: true)
		}
		
	}
	
	private func commingSoon(pageName: String){
		let view = iOS_CL_Cus_ComingSoonVC(pageName: pageName)
		self.sidemenuNavigation?.pushViewController(view, animated: true)
	}
}


//MARK: Sidemenu Open and closing Animation
extension iOS_CL_Cus_SideMenuVC{
	private func applySwipeGesture() {
		let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(animateOut))
		swipeGesture.direction = .left
		view.addGestureRecognizer(swipeGesture)
	}
	
	@objc private func animateOut() {
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			
			self?.view.backgroundColor = .clear
			self?.containerView.transform = CGAffineTransform(translationX: -(self?.containerView.bounds.width ?? 0), y: 0)
		}, completion: { [weak self] _ in
			self?.dismiss(animated: true)
		})
	}
	
	private func animateIn() {
		self.view.backgroundColor = .clear
		
		containerView.transform = CGAffineTransform(translationX: -containerView.bounds.width, y: 0)
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.containerView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
		}
	}
}

extension iOS_CL_Cus_SideMenuVC: SideMenuVMOutput_Delegate{

}


extension iOS_CL_Cus_SideMenuVC: ConfirmationPopopDelegate{
	func didSelectBackConfirm() {
		SceneDelegate.appFlowCoordinator?.logoutApp()
	}
}
