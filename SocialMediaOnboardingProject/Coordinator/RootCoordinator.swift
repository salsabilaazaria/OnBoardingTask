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
            self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            
            
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
        //        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController = navigationController
        
        
        return navigationController
    }
    
}

