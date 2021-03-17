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
    var addButton: ASButtonNode
    var addPost: (() -> Void)?
    
    override init() {
        textInput = ASEditableTextNode()
        textInput.attributedPlaceholderText = NSAttributedString(string: "Type something here...")
        textInput.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8);
        textInput.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
        textInput.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textInput.borderWidth = 0.5
        
        addButton = ASButtonNode()
        
        addButton.setTitle( "Add Post", with: UIFont.systemFont(ofSize: 12, weight: .regular),with: .white, for: .normal)
        addButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        addButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8);
        
        
        super.init()
        self.style.width = ASDimension(unit: .fraction, value: 1)
        self.style.height = ASDimension(unit: .fraction, value: 1)
        self.style.flexShrink = 1
        self.automaticallyManagesSubnodes = true
        
        addButton.addTarget(self, action: #selector(addPostPressed), forControlEvents: .touchUpInside)
        
        
        
        
    }
    @objc func addPostPressed(sender: ASButtonNode) {
        self.addPost?()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let mainStack = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 5,
                                          justifyContent: .start,
                                          alignItems: .start,
                                          children: [textInput, addButton])
        
        let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 4, right: 8), child: mainStack)
        
        return padding
    }
    
}
