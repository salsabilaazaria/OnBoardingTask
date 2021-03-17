//
//  AppDelegate.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/3/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	 let flowCoordinator = RootFlowCoordinator()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		
//		let vc = ViewController()
//
//		let navVC = UINavigationController(rootViewController: vc)
//		navVC.navigationBar.backgroundColor = .white
//		navVC.navigationBar.isTranslucent = false
//		vc.title = "Social Media"
		
		let frame = UIScreen.main.bounds
		window = UIWindow(frame: frame)

		window?.rootViewController = flowCoordinator.createRootViewController()
		window?.makeKeyAndVisible()
		
		
		return true
	}
	

}

