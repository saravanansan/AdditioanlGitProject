//
//  iOS_CL_Cus_GSTFormVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 08/10/24.
//

import UIKit
import MotionToastView
import Photos

class iOS_CL_Cus_GSTFormVC: AppViewController, SuccessSubmissionProtocol {
    func didSelectProceedBtn() {
        self.delegate?.goNextPage()
    }
    

	@IBOutlet weak var gstNumberTF: UITextField!
	@IBOutlet weak var gstNameTF: UITextField!
	
	@IBOutlet weak var gstAddressTextView: UITextView!
	@IBOutlet weak var gstAddressPlaceholderLbl: UILabel!
	
	@IBOutlet weak var imageNameView: UIViewDesignable!
	@IBOutlet weak var imageNameLbl: UILabel!
	
	@IBOutlet weak var notesLbl: UILabel!
    @IBOutlet weak var uplaodImageOutBtn: UIButton!
	
	@IBOutlet weak var uploadImgClearBtn: UIButton!
	
	@IBOutlet weak var submitBtn: GradientButton!
	@IBOutlet weak var skipBtn: UIButtonDesignable!
	
	
    
    var gstImage = ""
    var fileType = ""
    lazy var imagePicker = UIImagePickerController()
    var delegate: GSTForm_Delegate?
    var viewmodels: GSTFormVM_InputProtocol
	var customerDetails: ObjCustomerBasicDetailsActivation
	init(customerDetails: ObjCustomerBasicDetailsActivation,viewmodels: GSTFormVM_InputProtocol){
		self.viewmodels = viewmodels
		self.customerDetails = customerDetails
		super.init(nibName: nil, bundle: nil)
		self.viewmodels.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		DispatchQueue.main.async {
			self.imagePicker.delegate = self
			self.gstAddressTextView.delegate = self
		}
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewmodels.getGSTDetailsAPI(actorId: "\(self.customerDetails.user_ID ?? 0)")
	}

	@IBAction func didSelectremoveImage(_ sender: UIButton) {
        self.imageNameLbl.text = "Upload image"
        self.gstImage = ""
		self.imageNameView.isHidden = true
	}
	
	@IBAction func skipBtn(_ sender: UIButtonDesignable) {
		if self.skipBtn.currentTitle == "Edit"{
			self.submitBtn.setTitle("Save", for: .normal)
			self.skipBtn.setTitle("Skip & Proceed", for: .normal)
			self.gstNameTF.text = ""
			self.gstNumberTF.text = ""
			self.gstAddressTextView.text = ""
			self.gstAddressPlaceholderLbl.isHidden = false
			self.imageNameView.isHidden = true
			self.gstImage = ""
			self.imageNameLbl.text = "Upload image"
			self.formEditableConfig(status: true)
		}else{
			self.delegate?.goNextPage()
		}
		
	}
	
	@IBAction func didSelectSaveBtn(_ sender: GradientButton) {
		if self.submitBtn.currentTitle == "Next"{
			self.delegate?.goNextPage()
		}else{
			if self.gstNumberTF.text?.count == 0{
				
				ToastMessage.shared.showToast(message: "Please Enter GST Number")
			}else if self.gstNameTF.text == ""{
				ToastMessage.shared.showToast(message: "Please Enter GST Name")
			}else if self.gstAddressTextView.text == ""{
				ToastMessage.shared.showToast(message: "Please Enter Adress")
			}
			else if self.gstImage == ""{
				ToastMessage.shared.showToast(message: "Please upload GST Image")
			}
			else{
				self.viewmodels.getGSTValidationApi(actorId: "\(self.customerDetails.user_ID ?? 0)", gstAddress: self.gstAddressTextView.text ?? "", gstDocument: self.gstImage, gstName: self.gstNameTF.text ?? "", gstNumber: self.gstNumberTF.text ?? "")
			}
		}
	}
    
    
    @IBAction func didselectUploadImageBtn(_ sender: Any) {
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
}


extension iOS_CL_Cus_GSTFormVC: GSTFormVM_OutputProtocol{
    
    func gstSubmitSuccessPopop(){
       let vc = iOS_CL_Cus_SuccessSubmissionVC()
       vc.message = "You have saved GST details successfully."
       vc.proceedBtnName = "Proceed"
       vc.successImgName = "Group 29228"
       vc.delegate = self
       vc.modalPresentationStyle = .overFullScreen
       self.present(vc, animated: false)
   }
    
    func gstDetailsData(result: GetGstDetailsModels) {
		if (result.lstGSTDetails?.count ?? 0) > 0 ,let gstdata = result.lstGSTDetails?[0],(gstdata.gstNumber ?? "") != ""{
			self.gstNameTF.text = gstdata.gstName ?? ""
			self.gstNumberTF.text = gstdata.gstNumber ?? ""
			self.gstAddressTextView.text = gstdata.gstAddress ?? ""
			self.gstAddressPlaceholderLbl.isHidden = true
			self.imageNameLbl.text = gstdata.gstDocument ?? ""
			self.imageNameView.isHidden = false
			self.submitBtn.setTitle("Next", for: .normal)
			self.skipBtn.setTitle("Edit", for: .normal)
			self.formEditableConfig(status: false)
		}else{
			self.imageNameView.isHidden = true
			self.gstAddressPlaceholderLbl.isHidden = false
			self.submitBtn.setTitle("Save", for: .normal)
			self.skipBtn.setTitle("Skip & Proceed", for: .normal)
			self.formEditableConfig(status: true)
		}

    }
	
	private func formEditableConfig(status: Bool){
		self.gstNumberTF.isEnabled = status
		self.gstNameTF.isEnabled = status
		self.gstAddressTextView.isEditable = status
		self.uplaodImageOutBtn.isEnabled = status
		self.uploadImgClearBtn.isEnabled = status
	}
    
    func errorMessage(error: String) {
		ToastMessage.shared.showToast(message: error)
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

extension iOS_CL_Cus_GSTFormVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let resizedImage = imagePicked.resized(withPercentage: 0.3)
            guard let imageData = resizedImage?.pngData() else { return }
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("selectedImage.png")
            self.imageNameLbl.text = "\(documentsURL)"
            do {
                try imageData.write(to: fileURL)
                print("Image URL: \(fileURL)")
                self.gstImage = imageData.base64EncodedString(options: .lineLength64Characters)
                self.imageNameLbl.text = "\(fileURL)"
                self.fileType = "png"
				self.imageNameView.isHidden = false
            } catch {
                print("Error saving image: \(error)")
            }
        }
        
        picker.dismiss(animated: true)
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


//MARK: - Textview Delegate
extension iOS_CL_Cus_GSTFormVC: UITextViewDelegate{
	func textViewDidChange(_ textView: UITextView) {
		if textView == gstAddressTextView{
			textView.text.count == 0 ? (self.gstAddressPlaceholderLbl.isHidden = false) : (self.gstAddressPlaceholderLbl.isHidden = true)
		}
	}
}
