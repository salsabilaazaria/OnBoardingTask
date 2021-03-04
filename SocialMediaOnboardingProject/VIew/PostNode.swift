//
//  PostNode.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class PostNode: ASTableNode {
    private let posts: [Post]
    
    init(posts: [Post]) {
		print("POSTNODEEEEE")
        self.posts = posts
        
        super.init(style: .plain)
        
        self.delegate = self
        self.dataSource = self
		
        
        self.view.separatorStyle = .none
//        self.view.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        self.style.width = ASDimension(unit: .fraction, value: 1)
        self.style.height = ASDimension(unit: .fraction, value: 1)
        self.style.flexShrink = 1
    }
}

extension PostNode: ASTableDataSource, ASTableDelegate{
    func numberOfSections(in tableNode: ASTableNode) -> Int {
		print("NUMBER OF SECTION")
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        //ngisi table
        guard posts.count > indexPath.row else { return { ASCellNode() } }
        
        let post = posts[indexPath.row]
        
        // this may be executed on a background thread - it is important to make sure it is thread safe
        let cellNodeBlock = { () -> ASCellNode in
			print("CELL NODEE BLOCK")
            return OnePost(post: post)
        }
        
        return cellNodeBlock
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
    }
}
