//
//  iOS_CL_Cus_NoInternetVC.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 20/11/24.
//

import UIKit

class iOS_CL_Cus_NoInternetVC: UIViewController {

	@IBOutlet weak var noInternetConnectionView: UIImageDesignable!
	@IBOutlet weak var noInternetLbl: UILabel!
	
	private var reachability: ReachabilityAutoSync?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		reachability = try? ReachabilityAutoSync()
		startMonitoringReachability()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.animateIn()
	}
	func startMonitoringReachability() {
		guard let reachability = reachability else { return }
		reachability.whenReachable = { [weak self] reachability in
			self?.updateReachabilityStatus(reachable: true)
		}
		reachability.whenUnreachable = { [weak self] _ in
			self?.updateReachabilityStatus(reachable: false)
		}
		do {
			try reachability.startNotifier()
		} catch {
			print("Failed to start reachability notifier")
		}
	}
	
	func updateReachabilityStatus(reachable: Bool) {
			if reachable {
//				Internet
				self.noInternetConnectionView.backgroundColor = .green
				self.noInternetLbl.text = "Back to online"
				self.noInternetLbl.textColor = .black
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
					self.animateOut {}
				}
			} else {
//				No internet
			}
		}
}



//MARK: Open and closing Animation
extension iOS_CL_Cus_NoInternetVC{
	
	
	private func animateOut(completion: @escaping () -> ()) {
		let height = noInternetConnectionView.bounds.height
		UIView.animate(withDuration: 0.4, animations: { [weak self] in
			self?.view.backgroundColor = .black.withAlphaComponent(0)
			self?.noInternetConnectionView.transform = CGAffineTransform(translationX: 0, y: height)
		}, completion: { [weak self] _ in
			completion()
			self?.dismiss(animated: true)
		})
	}
	
	private func animateIn() {
		self.view.backgroundColor = .clear
		let height = noInternetConnectionView.bounds.height
		noInternetConnectionView.transform = CGAffineTransform(translationX: 0, y: height)
		UIView.animate(withDuration: 0.4) { [weak self] in
			self?.noInternetConnectionView.transform = .identity
			self?.view.backgroundColor = .black.withAlphaComponent(0.4)
		}
	}
}
