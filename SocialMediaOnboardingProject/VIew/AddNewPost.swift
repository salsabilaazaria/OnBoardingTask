//
//  AddNewPost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit


class AddNewPost: ASDisplayNode{
	
	var textInput: ASEditableTextNode

    override init() {
        textInput = ASEditableTextNode()
        textInput.attributedPlaceholderText = NSAttributedString(string: "Type something here...")
        textInput.textContainerInset = UIEdgeInsets(top: UIScreen.main.bounds.height/8 , left: 8, bottom: 8, right: 8);
        
	
        super.init()
        self.style.width = ASDimension(unit: .fraction, value: 1)
        self.style.height = ASDimension(unit: .fraction, value: 1)
        self.style.flexShrink = 1
        self.automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let mainStack = ASStackLayoutSpec(direction: .vertical,
                spacing: 0,
                justifyContent: .start,
                alignItems: .start,
                children: [textInput])

        let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 4, right: 8), child: textInput)

        return padding
    }
	
}
