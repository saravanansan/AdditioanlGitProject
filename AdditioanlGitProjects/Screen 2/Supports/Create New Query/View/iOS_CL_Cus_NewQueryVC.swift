//
//  iOS_CL_Cus_NewQueryVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit
import MotionToastView
import Photos

class iOS_CL_Cus_NewQueryVC: AppViewController {
	
	@IBOutlet weak var topicNameTF: UITextField!
	@IBOutlet weak var queryDetailsTF: UITextField!
	
	
	@IBOutlet weak var imageContainer: UiViewx!
	@IBOutlet weak var queryImage: UIImageView!
	@IBOutlet weak var uploadImgStackView: UIStackView!
	
	var helpTopicName = ""
	var helpTopicID = -1
	var qryImage = ""
	var fileType = ""
	lazy var imagePicker = UIImagePickerController()
	
	var viewModel : NewQueryVM_InputProtocol
	init(viewModel: NewQueryVM_InputProtocol){
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
	}
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func didSelectTopicName(_ sender: UIButton) {
		self.viewModel.helpToicListApi()
	}
	
	
	@IBAction func didSelectUploadImage(_ sender: UIButtonDesignable) {
		let alert = UIAlertController(title: "Choose any option", message: "", preferredStyle: .actionSheet)
		alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
			self.openCamera()
		}))
		alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler:{ (UIAlertAction)in
			self.openGallery()
		}))
		alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
		}))
		self.present(alert, animated: true, completion: {
			print("completion block")
		})
	}
	
	
	@IBAction func didSelectSubmitQueryBtn(_ sender: GradientButton) {
		if self.helpTopicName == ""{
			self.MotionToast(message: "Please select help topic", toastType: .error)
		}else if queryDetailsTF.text?.count == 0{
			self.MotionToast(message: "Please enter query details", toastType: .error)
		}else{
			self.viewModel.newQueryTicketRiseApi(helpTopicName: self.helpTopicName,
												 helpTopicID: self.helpTopicID,
												 qryDetails: self.queryDetailsTF.text ?? "",
												 qrySummary: "",
												 qryImg: self.qryImage,
												 fileType: self.fileType)
		}
	}
}

extension iOS_CL_Cus_NewQueryVC: NewQueryVM_OutputProtocol,SuccessPopopDelegate,TopicNameDelegate{

	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
	
	func helpTopicDropDown(data: [DropdownDataModels]) {
		guard data.count > 0 else {
			self.MotionToast(message: "No data found", toastType: .error)
			return
		}
		
		let vc = iOS_CL_TopicListVC()
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		vc.helpTopicList = data
		vc.selectedStatusID = self.helpTopicID
		vc.delegate = self
		self.navigationController?.present(vc, animated: true)
	}
	
	func querySubmissionSuccessPopup() {
		let vc = iOS_CL_Cus_SuccessPopopVC()
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		vc.delegate = self
		vc.confirmBtnName = "Go to Query List"
		vc.successMSG = "Your query has been successfully submitted"
		self.navigationController?.present(vc, animated: true)
	}
	
	
	func didSelectBackToDashboard() {
		self.navigationController?.popViewController(animated: true)
	}
	
	func updateTopicName(topicName: String, topicID: Int) {
		self.helpTopicName = topicName
		self.helpTopicID = topicID
		self.topicNameTF.text = topicName
	}
	
}


extension iOS_CL_Cus_NewQueryVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
			self.queryImage.image = imagePicked.resized(withPercentage: 0.4)
			self.uploadImgStackView.isHidden = true
			self.queryImage.contentMode = .scaleAspectFit
			let imageData = imagePicked.resized(withPercentage: 0.3)
			let imageData1: NSData = imageData!.pngData()! as NSData
			self.qryImage = imageData1.base64EncodedString(options: .lineLength64Characters)
			self.fileType = "png"
		}
		dismiss(animated: true)
	}
	
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
