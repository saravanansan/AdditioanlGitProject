//
//  iOS_CL_Cus_MyProfileContainerVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import UIKit
import Photos

protocol Profile_PersonalDetails_Delegate{
	func personalDataUpdate(data: PersonalDetailsModels?)
	var imageUploadStatus: Bool{get set}
}


protocol Profile_AadharForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
	var aadharNumber: String{get set}
	var personalDetails: PersonalDetailsModels?{get}
	var profileName: String{get}
}


protocol Profile_PANForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
	var aadharNumber: String{get}
	var mobileNumber: String{get}
	var personalDetails: PersonalDetailsModels?{get}
}


protocol Profile_GSTForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
}

protocol Profile_CustomerRefference_Delegate{
	func goBackBtnAction()
	func goNextPage()
}

class iOS_CL_Cus_MyProfileContainerVC: UIViewController {

	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var pageNameCV: UICollectionView!
	
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var firmNameLbl: UILabel!
	@IBOutlet weak var firmNameTitleLbl: UILabel!
	
	@IBOutlet weak var membershipIDTitleLbl: UILabel!
	@IBOutlet weak var membershipIDLbl: UILabel!
	
	@IBOutlet weak var profileImageEditBtn: UIButton!
	
	var profileName = ""
	var mobileNumber = ""
	var aadharNumber = ""
	var imageUploadStatus = false
	
	private var pageController: UIPageViewController?
	var pagesArrayData = ["Personal Details","AADHAAR","PAN","GST","Customer Reffrence"]
	private var activationPages : [UIViewController] = []
	private var currentIndex: Int = 0
	private var selectedIndex = 0
	var personalDetails: PersonalDetailsModels?
	
	var viewModel : MyProfileContainerVM_InputProtocol
	lazy var imagePicker = UIImagePickerController()
	
	
	init(viewModel: MyProfileContainerVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		DispatchQueue.main.async {
			self.imagePicker.delegate = self
		}
		self.pageNameCV.register(iOS_CL_Cus_ActivationPageNameTVC.nib(), forCellWithReuseIdentifier: iOS_CL_Cus_ActivationPageNameTVC.identifier)
		self.pageNameCV.delegate = self
		self.pageNameCV.dataSource = self
		self.dataConfigur()
		setupPageController()
	}

	
	@IBAction func didSelectBack(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
		/*if self.selectedIndex == 0{
			self.navigationController?.popViewController(animated: true)
		}else{
			let index = self.selectedIndex - 1
			self.switchPage(indexValue: index)
//			self.goBackConfirmation()
		}*/
		
	}
	
	@IBAction func didSelectProfileImage(_ sender: UIButton) {
		let alert = UIAlertController(title: "Choose any option", message: "", preferredStyle: .actionSheet)
		alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
			self.openCamera()
		}))
		alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler:{ (UIAlertAction)in
			self.openGallery()
		}))
		alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler:{ (UIAlertAction)in
		}))
		self.present(alert, animated: true, completion: {
			print("completion block")
		})
	}
	
}



//MARK: Pageviewcontroller Delegate
extension iOS_CL_Cus_MyProfileContainerVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
	private func setupPageController() {
		self.viewControllerConfig()
		self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
		self.pageController?.view.backgroundColor = .clear
		self.pageController?.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		let initialVC =  activationPages[0]
		self.pageController?.setViewControllers([initialVC], direction: .reverse, animated: true, completion: nil)
		self.addChild(self.pageController!)
		self.view.addSubview(self.pageController!.view)
		pageController?.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pageController!.view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
			pageController!.view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
			pageController!.view.topAnchor.constraint(equalTo: self.containerView.topAnchor),
			pageController!.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
		])
		self.pageController?.didMove(toParent: self)
	}
	

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = activationPages.firstIndex(of: viewController), index > 0 else {
			return nil
		}
		self.selectedIndex = index - 1
		return activationPages[index - 1]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = activationPages.firstIndex(of: viewController), index < activationPages.count - 1 else {
			return nil
		}
		self.selectedIndex = index + 1
		return activationPages[index + 1]
	}
	
}


//MARK: view controller configuration
extension iOS_CL_Cus_MyProfileContainerVC{
	private func viewControllerConfig(){
		let perosonalVC  = self.personalDetailsViewConfig()
		let aadharVC = self.aadharFormConfig()
		let panFormVC = self.panFormConfig()
		let gstFormVC = self.gstFormConfig()
		let refferenceVC = self.refferenceVCConfig()
		self.activationPages = [perosonalVC,aadharVC,panFormVC,gstFormVC,refferenceVC]
	}
	
	private func personalDetailsViewConfig()-> iOS_CL_Cus_ProfilePersonalDetailsVC{
		let viewmodels = VMFactory.shared.profilePerosnalVM()
		let view =  iOS_CL_Cus_ProfilePersonalDetailsVC(viewmodels: viewmodels)
		view.delegate = self
		return view
	}
	
	private func aadharFormConfig() -> iOS_CL_Cus_Profile_AadharVC{
		let viewmodels = VMFactory.shared.profileAadharVM()
		let view = iOS_CL_Cus_Profile_AadharVC(viewmodels: viewmodels)
		view.delegate = self
		return view
	}
	
	private func panFormConfig() -> iOS_CL_Cus_Profile_PANVC{
		let viewmodels = VMFactory.shared.profilePANVM()
		let view = iOS_CL_Cus_Profile_PANVC(viewmodels: viewmodels)
		view.delegate = self
		return view
	}
	
	private func gstFormConfig() -> iOS_CL_Cus_Profile_GSTVC{
		let viewmodels = VMFactory.shared.profileGSTVM()
		let view = iOS_CL_Cus_Profile_GSTVC(viewmodels: viewmodels)
		view.delegate = self
		return view
	}
	
	private func refferenceVCConfig() -> iOS_CL_Cus_Profile_CustomerRefferenceVC{
		let viewmodels = VMFactory.shared.profileCustomerRefferenceVM()
		let view = iOS_CL_Cus_Profile_CustomerRefferenceVC(viewmodels: viewmodels)
		view.delegate = self
		return view
	}
}

//MARK: CollectionView Delegate
extension iOS_CL_Cus_MyProfileContainerVC: UICollectionViewDelegate,UICollectionViewDataSource{
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.pagesArrayData.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iOS_CL_Cus_ActivationPageNameTVC.identifier, for: indexPath) as? iOS_CL_Cus_ActivationPageNameTVC
		guard let cell else{
			return UICollectionViewCell()
		}
		if self.selectedIndex == indexPath.item{
			cell.pageNameLbl.textColor = AppColor.yellow1
			cell.buttomLine.backgroundColor = AppColor.yellow1
		}else{
			cell.pageNameLbl.textColor = .lightGray
			cell.buttomLine.backgroundColor = .clear
		}
		cell.pageNameLbl.text = self.pagesArrayData[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.switchPage(indexValue: indexPath.item)
	}
	
}


extension iOS_CL_Cus_MyProfileContainerVC{
	private func dataConfigur(){
		self.profileImageEditBtn.isHidden = false
		self.firmNameLbl.text = ""
		self.membershipIDLbl.text = Constants.loyaltyID
	}
	
	func profileImageConfig(imageUrl: String){
		let img = (imageUrl.replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
		self.profileImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(img)"), placeholderImage: UIImage(named: "default_profile"))
		self.profileImageEditBtn.isHidden = false
	}
	
}

// MARK: - view models output
extension iOS_CL_Cus_MyProfileContainerVC: MyProfileContainerVM_OutputProtocol{
	func errorMessage(error: String) {
		self.alertMessgae(message: error)
	}
	
	private func alertMessgae(message: String,title: String = "",btnName: String = "OK"){
		let vc = iOS_CL_Cus_AlertMessageVC()
		vc.alertMessage = message
		vc.titleName = title
		vc.okBtnName = btnName
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		self.present(vc, animated: true)
	}
}


//MARK: Image picker delegate Method
extension iOS_CL_Cus_MyProfileContainerVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
			self.profileImage.image = imagePicked
			let imageData = imagePicked.resized(withPercentage: 0.1)
			let imageData1: NSData = imageData!.pngData()! as NSData
			let base64 = imageData1.base64EncodedString(options: .lineLength64Characters)
			self.viewModel.imageUpdateApi(imageUrl: base64)
		}
		dismiss(animated: true)
		
	}
	
	//Open Camera
	func openCamera(){
		guard UIImagePickerController.isSourceTypeAvailable(.camera) else{
			self.noCamera()
			return
		}
		AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
			guard response else{
				self.showSetting(title: "Need Camera Access", message: "Allow Camera Access")
				return
			}
			guard AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized else{
				return
			}
			DispatchQueue.main.async {
				self.imagePicker.allowsEditing = false
				self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
				self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: self.imagePicker.sourceType)!
				self.imagePicker.sourceType = .camera
				self.imagePicker.mediaTypes = ["public.image"]
				self.imagePicker.modalPresentationStyle = .overFullScreen
				self.present(self.imagePicker,animated: true,completion: nil)
			}
		}
	}
	
	func noCamera(){
		DispatchQueue.main.async {
			let alertVC = UIAlertController(title: "No Camera", message: "Sorry no device", preferredStyle: .alert)
			let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
			alertVC.addAction(okAction)
			self.present(alertVC, animated: true, completion: nil)
		}
	}
	
	func openGallery() {
		
		PHPhotoLibrary.requestAuthorization({
			(newStatus) in
			guard newStatus ==  PHAuthorizationStatus.authorized else{
				self.showSetting(title: "Need Gallary access", message: "Allow Gallery Access")
				return
			}
			DispatchQueue.main.async {
				self.imagePicker.allowsEditing = false
				self.imagePicker.sourceType = .photoLibrary
				self.present(self.imagePicker, animated: true, completion: nil)
			}
		})
	}
	
	func showSetting(title: String = "", message: String,okBtnName: String = "Allow",cancelBtnName: String = "DisAllow") {
		DispatchQueue.main.async {
			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
			let openSettingsAction = UIAlertAction(title: okBtnName, style: .default) { _ in
				guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
				UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
			}
			let cancelAction = UIAlertAction(title: cancelBtnName, style: .cancel)
			alert.addAction(openSettingsAction)
			alert.addAction(cancelAction)
			self.present(alert, animated: true, completion: nil)
		}
	}
	
}

// MARK: Personal Details Delegate
extension iOS_CL_Cus_MyProfileContainerVC: Profile_PersonalDetails_Delegate{
	
	func personalDataUpdate(data: PersonalDetailsModels?) {
		var fullName = data?.objCustomer?.firstName ?? ""
		if data?.objCustomer?.lastName ?? "" != ""{
			fullName += " \(data?.objCustomer?.lastName ?? "")"
		}
		self.profileName = fullName
		self.personalDetails = data
		self.mobileNumber = data?.objCustomer?.customerMobile ?? ""
		self.firmNameLbl.text = data?.objCustomer?.company ?? ""
		if let imgURL = data?.objCustomer?.displayImage{
			self.profileImageConfig(imageUrl: imgURL)
		}else{
			self.profileImage.image = UIImage(named: "default_profile")
		}
	}
	
	func goBackBtnAction() {
		let index = self.selectedIndex - 1
		self.switchPage(indexValue: index)
	}
	
	func goNextPage(){
		let index = self.selectedIndex + 1
		self.switchPage(indexValue: index)
	}
	
	private func switchPage(indexValue: Int){
		guard self.selectedIndex != indexValue && self.activationPages.count > indexValue else{
			return
		}
		let initialVC =  self.activationPages[indexValue]
		if self.selectedIndex > indexValue{
			self.selectedIndex = indexValue
			self.pageController?.setViewControllers([initialVC], direction: .reverse, animated: true, completion: nil)
		}else{
			self.selectedIndex = indexValue
			self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
		}
		
		self.pageNameCV.scrollToItem(at: IndexPath(item: indexValue, section: 0), at: .centeredHorizontally, animated: true)
		self.pageNameCV.reloadData()
	}
	
}

//MARK: Aadhar Form Delegate
extension iOS_CL_Cus_MyProfileContainerVC: Profile_AadharForm_Delegate{
	
}


//MARK: PAN Form Delegate
extension iOS_CL_Cus_MyProfileContainerVC: Profile_PANForm_Delegate{
	
}

//MARK: GST Form Delegate
extension iOS_CL_Cus_MyProfileContainerVC: Profile_GSTForm_Delegate{
	
}


//MARK: Customer Refference Delegate
extension iOS_CL_Cus_MyProfileContainerVC: Profile_CustomerRefference_Delegate{
	
}


extension iOS_CL_Cus_MyProfileContainerVC: ConfirmationPopopDelegate{
	
	func goBackConfirmation(){
		let view = iOS_CL_Cus_GoBackConfirmationPopopVC()
		view.modalPresentationStyle = .overFullScreen
		view.message = "Are you sure you want to go back? Details will not be saved!"
		view.yesBtnName = "No, Stay here"
		view.noBtnName = "Yes! Go Back"
		view.isWarningIconHidden = false
		view.delegate = self
		self.present(view, animated: false)
	}
	
	func didSelectBackConfirm() {
		self.goBackBtnAction()
	}
}
