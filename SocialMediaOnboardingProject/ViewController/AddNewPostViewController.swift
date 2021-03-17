//
//  PostDetailViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
import RxCocoa
import RxSwift

class AddNewPostViewController: ASViewController<ASDisplayNode> {
    enum NavigationEvent {
    
        case toHome
        
    }
    
    var onNavigationEvent: ((NavigationEvent) -> Void)?
    var AddNew: AddNewPost
    var viewModel: PostViewModel
    
    
    
    init(viewModel: PostViewModel, onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {

        self.AddNew = AddNewPost()
        self.viewModel = viewModel
        
        super.init(node: self.AddNew)
        self.onNavigationEvent = onNavigationEvent
        title = "Add Post"
        
        
        edgesForExtendedLayout = []
        
        observePostValue()
        configurePostNode()
        
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        
        
        
    }
    
    private func observePostValue() {
        print("observepostvalue")
        self.AddNew.textInput.textView.rx.text.orEmpty.bind(to: self.viewModel.description)
        
    }
    
    private func configurePostNode() {
        print("configurepostnode")
        
        AddNew.addPost = { [weak self] in
            guard let `self` = self else {
                return
            }
            if self.viewModel.description.value != ""{
                self.onNavigationEvent?(.toHome)
                self.viewModel.addPost()
            }
            
            
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

