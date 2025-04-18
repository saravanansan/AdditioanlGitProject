//
//  AppViewController.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/09/24.
//

import UIKit
import Lottie


class AppViewController: UIViewController {
	

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	

	func openCallDialer(mobile: String){
		guard let phoneCallURL = URL(string: "tel://\(mobile)") else{
			return
		}
		let application:UIApplication = UIApplication.shared
		if (application.canOpenURL(phoneCallURL)) {
			application.open(phoneCallURL, options: [:], completionHandler: nil)
		}
	}

	
}

