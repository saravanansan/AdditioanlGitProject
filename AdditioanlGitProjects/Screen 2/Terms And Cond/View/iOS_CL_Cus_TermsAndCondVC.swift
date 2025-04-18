//
//  iOS_CL_Cus_TermsAndCondVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/10/24.
//

import UIKit
import WebKit


protocol TermsAndCondDelegate: AnyObject{
	func termsAndCondUpdate(status: Bool)
}

class iOS_CL_Cus_TermsAndCondVC: UIViewController {

	@IBOutlet weak var termsAndCondWebView: WKWebView!
	
	weak var delegate: TermsAndCondDelegate?
	
	var viewmodel: TermsAndCondVM_InputDelegate
	
	init(viewModels: TermsAndCondVM_InputDelegate){
		self.viewmodel = viewModels
		super.init(nibName: nil, bundle: nil)
		self.viewmodel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.termsAndCondWebView.scrollView.bounces = false
		self.termsAndCondWebView.scrollView.maximumZoomScale = 1.0
		self.termsAndCondWebView.scrollView.maximumZoomScale = 1.0
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		 super.viewWillAppear(animated)
		self.termsAndCondApi()
	}
	
	@IBAction func didSelectBack(_ sender: UIButton) {
	}
	
	@IBAction func didSelectAcceptTC(_ sender: GradientButton) {
		self.delegate?.termsAndCondUpdate(status: true)
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func didSelectDeclineTC(_ sender: UIButton) {
		self.delegate?.termsAndCondUpdate(status: false)
		self.navigationController?.popViewController(animated: true)
	}
	
	private func termsAndCondApi(){
		let request = [
			"ActionType": 1,
			"ActorId": "2"
		] as [String : Any]
		self.viewmodel.networkService.termsCondApi(request: request)
	}
	
}



extension iOS_CL_Cus_TermsAndCondVC: TermsAndCondVM_OutPutDelegate{
	func termsCondData(result: LstTermsAndCondition?, error: String?) {
		guard let result else{
			self.MotionToast(message: "Something went wrong please try after sometimes!", toastType: .error)
			return
		}
	
		self.termsAndCondWebView.loadHTMLString(result.html ?? "", baseURL: nil)
	}
	
	
}
