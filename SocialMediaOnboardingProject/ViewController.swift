//
//  ViewController.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/3/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode> {
    
  
    private let postNode: HomePost

    init() {
//        self.storyNode = StoryNode(stories: Story.generateDummyStory())
        self.postNode = HomePost(posts: Post.createdummypost())
        
        super.init(node: ASDisplayNode())
        
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
   
    }
    
   required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
    }
}
