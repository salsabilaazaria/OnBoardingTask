//
//  HomePostViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
class HomePostViewController: ASViewController<ASDisplayNode> {
	enum NavigationEvent {
		case toDetail
	}
	
	var onNavigationEvent: ((NavigationEvent) -> Void)?
	
	
	private let postNode: HomePost
	
	init(onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {
		
		self.postNode = HomePost(posts: Post.createdummypost())
		
		super.init(node: self.postNode)
		self.onNavigationEvent = onNavigationEvent
		title = "Posts"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plusIcon"), style: .done, target: self, action: #selector(toDetailTapped))
		
		
		self.node.backgroundColor = .white
		self.node.automaticallyManagesSubnodes = true
		
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	@objc func toDetailTapped(sender: UIBarButtonItem) {
		// Function body goes here
		self.onNavigationEvent?(.toDetail)
	}
}

