//
//  iOS_CL_ActiveAccountSuccessPopUpVC.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 15/11/24.
//

import UIKit

class iOS_CL_ActiveAccountSuccessPopUpVC: UIViewController {

	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTappedGoToDashboard(_ sender: Any) {
        self.dismiss(animated: true)
        redirectingNextScreen()
    }
}

extension iOS_CL_ActiveAccountSuccessPopUpVC{
    func redirectingNextScreen(){
        SceneDelegate.appFlowCoordinator?.logoutApp()
    }
}

