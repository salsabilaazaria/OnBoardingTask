//
//  PostDetailViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
class AddNewPostViewController: ASViewController<ASDisplayNode> {
	enum NavigationEvent {
		 case backToList
 
    }

    var onNavigationEvent: ((NavigationEvent) -> Void)?
	var AddNew: AddNewPost

   

    init( onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {

//        self.postNode = HomePost(posts: Post)
	
		self.AddNew = AddNewPost()

        super.init(node: self.AddNew)
		self.onNavigationEvent = onNavigationEvent
		title = "Social Media"
  
        
        edgesForExtendedLayout = []
        
       
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        

		
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

