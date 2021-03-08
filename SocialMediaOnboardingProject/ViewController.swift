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

        self.postNode = HomePost(posts: Post.createdummypost())

		super.init(node: self.postNode)

        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
//		self.node.layoutSpecBlock = {_,_ in
//
//			let mainStack = ASStackLayoutSpec(direction: .vertical,
//											  spacing: 0,
//											  justifyContent: .start,
//											  alignItems: .stretch,
//											  children: [
//												self.postNode])
//
//			return mainStack
//		}

		
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
