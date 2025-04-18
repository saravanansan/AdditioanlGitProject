//
//  iOS_CL_LoginVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/09/24.
//

import UIKit
import DPOTPView
import MotionToastView

class iOS_CL_LoginVC: AppViewController {

	
	@IBOutlet weak var sendOTPBtn: GradientButton!
	@IBOutlet weak var membershipIDTF: UITextField!
	@IBOutlet weak var resendOTPBtn: UIButton!
	@IBOutlet weak var otpView: DPOTPView!
	@IBOutlet weak var timerLbl: UILabel!
	@IBOutlet weak var termsAndcondBtn: UIButton!
	@IBOutlet weak var otpViewContainer: UIView!
	@IBOutlet weak var proccedBtn: GradientButton!
	
	@IBOutlet weak var accountActivateView: UIView!
	
	var viewmodel: CL_LoginVM_InputDelegate
	var timmer = Timer()
	var count = 60
	
	
	init(viewmodels: CL_LoginVM_InputDelegate){
		self.viewmodel = viewmodels
		super.init(nibName: nil, bundle: nil)
		self.viewmodel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.membershipIDTF.delegate = self
    }
	
	
	@IBAction func didSelectbackBtn(_ sender: UIButton) {
		if self.otpViewContainer.isHidden{
			self.navigationController?.popViewController(animated: true)
		}else{
			self.membershipIDTF.isUserInteractionEnabled = true
			self.otpViewContainer.isHidden = true
			self.accountActivateView.isHidden = false
			self.proccedBtn.isHidden = true
			self.sendOTPBtn.isHidden = false
		}
	}
	
	
	
	@IBAction func didSelectSendOTPbtn(_ sender: UIButton) {
		if self.membershipIDTF.text == ""{
			ToastMessage.shared.showToast(message: "Please enter Customer ID / Mobile Number")
		}else{
			self.viewmodel.mobileNumberExistancy(userName: self.membershipIDTF.text ?? "")
		}

	}
	
	@IBAction func didSelectResendOTPBtn(_ sender: UIButton) {
		self.viewmodel.fetchOTP(userName: self.membershipIDTF.text ?? "")
	}
	
	
	@IBAction func didSelectProccedBtn(_ sender: GradientButton) {
		guard (self.membershipIDTF.text?.count ?? 0) > 0 else{
			ToastMessage.shared.showToast(message: "Please enter Customer ID / Mobile Number")
			return
		}
		guard self.termsAndcondBtn.currentImage == UIImage(systemName: "checkmark.square.fill") else{
			ToastMessage.shared.showToast(message: "Please Accept Terms And Condition")
			return
		}
		
		guard (self.otpView.text?.count ?? 0) == 6 else{
			ToastMessage.shared.showToast(message: "Please enter valid OTP")
			return
		}
		
		self.viewmodel.OTPValidation(OTP: self.otpView.text ?? "", userName: self.membershipIDTF.text ?? "")
		
	}
	
	
	@IBAction func didSelectActivateBtn(_ sender: GradientButton) {
		guard (self.membershipIDTF.text?.count ?? 0) > 0 else{
			ToastMessage.shared.showToast(message: "Please enter Customer ID / Mobile Number")
			return
		}
		
		self.viewmodel.activationCheckApi(userName: self.membershipIDTF.text ?? "")
	}
	
	@IBAction func didSelectTermsAndCond(_ sender: UIButton) {
		let viewmodels = VMFactory.shared.termsAndCondVM()
		let view = iOS_CL_Cus_TermsAndCondVC(viewModels: viewmodels)
		view.delegate = self
		self.navigationController?.pushViewController(view, animated: true)
	}
	
}


//View Models Out
extension iOS_CL_LoginVC: CL_LoginVM_OutPutDelegate{
	func activateAccount(result: ActivationModels) {
		let vc = iOS_CL_Cus_ActivateVC(activationData: result)
		self.navigationController?.pushViewController(vc, animated: true)	
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
	
	
	func errorMessage(error: String) {
		ToastMessage.shared.showToast(message: error,position: .bottom)
	}
	
	func otpTriger() {
		self.membershipIDTF.isUserInteractionEnabled = false
		self.otpViewContainer.isHidden = false
		self.accountActivateView.isHidden = true
		self.proccedBtn.isHidden = false
		self.sendOTPBtn.isHidden = true
		self.otpTimmerStart()
	}
	
	
	
	func otpTimmerStart(){
		self.timmer.invalidate()
		self.count = 60
		self.timerLbl.isHidden = false
		self.resendOTPBtn.isHidden = true
		self.timmer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
	}
	
	@objc func update() {
		if (self.count > 1) {
			self.count = Int(self.count) - 1
			self.timerLbl.text = "00:\(self.count)"
			if(self.count > 10){
				self.timerLbl.textColor = .white
			}else{
				self.timerLbl.textColor = .systemRed
			}
			
		}else{
			self.timmer.invalidate()
			self.timerLbl.text = "00:00"
			self.timerLbl.isHidden = true
			self.resendOTPBtn.isHidden = false
		}
	}
}

//Terms and condition Delegate
extension iOS_CL_LoginVC: TermsAndCondDelegate{
	func termsAndCondUpdate(status: Bool) {
		if status {
			self.termsAndcondBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
		}else{
			self.termsAndcondBtn.setImage(UIImage(systemName: "square"), for: .normal)
		}
	}
	
	
}


extension iOS_CL_LoginVC: UITextFieldDelegate{
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if textField == self.membershipIDTF{
			return self.membershipIDCharacterValdiation(string) && isWithinMaxLength(textField.text, range: range, replacementString: string, maxLenth: 25)
		}else{
			return true
		}
		
	}
	
	private func membershipIDCharacterValdiation(_ string: String) -> Bool{
		let allowedCharacters = CharacterSet.letters.union(CharacterSet.decimalDigits)
		let characterSet = CharacterSet(charactersIn: string)
		return allowedCharacters.isSuperset(of: characterSet)
	}
	
	private func isWithinMaxLength(_ currentText: String?, range: NSRange, replacementString string: String,maxLenth: Int) -> Bool {
		let currentTextLength = currentText?.count ?? 0
		let newTextLength = currentTextLength + string.count - range.length
		return newTextLength <= maxLenth
	}
}
