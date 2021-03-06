//
//  PostDetailViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
class PostDetailViewController: ASViewController<ASDisplayNode> {
	enum NavigationEvent {
		 case backToList

    }

    var onNavigationEvent: ((NavigationEvent) -> Void)?
	var postDetailView: OnePost
    var postdata: Post
	var viewModel: PostViewModel


	init(viewModel: PostViewModel, indexPath: Int, onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {
        self.viewModel = viewModel
		self.postdata = viewModel.posts.value[indexPath]

        self.postDetailView = OnePost(post: postdata)
		super.init(node: self.postDetailView)
		self.onNavigationEvent = onNavigationEvent
		title = "Social Media"
		self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	
        edgesForExtendedLayout = []
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true

    

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	
	
	

}

