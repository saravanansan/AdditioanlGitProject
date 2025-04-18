//
//  iOS_CL_PromotionAdsVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 20/09/24.
//

import UIKit

class iOS_CL_PromotionAdsVC: AppViewController {

	@IBOutlet weak var promotionImage: UIImageDesignable!
	override func viewDidLoad() {
        super.viewDidLoad()

        
    }


	@IBAction func didiSelectCloseBtn(_ sender: UIButtonDesignable) {
		self.dismiss(animated: true)
	}

}
