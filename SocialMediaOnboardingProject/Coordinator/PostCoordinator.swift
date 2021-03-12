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
        case toAddPost
    }
    
    var navigationController: UINavigationController?
    var onNavigationEvent: ((NavigationEvent) -> Void)?
    
    var viewModel: PostViewModel = PostViewModel()
    
    func createInitialViewController() -> UIViewController {
        return createPostListViewController(viewModel: viewModel)
    }
    
    // MARK: - Private methods -
    
    private func createPostListViewController(viewModel: PostViewModel) -> HomePostViewController {
        //coordinator yang ada di homepost
        let homePostViewController = HomePostViewController( viewModel: viewModel ,onNavigationEvent: { [weak self] (event: HomePostViewController.NavigationEvent) in
            
            guard let self = self else {
                return
            }
            
            if case .toAddPost = event {
                let addPostViewController = self.createAddNewViewController()
                self.navigationController?.pushViewController(addPostViewController, animated: true)
            }
            else if case .toPostDetail(let viewModel, let indexPath) = event {
                let detailPostViewController = self.createPostDetailViewController(viewModel: viewModel, indexpath: indexPath)
                 self.navigationController?.pushViewController(detailPostViewController, animated: true)
                print("topostdetail case")
            }
            
        })
        
        
        return homePostViewController
    }
    
    func createAddNewViewController() -> AddNewPostViewController {
        let HomePostViewController = AddNewPostViewController( onNavigationEvent: { [weak self] (event: AddNewPostViewController.NavigationEvent) in
            
            guard let self = self,
                case .backToList = event else {
                    return
            }
            
            print("CREATE ADD VIEW CONTROLLER")
        })
        
        return HomePostViewController
    }
    
    func createPostDetailViewController(viewModel: PostViewModel, indexpath: Int) -> PostDetailViewController {
		//coordinator yang ada di postdetail
           let postDetailViewController = PostDetailViewController(viewModel: viewModel, indexPath: indexpath, onNavigationEvent: { [weak self] (event: PostDetailViewController.NavigationEvent) in

               guard let self = self,
                   case .backToList = event else {
                   return
               }
                   
              
           })
         print("flowCoordinator : ")
           
           return postDetailViewController
       }
    
    
    private func popBackToPostList() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

