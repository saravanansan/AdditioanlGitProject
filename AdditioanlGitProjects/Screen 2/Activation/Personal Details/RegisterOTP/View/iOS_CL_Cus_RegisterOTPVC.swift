//
//  iOS_CL_Cus_RegisterOTPVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 14/10/24.
//

import UIKit
import DPOTPView
import MotionToastView


protocol RegisterOTPVC_Delegate: AnyObject{
	func otpValidateSuccess()
}


class iOS_CL_Cus_RegisterOTPVC: AppViewController {

	@IBOutlet weak var bgView: UIViewDesignable!
	@IBOutlet weak var pleaseEnterOtpLbl: UILabel!
	@IBOutlet weak var mobileNumberLbl: UILabel!
	@IBOutlet weak var mobileNumberOTPView: DPOTPView!
	@IBOutlet weak var timmerLbl: UILabel!
	@IBOutlet weak var mobile_resendBtn: UIButton!
	
	@IBOutlet weak var emailIDLbl: UILabel!
	@IBOutlet weak var email_OTPView: DPOTPView!
	@IBOutlet weak var email_TimmerLbl: UILabel!
	@IBOutlet weak var email_ResendBtn: UIButton!
	
	@IBOutlet weak var mobileOTPConatinerSV: UIStackView!
	@IBOutlet weak var emailOTPConatinerSV: UIStackView!
	
	var emailID: String?
	var mobileNumber: String?
	
	weak var delegate: RegisterOTPVC_Delegate?
	
	
	var viewmodel: RegisterOTPVM_InputProtocol
	
	var mobileTimmer = Timer()
	var mobileTimeCount = 60
	
	
	var emailTimmer = Timer()
	var emailTimeCount = 60
	
	
	
	init(viewmodels: RegisterOTPVM_InputProtocol){
		self.viewmodel = viewmodels
		super.init(nibName: nil, bundle: nil)
		self.viewmodel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.initialCommits()
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
	
	
	@IBAction func didSelectCloseBtn(_ sender: UIButton) {
		self.animateOut(){}
	}
	
	
	
	@IBAction func didSelectMobileNo_ResendOtp(_ sender: UIButton) {
		self.viewmodel.fetchMobileOTP(userName: self.mobileNumber ?? "")
	}
	
	@IBAction func didSelect_Email_ResendOtp(_ sender: UIButton) {
		self.viewmodel.fetchEmailOTP(userName: self.emailID ?? "")
	}
	
	@IBAction func didSelectSubmitBtn(_ sender: GradientButton) {
		if self.mobileNumber?.count ?? 0 > 0 && self.mobileNumberOTPView.text == ""{
			self.MotionToast(message: "Please enter Mobile OTP", toastType: .error)
		}else if self.mobileNumber?.count ?? 0 > 0 && self.mobileNumberOTPView.text?.count != 6{
			self.MotionToast(message: "Please enter valid Mobile OTP", toastType: .error)
		}else if self.emailID?.count ?? 0 > 0 && self.email_OTPView.text == ""{
			self.MotionToast(message: "Please enter Email OTP", toastType: .error)
		}else if self.emailID?.count ?? 0 > 0 && self.email_OTPView.text?.count != 6{
			self.MotionToast(message: "Please enter valid Email OTP", toastType: .error)
		}else{
			self.viewmodel.OTPValidation(mobile: self.mobileNumber ?? "", mobileOTP: self.mobileNumberOTPView.text ?? "", email: self.emailID ?? "", emailOTP: self.email_OTPView.text ?? "")
		}
	}
	

	private func initialCommits(){
		if let emailID,emailID != ""{
			self.emailIDLbl.text = emailID
			self.viewmodel.fetchEmailOTP(userName: emailID)
			self.emailOTPConatinerSV.isHidden = false
		}else{
			self.emailOTPConatinerSV.isHidden = true
		}
		
		if let mobileNumber,mobileNumber != ""{
			self.mobileNumberLbl.text = mobileNumber
			self.viewmodel.fetchMobileOTP(userName: mobileNumber)
			self.mobileOTPConatinerSV.isHidden = false
		}else{
			self.mobileOTPConatinerSV.isHidden = true
		}
	}
}


//MARK: Open and closing Animation
extension iOS_CL_Cus_RegisterOTPVC{

	 private func animateOut(completion: @escaping () -> ()) {
		let height = bgView.bounds.height
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.bgView.transform = CGAffineTransform(translationX: 0, y: height)
		}, completion: { [weak self] _ in
			self?.dismiss(animated: false){
				completion()
			}
		})
	}
	
	private func animateIn() {
		self.view.backgroundColor = .clear
		let height = bgView.bounds.height
		bgView.transform = CGAffineTransform(translationX: 0, y: height)
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.bgView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
		}
	}
}


extension iOS_CL_Cus_RegisterOTPVC: RegisterOTPVM_OutputProtcol{
	func errorMessage(error: String) {
		self.MotionToast(message: error, toastType: .error)
	}
	
	func emailOtpTriger() {
		self.emailTimmer.invalidate()
		self.emailTimeCount = 60
		self.email_TimmerLbl.isHidden = false
		self.email_ResendBtn.isHidden = true
		self.emailTimmer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.emailUpdateTimer), userInfo: nil, repeats: true)
	}
	
	func mobileOtpTriger() {
		self.mobileTimmer.invalidate()
		self.mobileTimeCount = 60
		self.timmerLbl.isHidden = false
		self.mobile_resendBtn.isHidden = true
		self.mobileTimmer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.mobileUpdateTimer), userInfo: nil, repeats: true)
	}
	
	func otpValidationSuccess() {
		self.animateOut(){
			self.delegate?.otpValidateSuccess()
		}
	}

	
	@objc func mobileUpdateTimer() {
		if self.mobileTimeCount > 1 {
			self.mobileTimeCount -= 1
			self.timmerLbl.text = "00:\(self.mobileTimeCount)"
		}else{
			self.mobileTimmer.invalidate()
			self.timmerLbl.text = "00:00"
			self.timmerLbl.isHidden = true
			self.mobile_resendBtn.isHidden = false
		}
	}
	
	
	@objc func emailUpdateTimer() {
		if self.emailTimeCount > 1 {
			self.emailTimeCount -= 1
			self.email_TimmerLbl.text = "00:\(self.emailTimeCount)"
		}else{
			self.emailTimmer.invalidate()
			self.email_TimmerLbl.text = "00:00"
			self.email_TimmerLbl.isHidden = true
			self.email_ResendBtn.isHidden = false
		}
	}
}
