//
//  iOS_CL_Cus_QueryChatDetailsVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 30/09/24.
//

import UIKit
import Photos
import AVFoundation
import MotionToastView
import SDWebImage


class iOS_CL_Cus_QueryChatDetailsVC: AppViewController {

	@IBOutlet weak var chatDetailsTV: UITableView!
	@IBOutlet weak var textfieldview: UIView!
	@IBOutlet weak var messageTF: UITextField!
	
	lazy var imagePicker = UIImagePickerController()
	var lodgeQueryDetails: ObjCustomerAllQueryJsonList?
	var nodataFound : NoDataFound?
	
	var chatlistingArray = [ObjQueryResponseJsonList]()
	var ticketStatusID = 1
	
	var viewModel : QueryChatDetailsVM_InputProtocol
	
	init(viewModel: QueryChatDetailsVM_InputProtocol){
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.nodataFound = NoDataFound(view: self.chatDetailsTV)
		self.initalCommits()
		self.ticketStatusIDConfig()
		self.viewModel.chatListApi()
    }
	

	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func didSelectAttachmentBtn(_ sender: UIButton) {
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
	
	@IBAction func didSelectSendMsgBtn(_ sender: UIButton) {
		if self.messageTF.text ?? "" == ""{
			self.MotionToast(message: "Please enter query", toastType: .error)
		}else{
			self.viewModel.sendMSGApi(msg: self.messageTF.text ?? "", qryStatus: self.ticketStatusID) { result in
				if result{
					self.messageTF.text = ""
				}
			}
		}
	}
	
	//MARK: Initial configuration
	private func initalCommits(){
		DispatchQueue.main.async {
			self.imagePicker.delegate = self
			self.chatDetailsTV.register(SenderChatDetailsCell.nib(), forCellReuseIdentifier: SenderChatDetailsCell.identifier)
			self.chatDetailsTV.register(OtherChatDetailsCell.nib(), forCellReuseIdentifier: OtherChatDetailsCell.identifier)
			self.chatDetailsTV.delegate = self
			self.chatDetailsTV.dataSource = self
			self.chatDetailsTV.separatorStyle = .none
		}
	}
	
	private func ticketStatusIDConfig(){
		
		guard (self.lodgeQueryDetails?.ticketStatus ?? "") != "Closed" else{
			self.textfieldview.isHidden = true
			self.ticketStatusID = 4
			return
		}
		
		self.textfieldview.isHidden = false
		if (self.lodgeQueryDetails?.ticketStatus ?? "").lowercased() == "Resolved".lowercased(){
			self.ticketStatusID = 3
		}else if (self.lodgeQueryDetails?.ticketStatus ?? "").lowercased() == "Re-Open".lowercased(){
			self.ticketStatusID = 2
		}else if (self.lodgeQueryDetails?.ticketStatus ?? "").lowercased() == "Resolved-Follow up".lowercased(){
			self.ticketStatusID = 5
		}else if (self.lodgeQueryDetails?.ticketStatus ?? "").lowercased() == "Pending".lowercased(){
			self.ticketStatusID = 1
		}
	}
}




extension iOS_CL_Cus_QueryChatDetailsVC: UITableViewDelegate,UITableViewDataSource{

	
//     MARK: Table view delegate and data source method
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.chatlistingArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let chatDetails =  self.chatlistingArray[indexPath.row]
		if chatDetails.userType?.uppercased() == "Merchant".uppercased() || chatDetails.userType?.uppercased() == "SuperAdmin".uppercased() || chatDetails.userType?.uppercased() == "User".uppercased() || chatDetails.userType?.uppercased() == "Location".uppercased() || chatDetails.userType == ""{
			/***
			 sender chat details data configure
			 */
//            ObjQueryResponseJsonList
			return reciverDataConfigure(tableView: tableView, indexPath: indexPath)
		}else{
//        if chatDetails.userType?.uppercased() == "CUSTOMER"{
			/***
			 Other chat details data configure
			 */
			return senderDataConfigure(tableView: tableView, indexPath: indexPath)
		}
	}
	
   
	private func senderDataConfigure(tableView: UITableView,indexPath : IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: SenderChatDetailsCell.identifier) as? SenderChatDetailsCell
		guard let cell = cell else{
			fatalError("Sender chat detals cell initilaize failed")
		}
		let chatDetails =  self.chatlistingArray[indexPath.row]
		if chatDetails.imageUrl == nil || chatDetails.imageUrl == ""{
			cell.queryImage.isHidden = true
		}else{
			cell.queryImage.isHidden = false
			let imageUrlString = ((chatDetails.imageUrl ?? "").replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
			cell.queryImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(imageUrlString)"), placeholderImage: UIImage(named: "appLogo"),progress: .none)
			cell.imageUrl = "\(API_Url_Constant.shared.PROMO_IMG)\(imageUrlString)"
		}
		if chatDetails.queryResponseInfo == nil || chatDetails.queryResponseInfo == ""{
			cell.queryMsgView.isHidden = true
		}else{
			cell.queryMsgView.isHidden = false
		}
		cell.queryMSGLbl.text = chatDetails.queryResponseInfo ?? ""
		cell.senderNameLbl.text = chatDetails.repliedBy ?? ""
		cell.queryDateTimeLbl.text = DateFormat.shared.customDateFormat(date: chatDetails.jCreatedDate ?? "",fromDate: "MM/dd/yyyy HH:mm:ss",toDate: "dd/MM/yyyy HH:mm:ss")
		cell.delegate = self
		
		cell.layoutIfNeeded()
		cell.updateConstraintsIfNeeded()
		return cell
	}
	
	
	private func reciverDataConfigure(tableView: UITableView,indexPath : IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: OtherChatDetailsCell.identifier) as? OtherChatDetailsCell
		guard let cell = cell else{
			fatalError("Other chat detals cell initilaize failed")
		}
		let chatDetails =  self.chatlistingArray[indexPath.row]
		if chatDetails.imageUrl == nil || chatDetails.imageUrl == ""{
			cell.queryImage.isHidden = true
		}else{
			cell.queryImage.isHidden = false
			let imageUrlString = ((chatDetails.imageUrl ?? "").replacingOccurrences(of: "~/", with: "")).replacingOccurrences(of: "~", with: "")
			cell.queryImage.sd_setImage(with: URL(string: "\(API_Url_Constant.shared.PROMO_IMG)\(imageUrlString)"), placeholderImage: UIImage(named: "appLogo"))
			cell.imageUrl = "\(API_Url_Constant.shared.PROMO_IMG)\(imageUrlString)"
		}
		cell.queryMSGLbl.text = chatDetails.queryResponseInfo ?? ""
		cell.senderNameLbl.text = chatDetails.repliedBy ?? ""
		cell.queryDateTimeLbl.text = DateFormat.shared.customDateFormat(date: chatDetails.jCreatedDate ?? "",fromDate: "MM/dd/yyyy HH:mm:ss",toDate: "dd/MM/yyyy HH:mm:ss")
		cell.delegate = self
		
		cell.layoutIfNeeded()
		cell.updateConstraintsIfNeeded()
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		UITableView.automaticDimension
	}
	
	func scrollToBottom(){
		let indexPath = IndexPath(row:  self.chatlistingArray.count-1, section: 0)
		self.chatDetailsTV.scrollToRow(at: indexPath, at: .bottom, animated: false)
	}
}

// MARK: - TABLEVIEW CELL DELEGATE METHOD
extension iOS_CL_Cus_QueryChatDetailsVC: QueryImageDetailsDelegate{
	func didSelectImageDetails(image: String) {
		self.imageDetails(imageURL: image)
	}
	
}

// MARK: View models Output
extension iOS_CL_Cus_QueryChatDetailsVC: QueryChatDetailsVM_OutputProtocol{
	func chatListUpdate(list: [ObjQueryResponseJsonList]?) {
		self.chatlistingArray = list ?? []
		if (list?.count ?? 0) > 0{
			self.nodataFound?.hideNoDataFound()
		}else{
			self.nodataFound?.showNoDataFound()
		}
		self.chatDetailsTV.reloadData()
		self.scrollToBottom()
	}
	
	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
	
}

//MARK: Image picker delegate Method
extension iOS_CL_Cus_QueryChatDetailsVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
			let imageData = imagePicked.resized(withPercentage: 0.1)
			let imageData1: NSData = imageData!.pngData()! as NSData
			let queryImage = imageData1.base64EncodedString(options: .lineLength64Characters)
			self.viewModel.sendImgApi(qryImg: queryImage, fileType: "JPG", qryStatus: self.ticketStatusID)
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
	
	func imageDetails(imageURL: String) {
		let vc = ImageDetailsViewVC()
		let image = URL(string: imageURL)
		vc.imgURL = image
		vc.modalTransitionStyle = .crossDissolve
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: true)
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
