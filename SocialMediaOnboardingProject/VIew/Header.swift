//
//  Header.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/3/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit

class Header: ASDisplayNode{
	
	private let postheader: Post
	private let profilePicture: ASImageNode
	private let profileName: ASTextNode
	private let profileHeadline: ASTextNode?
	
	private let postdate: ASTextNode
	
	init(post: Post) {
		self.postheader = post
		
		//buat foto dan di set ukurannya
		profilePicture = ASImageNode()
		profilePicture.image = postheader.user.userPhoto
		profilePicture.style.preferredSize = CGSize(width: 50, height: 50)
		//           profilePicture.cornerRadius = 32/2
		
		//bikin label name
		profileName = ASTextNode()
		profileName.attributedText = NSAttributedString.bold(postheader.user.username)
		
		
	
		
		postdate = ASTextNode()
		postdate.attributedText = NSAttributedString.subtitle(postheader.timepost)
		//           profileName.attributedText = NSAttributedString.bold(postheader.user.username)
		
		//location optional ada atau gaada
		if let headline = postheader.user.userheadline {
			profileHeadline = ASTextNode()
			profileHeadline?.attributedText = NSAttributedString.subtitle(headline)
		}else{
			profileHeadline = nil
		}
		
		super.init()
		
		// add the view to rootview, our supernode will automatically add the childnode when supernode detect that childnode will be added to the supernode.
		self.automaticallyManagesSubnodes = true
	}
	
	
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		
		var textStackComponents = [ASLayoutElement]()
		textStackComponents.append(profileName)
		
		if let profileHeadlinecheck = self.profileHeadline{
			textStackComponents.append(profileHeadlinecheck)
		}
		
		textStackComponents.append(postdate)
		
		let textStack = ASStackLayoutSpec(direction: .vertical,
										  spacing: 2,
										  justifyContent: .start,
										  alignItems: .start,
										  children: textStackComponents)
		
		let HeaderStack = ASStackLayoutSpec(direction: .horizontal,
											spacing: 2,
											justifyContent: .start,
											alignItems: .start,
											children: [profilePicture,textStack])
	
		return HeaderStack
		
	}
	
}
