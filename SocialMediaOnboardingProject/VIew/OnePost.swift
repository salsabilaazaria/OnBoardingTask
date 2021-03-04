//
//  OnePost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class OnePost: ASCellNode{
    let post: Post
    
    let header: Header
    let postdesc: ASTextNode
    
    init(post: Post) {
        self.post = post
        header = Header(post: post)
        
        postdesc = ASTextNode()
        postdesc.attributedText = NSAttributedString(string: post.description)
        
        
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
           
       let mainstack = ASStackLayoutSpec(direction: .vertical,
                                                   spacing: 2,
                                                   justifyContent: .start,
                                                   alignItems: .start,
                                                   children: [header, postdesc])
                 
        return mainstack
       }
    
 
}
