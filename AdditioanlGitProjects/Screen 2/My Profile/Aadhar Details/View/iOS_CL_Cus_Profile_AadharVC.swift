//
//  iOS_CL_Cus_Profile_AadharVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 15/11/24.
//

import UIKit
import DPOTPView

class iOS_CL_Cus_Profile_AadharVC: AppViewController {

	@IBOutlet weak var limitExceedView: UiViewx!
	@IBOutlet weak var aadharInfoView: UiViewx!
	
	@IBOutlet weak var aadharNumberSV: UIStackView!
	@IBOutlet weak var aadharNumberTF: UITextField!
	
	@IBOutlet weak var aadharNameSV: UIStackView!
	@IBOutlet weak var aadharNameTF: UITextField!
	
	@IBOutlet weak var otpContainerView: UIView!
	
	@IBOutlet weak var resendOtpBtn: UIButton!
	@IBOutlet weak var otpView: DPOTPView!
	@IBOutlet weak var timmerLbl: UILabel!
	
	@IBOutlet weak var validateBtn: GradientButton!
	
	@IBOutlet weak var aadharStatusView: UiViewx!
	@IBOutlet weak var aadharStatusLbl: UILabel!
	@IBOutlet weak var nameMatchStatusLbl: UILabel!
	
	@IBOutlet weak var updateProfileNameView: GradientView!
	@IBOutlet weak var editAadharBtn: UIButtonDesignable!
	@IBOutlet weak var proceedBtn: GradientButton!
	@IBOutlet weak var skipBtnView: UIStackView!
	@IBOutlet weak var notesView: UiViewx!
	

	var timmer = Timer()
	var count = 45
	var delegate: Profile_AadharForm_Delegate?
	var profileName: String {
		return self.delegate?.profileName ?? ""
	}
	
	var validateBtnStatus: AadharFormValidateBtnEnum = .validate
	var proceedBtnStatus: AadharFormProceedBtnEnum = .proceed
	
	var viewmodels: Profile_Aadhar_InputProtocol
	init(viewmodels: Profile_Aadhar_InputProtocol){
		self.viewmodels = viewmodels
		
		super.init(nibName: nil, bundle: nil)
		self.viewmodels.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.aadharNumberTF.delegate = self
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
//		self.viewmodels.aadharCountCheck() { count in
			self.viewmodels.getAadharDetailsAPI(countStatus: false)
//		}
	}
	
	
	@IBAction func didiSelectResendBtn(_ sender: UIButton) {
		self.viewmodels.aadharCountCheck { status in
			if status {
				self.viewmodels.fetchAadharOTP(aadharNumber: self.aadharNumberTF.text ?? "")
			}else{
				ToastMessage.shared.showToast(message: "Entered OTP is invalid, you have exceeded the maximum count of 3 times for validating Aadhaar! Kindly contact your administrator.")
			}
		}
	}
	
	
	@IBAction func didSelectValidateBtn(_ sender: GradientButton) {
		self.delegate?.goNextPage()
		/*
		if self.aadharNumberTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter aadhar Number")
		}else if aadharNumberTF.text?.count ?? 0 != 12{
			ToastMessage.shared.showToast(message: "Please enter a valid aadhar number")
		}else{
			switch self.validateBtnStatus {
				case .validate:
					self.aadharNumberValidateBtnAction()
				case .otpSubmit:
					self.aadharOTPValidation()
			}
		}
		 */
	}
	
	@IBAction func didSelectProfileNameUpdate(_ sender: UIButton) {
		self.viewmodels.updateProfileNameAsAadhar(aadharNumber: self.aadharNumberTF.text ?? "")
	}
	
	@IBAction func didSelectEditAadhar(_ sender: UIButtonDesignable) {
		self.viewmodels.aadharCountCheck { status in
			if status {
				self.emptyAadharForm(editStatus: true)
			}else{
				ToastMessage.shared.showToast(message: "You have exceeded the maximum count of 3 times for validating Aadhaar!")
			}
		}
		
	}
	
	@IBAction func didSelectProceedBtn(_ sender: GradientButton) {
		switch proceedBtnStatus {
			case .next:
				self.delegate?.aadharNumber = self.aadharNumberTF.text ?? ""
				self.delegate?.goNextPage()
			case .proceed:
				self.proceedBtnAction()
			case .aadharSubmit:
				self.aadharSubmissionBtnAction()
		}
	}
	
	private func aadharNumberValidateBtnAction(){
		self.viewmodels.aadharCountCheck { status in
			if status {
				self.viewmodels.aadharNumberExistancy(aadharNumber: self.aadharNumberTF.text ?? "")
			}else{
				ToastMessage.shared.showToast(message: "Entered OTP is invalid, you have exceeded the maximum count of 3 times for validating Aadhaar! Kindly contact your administrator.")
			}
		}
		
	}
	
	private func aadharSubmissionBtnAction(){
		if self.otpView.text ?? "" == ""{
			ToastMessage.shared.showToast(message: "Please enter OTP")
		}else if (self.otpView.text ?? "").count != 6{
			ToastMessage.shared.showToast(message: "Please enter Valid OTP")
		}else{
			self.viewmodels.aadharNumberSubmit(aadharNumber: self.aadharNumberTF.text ?? "")
		}
	}
	
	private func aadharOTPValidation(){
		if otpView.text?.count ?? 0 == 0{
			ToastMessage.shared.showToast(message: "Please enter OTP")
		}else if otpView.text?.count ?? 0 != 6{
			ToastMessage.shared.showToast(message: "Please enter valid OTP")
		}else{
			self.viewmodels.aadharOTPValidation(OTP: self.otpView.text ?? "", aadharNumber: self.aadharNumberTF.text ?? "")
		}
		
	}
	
	
	private func proceedBtnAction(){
		self.aadharNumberSV.isHidden = false
		self.validateBtn.isHidden = false
		self.aadharNumberTF.isEnabled = true
		self.aadharNumberTF.text = ""
		self.validateBtnStatus = .validate
		self.validateBtn.setTitle("Validate", for: .normal)
		self.otpContainerView.isHidden = true
		self.proceedBtn.isHidden = true
	}
}




//MARK: - View Models Out
extension iOS_CL_Cus_Profile_AadharVC: Profile_Aadhar_OutputProtocol{

	
//	profile Name Updated
	func profileNameUpdated() {
		ToastMessage.shared.showToast(message: "Your Profile Name has been Updated as per your Aadhaar Name",bgColor: AppColor.yellow1!,textColor: .black)
		self.proceedBtnStatus = .aadharSubmit
		self.proceedBtn.isHidden = false
		self.nameMatchStatusLbl.text = "YES"
		self.nameMatchStatusLbl.textColor = .white
		self.updateProfileNameView.isHidden = true
		self.proceedBtn.setTitle("Submit", for: .normal)
		self.profileNameUpdateSuccessPopop()
	}
	
	private func profileNameUpdateSuccessPopop(){
		let vc = iOS_CL_Cus_SuccessSubmissionVC()
		vc.message = "Your Profile Name has been Updated as per your Aadhaar Name"
		vc.proceedBtnName = "Proceed"
		vc.successImgName = "profilNameUpdateImg"
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: false)
	}
	
	
	func OTPSubmited(status: Bool, aadharDetails: ObjPanDetailsRetrieverequest?) {
		if status{
			self.validateBtn.isHidden = true
			
			self.otpContainerView.isHidden = true
			
			self.aadharStatusView.isHidden = false
			self.notesView.isHidden = false
			if self.profileName.uppercased() == aadharDetails?.aAdharNumber?.uppercased(){
				self.nameMatchStatusLbl.text = "YES"
				self.nameMatchStatusLbl.textColor = .white
				self.updateProfileNameView.isHidden = true
				self.proceedBtn.isHidden = false
				self.proceedBtnStatus = .aadharSubmit
				self.proceedBtn.setTitle("Submit", for: .normal)
			}else{
				self.proceedBtn.isHidden = true
				self.nameMatchStatusLbl.text = "NO"
				self.nameMatchStatusLbl.textColor = AppColor.yellow1
				self.updateProfileNameView.isHidden = false
				self.viewmodels.aadharCountCheck { status in
					self.editAadharBtn.isHidden = !status
				}
			}
		}
	}
	
	 func aadharSubmitSuccessPopop(){
		let vc = iOS_CL_Cus_SuccessSubmissionVC()
		vc.message = "Your Aadhaar verified successfully."
		vc.proceedBtnName = "Proceed"
		vc.successImgName = "profilNameUpdateImg"
		vc.delegate = self
		vc.modalPresentationStyle = .overFullScreen
		self.present(vc, animated: false)
	}
	
	
	func aadharDetailsConfig(aadharNumber: String,aadharName: String, editStatus: Bool) {
		
		
		self.aadharNumberTF.text = "**** **** \(aadharNumber.suffix(4))"//aadharNumber
		self.aadharNumberTF.isEnabled = false
		self.aadharNameTF.text = aadharName
		self.validateBtn.setTitle("Next", for: .normal)
		if aadharName.uppercased() == self.profileName.uppercased(){
			self.nameMatchStatusLbl.text = "YES"
			self.nameMatchStatusLbl.textColor = .white
		}else{
			self.nameMatchStatusLbl.text = "NO"
			self.nameMatchStatusLbl.textColor = AppColor.yellow1
		}
	}
	
	func emptyAadharForm(editStatus: Bool){
		self.aadharNumberTF.text = ""
		self.aadharNameTF.text = ""
		/*
		self.limitExceedView.isHidden = editStatus
		self.aadharInfoView.isHidden = !editStatus
		self.aadharNumberTF.isEnabled = editStatus
		self.resendOtpBtn.isHidden = true
		self.otpContainerView.isHidden = true
		self.aadharNumberSV.isHidden = true
		self.validateBtn.isHidden = true
		self.aadharStatusView.isHidden = true
		self.updateProfileNameView.isHidden = true
		self.editAadharBtn.isHidden = true
		
		self.notesView.isHidden = true
		
		self.proceedBtn.isHidden = !editStatus
		self.proceedBtn.setTitle("Yes! Proceed", for: .normal)
		self.proceedBtnStatus = .proceed
		 */
	}
	
	func activateAccount(result: ActivationModels) {
		let vc = iOS_CL_Cus_ActivateVC(activationData: result)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	

	func errorMessage(error: String) {
		ToastMessage.shared.showToast(message: error)
	}
	
	func otpTriger(status: Bool) {
		self.otpView.text = ""
		if status{
			self.aadharNumberTF.isEnabled = false
			self.validateBtnStatus = .otpSubmit
			self.validateBtn.setTitle("Submit", for: .normal)
			self.otpTimmerStart()
		}else{
			self.otpContainerView.isHidden = true
			self.aadharNumberTF.isEnabled = true
			self.validateBtnStatus = .validate
			self.validateBtn.setTitle("Validate", for: .normal)
		}
		
	}

}

extension iOS_CL_Cus_Profile_AadharVC{
	private func alertMessgae(message: String,title: String = "",btnName: String = "OK"){
		let vc = iOS_CL_Cus_AlertMessageVC()
		vc.alertMessage = message
		vc.titleName = title
		vc.okBtnName = btnName
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		self.present(vc, animated: true)
	}
	
	func otpTimmerStart(){
		self.timmer.invalidate()
		self.count = 45
		self.otpContainerView.isHidden = false
		self.timmerLbl.isHidden = false
		self.resendOtpBtn.isHidden = true
		self.timmer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
	}
	
	@objc func update() {
		if (self.count > 1) {
			self.count = Int(self.count) - 1
			self.timmerLbl.text = "00:\(self.count)"
			if(self.count > 10){
				self.timmerLbl.textColor = .white
			}else{
				self.timmerLbl.textColor = .systemRed
			}
			
		}else{
			self.timmer.invalidate()
			self.timmerLbl.text = "00:00"
			self.timmerLbl.isHidden = true
			self.resendOtpBtn.isHidden = false
		}
	}
}


extension iOS_CL_Cus_Profile_AadharVC: SuccessSubmissionProtocol{
	func didSelectProceedBtn() {
		self.delegate?.aadharNumber = self.aadharNumberTF.text ?? ""
		self.delegate?.goNextPage()
	}
	
}

extension iOS_CL_Cus_Profile_AadharVC: UITextFieldDelegate{
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if textField == self.aadharNumberTF{
			return self.mobileNumberCharacterValdiation(string) && isWithinMaxLength(textField.text, range: range, replacementString: string, maxLenth: 12)
		}else{
			return true
		}
		
	}
	
	private func mobileNumberCharacterValdiation(_ string: String) -> Bool{
		let numberSet = CharacterSet.decimalDigits
		let characterSet = CharacterSet(charactersIn: string)
		return numberSet.isSuperset(of: characterSet)
	}
	
	private func isWithinMaxLength(_ currentText: String?, range: NSRange, replacementString string: String,maxLenth: Int) -> Bool {
		let currentTextLength = currentText?.count ?? 0
		let newTextLength = currentTextLength + string.count - range.length
		return newTextLength <= maxLenth
	}
}
