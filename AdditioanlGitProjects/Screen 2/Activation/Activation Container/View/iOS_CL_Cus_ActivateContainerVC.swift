//
//  iOS_CL_Cus_ActivateContainerVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/10/24.
//

import UIKit
import SDWebImage
import Photos
import AVFoundation


protocol PersonalDetails_Delegate{
	func goNextPage()
	func profileImageConfig(imageUrl: String)
	var profileName: String{get set}
	var mobileNumber: String{get set}
	var imageUploadStatus: Bool{get set}
}

protocol AadharForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
	var profileName: String{get}
	var aadharNumber: String{get set}
}


protocol PANForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
	var aadharNumber: String{get}
	var mobileNumber: String{get}
}


protocol GSTForm_Delegate{
	func goBackBtnAction()
	func goNextPage()
}

protocol CustomerRefference_Delegate{
	func goBackBtnAction()
	func goNextPage()
}



class iOS_CL_Cus_ActivateContainerVC: AppViewController {

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
	
	var customerDetails: ObjCustomerBasicDetailsActivation
	var viewModel : ActivateContainerVM_InputDelegate
	lazy var imagePicker = UIImagePickerController()
	
	
	init(customerDetails: ObjCustomerBasicDetailsActivation,viewModel: ActivateContainerVM_InputDelegate){
		self.customerDetails = customerDetails
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
		if self.selectedIndex == 0{
			self.navigationController?.popViewController(animated: true)
		}else{
			self.goBackConfirmation()
		}
		
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
extension iOS_CL_Cus_ActivateContainerVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
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
extension iOS_CL_Cus_ActivateContainerVC{
	private func viewControllerConfig(){
		let perosonalVC  = self.personalDetailsViewConfig()
		let aadharVC = self.aadharFormConfig()
		let panFormVC = self.panFormConfig()
		let gstFormVC = self.gstFormConfig()
		let refferenceVC = self.refferenceVCConfig()
		self.activationPages = [perosonalVC,aadharVC,panFormVC,gstFormVC,refferenceVC]
	}
	
	private func personalDetailsViewConfig()-> iOS_CL_Cus_PersonalDetailsVC{
		let viewmodels = VMFactory.shared.personalDetailsFormVM()
		let view = iOS_CL_Cus_PersonalDetailsVC(customerDetails: customerDetails, viewmodels: viewmodels)
		view.delegate = self
		return view
	}
	
	private func aadharFormConfig() -> iOS_CL_Cus_AadharFormVC{
		let viewmodels = VMFactory.shared.aadharFormVM()
		let view = iOS_CL_Cus_AadharFormVC(customerDetails: self.customerDetails, viewmodels: viewmodels)
        view.delegate = self
		return view
	}
	
	private func panFormConfig() -> iOS_CL_Cus_PANFormVC{
		let viewmodels = VMFactory.shared.panFormVM()
		let view = iOS_CL_Cus_PANFormVC(customerDetails: self.customerDetails, viewmodels: viewmodels)
        view.delegate = self
		return view
	}
	
	private func gstFormConfig() -> iOS_CL_Cus_GSTFormVC{
		let viewmodels = VMFactory.shared.GSTFormVM()
		let view = iOS_CL_Cus_GSTFormVC(customerDetails: self.customerDetails, viewmodels: viewmodels)
        view.delegate = self
		return view
	}
	
	private func refferenceVCConfig() -> iOS_CL_Cus_CustomerRefferenceVC{
		let viewmodels = VMFactory.shared.customerReffVM()
		let view = iOS_CL_Cus_CustomerRefferenceVC(customerDetails: self.customerDetails, viewmodels: viewmodels)
		return view
	}
}

//MARK: CollectionView Delegate
extension iOS_CL_Cus_ActivateContainerVC: UICollectionViewDelegate,UICollectionViewDataSource{
	
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
		//self.switchPage(indexValue: indexPath.item)
	}
	
}


extension iOS_CL_Cus_ActivateContainerVC{
	private func dataConfigur(){
		self.profileImageEditBtn.isHidden = false
		self.firmNameLbl.text = self.customerDetails.firmName ?? ""
		self.membershipIDLbl.text = self.customerDetails.loyalityID ?? ""
		if let imgURL = self.customerDetails.profilePicture{
			self.profileImageConfig(imageUrl: imgURL)
			self.imageUploadStatus = true
		}else{
			self.imageUploadStatus = false
			self.profileImage.image = UIImage(named: "default_profile")
		}
	}
	
	func profileImageConfig(imageUrl: String){
		let img = (imageUrl.replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
		self.profileImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(img)"), placeholderImage: UIImage(named: "default_profile"))
	}
	
}

// MARK: - view models output
extension iOS_CL_Cus_ActivateContainerVC: ActivateContainerVM_OutPutDelegate{
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
extension iOS_CL_Cus_ActivateContainerVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
			self.profileImage.image = imagePicked
			let imageData = imagePicked.resized(withPercentage: 0.1)
			let imageData1: NSData = imageData!.pngData()! as NSData
			let base64 = imageData1.base64EncodedString(options: .lineLength64Characters)
			self.viewModel.imageUpdateApi(imageUrl: base64)
			self.imageUploadStatus = true
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
extension iOS_CL_Cus_ActivateContainerVC: PersonalDetails_Delegate{
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
extension iOS_CL_Cus_ActivateContainerVC: AadharForm_Delegate{
	
}


//MARK: PAN Form Delegate
extension iOS_CL_Cus_ActivateContainerVC: PANForm_Delegate{
	
}

//MARK: GST Form Delegate
extension iOS_CL_Cus_ActivateContainerVC: GSTForm_Delegate{
	
}


//MARK: Customer Refference Delegate
extension iOS_CL_Cus_ActivateContainerVC: CustomerRefference_Delegate{
	
}


extension iOS_CL_Cus_ActivateContainerVC: ConfirmationPopopDelegate{
	
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
