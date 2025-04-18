//
//  iOS_CL_Cus_Offers_PromotionsDetailsVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 26/11/24.
//

import UIKit
import WebKit

class iOS_CL_Cus_Offers_PromotionsDetailsVC: UIViewController {

    @IBOutlet weak var offersDetailsimage: UIImageView!
    @IBOutlet weak var offersAndDetailsWebkit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTappedBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension iOS_CL_Cus_Offers_PromotionsDetailsVC{
    private func configuration(){
        
    }
}

extension iOS_CL_Cus_Offers_PromotionsDetailsVC{
    
}
