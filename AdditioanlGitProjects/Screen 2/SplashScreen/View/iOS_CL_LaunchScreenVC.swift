//
//  iOS_CL_LaunchScreenVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/09/24.
//

import UIKit

class iOS_CL_LaunchScreenVC: UIViewController {

	@IBOutlet weak var pathImage: UIImageView!
	@IBOutlet weak var personImage: UIImageView!
	
	
	private let events: EventHandler
	
	init(events: @escaping EventHandler) {
		self.events = events
		super.init(nibName: nil, bundle: nil)
	}
	required init?(coder: NSCoder) { fatalError() }
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.animation()
    }
	
	func animation() {
		self.personImage.isHidden = false
		self.personImage.alpha = 0
		UIView.animate(withDuration: 1.5, animations: { [weak self] in
			guard let self = self else { return }
			self.personImage.alpha = 1
//			self.personImage.frame.origin.y = -40
		}) { _ in
			//animation completed
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
				self.events(.md_Intro_VC)
			}
		}
		
	}



}

extension iOS_CL_LaunchScreenVC{
	typealias EventHandler = (Events) -> Void
	
	enum Events {
		case md_Intro_VC
	}
}
