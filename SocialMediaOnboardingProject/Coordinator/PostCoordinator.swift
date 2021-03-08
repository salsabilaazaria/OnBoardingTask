//
//  PostCoordinator.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

final class PostFlowCoordinator {
    enum NavigationEvent {
        case toPostDetail
    }
    
    var navigationController: UINavigationController?
    var onNavigationEvent: ((NavigationEvent) -> Void)?
    
//    var viewModel: PostListViewModel = PostListViewModel()

    func createInitialViewController() -> UIViewController {
        return createPostListViewController()
    }

    // MARK: - Private methods -

    private func createPostListViewController() -> HomePostViewController {
        
		let homePostViewController = HomePostViewController( onNavigationEvent: { [weak self] (event: HomePostViewController.NavigationEvent) in
            
            guard let self = self else {
                return
            }
            
			if case .toDetail = event {
                let detailViewController = self.createAddNewViewController()
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }
            
        })
     
        
        return homePostViewController
    }
    
	func createAddNewViewController() -> AddNewPostViewController {
		  let postDetailViewController = AddNewPostViewController( onNavigationEvent: { [weak self] (event: AddNewPostViewController.NavigationEvent) in

			  guard let self = self,
				case .backToList = event else {
				  return
			  }
				  
			  print("CREATE ADD VIEW CONTROLLER")
		  })
		  
		  return postDetailViewController
	  }
   
    
    private func popBackToPostList() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

