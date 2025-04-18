//
//  SceneDelegate.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 18/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	static var appFlowCoordinator: Coordinator?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let _windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: _windowScene)
		SceneDelegate.appFlowCoordinator = AppFlowCoordinator(window: window)
		SceneDelegate.appFlowCoordinator?.start()
	}

	

	func sceneDidEnterBackground(_ scene: UIScene) {
		(UIApplication.shared.delegate as? AppDelegate)?.saveContext()
	}


}

