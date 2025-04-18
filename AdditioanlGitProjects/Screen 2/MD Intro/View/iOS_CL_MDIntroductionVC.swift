//
//  iOS_CL_MDIntroductionVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/09/24.
//

import UIKit
import WebKit
import SDWebImage
import MotionToastView

class iOS_CL_MDIntroductionVC: UIViewController {

	@IBOutlet weak var introMsgLbl: UITextView!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var getStartedLbl: UILabel!
	@IBOutlet weak var mdImage: UIImageView!
	@IBOutlet weak var designationNameLbl: UILabel!
	@IBOutlet weak var introMsgWebView: WKWebView!
	

	var viewmodel = VMFactory.shared.mdIntroVM()
	init(){
		super.init(nibName: nil, bundle: nil)
		self.viewmodel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.introMsgWebView.scrollView.bounces = false
		self.introMsgWebView.scrollView.maximumZoomScale = 1.0
		self.introMsgWebView.scrollView.maximumZoomScale = 1.0
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.viewmodel.mdIntroFetchApi()
	}

	@IBAction func didSelectGetStarted(_ sender: UIButton) {
		let viewmodel = VMFactory.shared.loginVM()
		let vc = iOS_CL_LoginVC(viewmodels: viewmodel)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}


extension iOS_CL_MDIntroductionVC: MDIntroVM_OutPutDelegate{
	func mdIntroDataOutput(result: ObjImageGalleryList?, error: String?) {
//		self.mdImage.
		print("Binod")
		guard let result else{
			self.MotionToast(message: "Something went wrong!", toastType: .error)
			return
		}
		let imageName = (result.imageGalleryUrl ?? "").replacingOccurrences(of: "~/", with: "")
		if let imageGalleryUrl = URL(string: API_Url_Constant.shared.PROMO_IMG + imageName) {
			self.mdImage.sd_setImage(with: imageGalleryUrl, placeholderImage: UIImage(named: "Logo"))
		}
		self.nameLbl.text = result.displayName ?? ""
		
		self.introMsgWebView.loadHTMLString(result.bodyContent ?? "", baseURL: nil)
	}
	
	
}
