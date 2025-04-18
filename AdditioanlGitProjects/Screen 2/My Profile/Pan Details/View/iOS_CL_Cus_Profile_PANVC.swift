//
//  iOS_CL_Cus_Profile_PANVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import UIKit

class iOS_CL_Cus_Profile_PANVC: AppViewController {
	
	@IBOutlet weak var limitExceedView: UiViewx!
	@IBOutlet weak var panNumberSV: UIStackView!
	@IBOutlet weak var panNumberTF: UITextField!
	@IBOutlet weak var panNameView: UIViewDesignable!
	@IBOutlet weak var panNameTF: UITextField!
	
	@IBOutlet weak var panStatusView: UiViewx!
	
	@IBOutlet weak var panStatusLbl: UILabel!
	@IBOutlet weak var panAndAddharLinkStatusLbl: UILabel!
	
	@IBOutlet weak var validateBtn: GradientButton!
	@IBOutlet weak var editPanBtn: UIButtonDesignable!
	@IBOutlet weak var proceedBtn: GradientButton!
	
	@IBOutlet weak var skipAndValidateBtnSV: UIStackView!
	@IBOutlet weak var tdsMessageView: UiViewx!
	@IBOutlet weak var notesView: UiViewx!
	
	
	
	var proceedBtnStatus: PANFormProceedBtnEnum = .next
	var aadharNumber: String{
		return self.delegate?.aadharNumber ?? ""
	}
	var mobileNumber: String{
		return self.delegate?.mobileNumber ?? ""
	}
	var isAAdharValid = 0
	var aadharRemarks = ""
	
	var viewmodels: Profile_PAN_InputProtocol
	var delegate: Profile_PANForm_Delegate?
	
	init(viewmodels: Profile_PAN_InputProtocol){
		self.viewmodels = viewmodels
		super.init(nibName: nil, bundle: nil)
		self.viewmodels.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.panNumberTF.delegate = self
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.viewmodels.getPanDetailsAPI(actorId: Constants.userID, loyaltyId: Constants.loyaltyID, panEditStatus: false)
	}
	
	@IBAction func didSelectValidateBtn(_ sender: GradientButton) {

		self.delegate?.goNextPage()
		/*
		if self.panNumberTF.text ?? "" == ""{
			ToastMessage.shared.showToast(message: "Please enter PAN Number")
		}else if (self.panNumberTF.text?.count ?? 0) != 10{
			ToastMessage.shared.showToast(message: "Please enter Valid PAN Number")
		}else{
			self.viewmodels.panNumberExistancy(UserName: self.panNumberTF.text ?? "", userID: Constants.userID){
				self.panValidationApi()
			}
		}
		 */
	}
	
	
	@IBAction func didSelectEditPan(_ sender: UIButtonDesignable) {
		self.viewmodels.panCountCheck(loyaltyID: Constants.loyaltyID) { status in
			if status {
				self.emptyPANForm(panEditStatus: true)
			}else{
				self.editPanBtn.isHidden = true
				ToastMessage.shared.showToast(message: "You have exceeded the maximum limit of 3 times , kindly contact to your administrator")
			}
		}
	}
	
	@IBAction func didSelectProceedBtn(_ sender: GradientButton) {
		switch self.proceedBtnStatus {
			case .proceed:
				self.viewmodels.panSubmissionAPI(userID: Constants.userID, firstName: self.panNameTF.text ?? "", IsAAdharValid: self.isAAdharValid, loyaltyId: Constants.loyaltyID, mobile: self.mobileNumber, PanNumber: self.panNumberTF.text ?? "", remarks: self.aadharRemarks)
			case .next:
				self.delegate?.goNextPage()
		}
		
	}
	
	func panValidationApi(){
		self.viewmodels.panCountCheck(loyaltyID: Constants.loyaltyID) { status in
			if status {
				self.viewmodels.panValidationAPI(AAdharNumber: self.aadharNumber, loyaltyId: Constants.loyaltyID, mobile: self.mobileNumber, panNumber: self.panNumberTF.text ?? "")
			}else{
				ToastMessage.shared.showToast(message: "You have exceeded the maximum limit of 3 times , kindly contact to your administrator")
			}
		}
	}
}


// MARK: - View Models Output
extension iOS_CL_Cus_Profile_PANVC: Profile_PAN_OutputProtocol{
	
	func panNumberValidateResponse(data: ObjPanDetailsRetrieverequest1?) {
		self.viewmodels.panCountCheck(loyaltyID: Constants.loyaltyID) { status in
			self.limitExceedView.isHidden = status
			self.editPanBtn.isHidden = !status
			self.editPanBtn.setTitle("Edit PAN", for: .normal)
		}
		
		self.panNumberTF.text = data?.panNumber ?? ""
		self.panNumberTF.isEnabled = false
		self.panNameTF.text = data?.firstName ?? ""
		self.panStatusView.isHidden = false
		self.validateBtn.isHidden = true
		self.proceedBtn.isHidden = false
		self.proceedBtn.setTitle("Proceed", for: .normal)
		self.proceedBtnStatus = .proceed
		
		
		if (data?.isAAdharValidMessage ?? "").contains("already linked to given Aadhaar"){
			self.aadharRemarks = ""
			self.isAAdharValid = 1
			self.tdsMessageView.isHidden = true
			self.panAndAddharLinkStatusLbl.text = "YES"
			self.panAndAddharLinkStatusLbl.textColor = .white
		}else{
			self.aadharRemarks = "PAN and Aadhaar Not linked"
			self.isAAdharValid = 0
			self.tdsMessageView.isHidden = true
			self.panAndAddharLinkStatusLbl.text = "NO"
			self.panAndAddharLinkStatusLbl.textColor = AppColor.yellow1!
		}
	}
	
	
	func panDetailsDataConfig(panEditStatus: Bool, data: LstPanDetails1) {

		self.panNumberTF.text = "******\((data.panId ?? "").suffix(4))"
		self.panNameTF.text = data.panName ?? ""
		
		//self.proceedBtn.setTitle("Next", for: .normal)
		
		if data.isVerified ?? "" == "1"{
			self.panAndAddharLinkStatusLbl.text = "YES"
			self.panAndAddharLinkStatusLbl.textColor = .white
			self.tdsMessageView.isHidden = true
		}else{
			self.panAndAddharLinkStatusLbl.text = "NO"
			self.panAndAddharLinkStatusLbl.textColor = AppColor.yellow1!
			self.tdsMessageView.isHidden = false
		}
		
	}
	
	func emptyPANForm(panEditStatus: Bool){
		self.panNumberTF.text = ""
		self.panNameTF.text = ""
		self.tdsMessageView.isHidden = true
		/*
		self.limitExceedView.isHidden = panEditStatus
		self.panNumberSV.isHidden = !panEditStatus
		self.panNameView.isHidden = true
		self.panNumberTF.isEnabled = true
		self.panStatusView.isHidden = true
		self.validateBtn.isHidden = !panEditStatus
		self.proceedBtn.isHidden = true
		self.editPanBtn.isHidden = true
		self.tdsMessageView.isHidden = true
		self.notesView.isHidden = false
		self.proceedBtnStatus = .proceed
		self.proceedBtn.setTitle("Proceed", for: .normal)
		*/
	}
	
	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
}
extension iOS_CL_Cus_Profile_PANVC:SuccessSubmissionProtocol{
	 func panSubmitsSuccess(){
		let vc = iOS_CL_Cus_SuccessSubmissionVC()
		vc.message = "Your PAN Submitted successfully."
		vc.proceedBtnName = "Proceed"
		vc.successImgName = "profilNameUpdateImg"
		vc.modalPresentationStyle = .overFullScreen
		vc.delegate = self
		self.present(vc, animated: false)
	}
	
	func didSelectProceedBtn() {
		self.delegate?.goNextPage()
	}
}

extension iOS_CL_Cus_Profile_PANVC: UITextFieldDelegate{
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if textField == self.panNumberTF{
			self.panNumberTF.text = (textField.text)?.uppercased()
		}
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if textField == self.panNumberTF{
			return self.mobileNumberCharacterValdiation(string) && isWithinMaxLength(textField.text, range: range, replacementString: string, maxLenth: 10)
		}else{
			return true
		}
		
	}
	
	private func mobileNumberCharacterValdiation(_ string: String) -> Bool{
		let number_alphabate = NSCharacterSet(charactersIn:"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
		let characterSet = CharacterSet(charactersIn: string)
		return number_alphabate.isSuperset(of: characterSet)
	}
	
	private func isWithinMaxLength(_ currentText: String?, range: NSRange, replacementString string: String,maxLenth: Int) -> Bool {
		let currentTextLength = currentText?.count ?? 0
		let newTextLength = currentTextLength + string.count - range.length
		return newTextLength <= maxLenth
	}
}

