//
//  RootCoordinator.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

final class RootFlowCoordinator {

    private var navigationController: UINavigationController? {
        didSet {
			//didset itu jadi tar kalau navigationcontrollernya berubah dia bakal ngelakuin codingan didalem di set
            postFlowCoordinator.navigationController = navigationController
        }
    }

    private let postFlowCoordinator = PostFlowCoordinator()

    // MARK: - Public methods -
	
    init() {
		
    }

   func createRootViewController() -> UIViewController {
		//ngeset controller
        let initialViewController = postFlowCoordinator.createInitialViewController()
		//bikin navigation controller
        let navigationController = UINavigationController(rootViewController: initialViewController)

		//buat jadi gede navbarnya
        //navigationController.navigationBar.prefersLargeTitles = true

        self.navigationController = navigationController


        return navigationController
    }

}

