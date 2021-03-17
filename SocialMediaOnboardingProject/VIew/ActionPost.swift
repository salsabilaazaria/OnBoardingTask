//
//  ActionPost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class ActionPost: ASDisplayNode{
    var didLove: (() -> Void)?
    
    private let likeImg: ASImageNode
    private let likeText: ASTextNode
    private let likeButton: ASButtonNode
    private let commentImg: ASImageNode
    private let commentText: ASTextNode
    private let commentButton: ASButtonNode
    private let shareImg: ASImageNode
    private let shareText: ASTextNode
    private let shareButton: ASButtonNode
    
    
    
    override init() {
        print("ACTION POST")
        self.likeImg = ASImageNode()
        likeImg.image = #imageLiteral(resourceName: "love")
        likeImg.style.preferredSize = CGSize(width: 10, height: 10)
        self.likeText = ASTextNode()
        likeText.attributedText = NSAttributedString.normal("Like")
        self.likeButton = ASButtonNode()
        
        self.commentImg = ASImageNode()
        commentImg.image = #imageLiteral(resourceName: "comment")
        commentImg.style.preferredSize = CGSize(width: 10, height: 10)
        self.commentText = ASTextNode()
        commentText.attributedText = NSAttributedString.normal("Comment")
        self.commentButton = ASButtonNode()
        
        self.shareImg = ASImageNode()
        shareImg.image = #imageLiteral(resourceName: "share")
        shareImg.style.preferredSize = CGSize(width: 10, height: 10)
        self.shareText = ASTextNode()
        shareText.attributedText = NSAttributedString.normal("Share")
        self.shareButton = ASButtonNode()
        
        super.init()
        
        likeButton.addTarget(self, action: #selector(likePressed), forControlEvents: .touchUpInside)
        
        self.automaticallyManagesSubnodes = true
    }
    @objc func likePressed(sender: ASButtonNode) {
        self.didLove?()
    }
    
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let likeStack = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [likeImg, likeText])
        
        let likeOverlay = ASOverlayLayoutSpec(child: likeStack, overlay: likeButton)
        
        //		likestack.style.preferredSize = CGSize(width: UIScreen.main.bounds.width/3, height: 15)
        
        let commentStack = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [commentImg, commentText])
        
        let commentOverlay = ASOverlayLayoutSpec(child: commentStack, overlay: self.commentButton)
        
        //		commentstack.style.preferredSize = CGSize(width: UIScreen.main.bounds.width/3, height: 15)
        
        let shareStack = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [shareImg, shareText])
        
        let shareOverlay = ASOverlayLayoutSpec(child: shareStack, overlay: shareButton)
        
        //		sharestack.style.preferredSize = CGSize(width: UIScreen.main.bounds.width/3, height: 15)
        
        
        let actionStack = ASStackLayoutSpec(direction: .horizontal, spacing: 30, justifyContent: .start, alignItems: .center, children: [likeOverlay,commentOverlay,shareOverlay])
        
        let actionInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0), child: actionStack)
        
        
        
        
        return actionInset
        
    }
    
}
