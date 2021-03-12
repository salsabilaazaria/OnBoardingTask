//
//  OnePost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class OnePost: ASCellNode{
	var didLove: (() -> Void)?
	
	let post: Post
	
	let header: Header
	let postdesc: ASTextNode
	let postlike: ASTextNode
	let postcomment: ASTextNode
	let action: ActionPost
	let seperator: ASDisplayNode

	
	init(post: Post) {
		
		print("ONEPOST")
		self.post = post
        self.header = Header(post: post)
        self.action = ActionPost()
		
		postdesc = ASTextNode()
		postdesc.attributedText = NSAttributedString.normal(post.description)
		
		postlike = ASTextNode()
		let likecount = "\(post.likeCount) likes"
		postlike.attributedText = NSAttributedString(string: likecount)
		
		postcomment = ASTextNode()
		let commentcount = "\(post.commentCount) comments"
		postcomment.attributedText = NSAttributedString.normal(commentcount)
		
		seperator = ASDisplayNode()
       
		super.init()
		
		action.didLove = {
			print("didlove onepost")
			self.didLove?()
		}
		
		self.automaticallyManagesSubnodes = true
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		print("ONEPOST")
		
		let likecommentcounterStack = ASStackLayoutSpec(direction: .horizontal,
														spacing: 2,
														justifyContent: .start,
														alignItems: .start,
														children: [postlike, postcomment])
		

		
		let postpadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0), child: postdesc)
		
		let mainstack = ASStackLayoutSpec(direction: .vertical,
										  spacing: 0,
										  justifyContent: .start,
										  alignItems: .start,
										  children: [header, postpadding, likecommentcounterStack, action ])
		
		
		
		let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 6, bottom: 10, right: 6), child: mainstack)
		
		return padding
	}
	
	
	
	
}
