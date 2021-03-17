//
//  HomePostViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class HomePostViewController: ASViewController<ASDisplayNode> {
    enum NavigationEvent {
        case toPostDetail(viewModel: PostViewModel, indexPath: Int)
        case toAddPost
    }
    
    var onNavigationEvent: ((NavigationEvent) -> Void)?
    var viewModel: PostViewModel
    var disposedBag: DisposeBag
    
    private var homePost: HomePost
    
    init(viewModel: PostViewModel, onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {
        self.viewModel = viewModel
        self.homePost = HomePost(viewModel: viewModel)
        self.disposedBag = DisposeBag()
        
        
        super.init(node: self.homePost)
        
        self.observePostValue()
        self.configurePostNode()
        
        self.onNavigationEvent = onNavigationEvent
        title = "Social Media"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plusIcon"), style: .done, target: self, action: #selector(toAddNewPost))
        
        
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func toAddNewPost(sender: UIBarButtonItem) {
        self.onNavigationEvent?(.toAddPost)
    }
    
    private func observePostValue() {
         // MARK: - Create observable -
        viewModel.posts.asObservable()
            .subscribe(onNext: { [weak self] posts in
                guard let `self` = self else {
                    
                    return
                }
                
                DispatchQueue.main.async {
                    print("reload data")
                    self.homePost.reloadData()
                }
                
                
            }).disposed(by: disposedBag)
    }
    
    private func configurePostNode() {
         // MARK: - Closure -
        homePost.toDetail = {[weak self] (index) in
            guard let `self` = self else {
                return
            }
            
            self.onNavigationEvent?(.toPostDetail(viewModel: self.viewModel, indexPath: index))
        }
        
    }
    
    
}

