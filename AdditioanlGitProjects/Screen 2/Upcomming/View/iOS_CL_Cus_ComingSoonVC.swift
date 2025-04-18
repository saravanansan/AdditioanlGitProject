//
//  iOS_CL_Cus_ComingSoonVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 24/10/24.
//

import UIKit
import Lottie

class iOS_CL_Cus_ComingSoonVC: UIViewController {

	@IBOutlet weak var pageNameLbl: UILabel!
	@IBOutlet weak var comingSoonView: LottieAnimationView!
	
	var pageName: String
	
	init(pageName: String){
		self.pageName = pageName
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.pageNameLbl.text = self.pageName
		self.comingSoonView.play()
		self.comingSoonView.loopMode = .loop
    }
	
	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
}
