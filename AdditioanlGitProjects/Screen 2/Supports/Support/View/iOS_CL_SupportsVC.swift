//
//  iOS_CL_SupportsVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 28/09/24.
//

import UIKit

class iOS_CL_SupportsVC: AppViewController{

	@IBOutlet weak var mobileNumberLbl: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()
    }

	
	@IBAction func didSelectBackBtn(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
	
	@IBAction func didSelectLodgeQueryBtn(_ sender: GradientButton) {
		let viewmodels = VMFactory.shared.lodgeQueryListVM()
		let vc = iOS_CL_LodgeQueryListVC(viewModel: viewmodels)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func didSelectCallBtn(_ sender: UIButton) {
	}
	
	
}
