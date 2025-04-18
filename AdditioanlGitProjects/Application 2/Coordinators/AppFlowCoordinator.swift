//
//  AppFlowCoordinator.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/09/24.
//

import UIKit

final class AppFlowCoordinator {
	private var reachability: ReachabilityAutoSync?
	private var window: UIWindow
	private var navigationController: UINavigationController {
		didSet { navigationController.navigationBar.isHidden = true
			self.navigationController.interactivePopGestureRecognizer?.isEnabled = false
		}
	}
	
	
	init(window: UIWindow?) {
		self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
		self.navigationController = UINavigationController()
	}
}


extension AppFlowCoordinator: Coordinator {
	func appMaintenace() {
		
	}
	
	func forceUpdate() {
		
	}
	
	func logoutApp() {
		UserDefaults.standard.set(false, forKey: UserdefaultsKey.isUserLogedIn)
		self.mdIntroScreen()
	}
	
	func dashboard() {
		UserDefaults.standard.set(true, forKey: UserdefaultsKey.isUserLogedIn)
		self.dashboardScreen()
	}
	
	func start() {
		self.makeInitialView()
		reachability = try? ReachabilityAutoSync()
		startMonitoringReachability()
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
		if !reachable {
/*No internet*/
			let view = iOS_CL_Cus_NoInternetVC()
			view.modalPresentationStyle = .overFullScreen
			self.navigationController.present(view, animated: true)
		}
	}
	
	private func makeInitialView() {
		let loginStatus = UserDefaults.standard.bool(forKey: UserdefaultsKey.isUserLogedIn)
		let viewController = iOS_CL_LaunchScreenVC(){ events in 
			switch events{
				case .md_Intro_VC:
					if loginStatus{
						self.dashboardScreen()
					}else{
						self.mdIntroScreen()
					}
			}
		}
		navigationController = UINavigationController(rootViewController: viewController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	private func mdIntroScreen(){
		let viewController = iOS_CL_MDIntroductionVC()
		navigationController = UINavigationController(rootViewController: viewController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	private func dashboardScreen(){
		let viewmodels = VMFactory.shared.dashboardVM()
		let viewController = iOS_CL_DashboardVC(viewModel: viewmodels)
		navigationController = UINavigationController(rootViewController: viewController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}

