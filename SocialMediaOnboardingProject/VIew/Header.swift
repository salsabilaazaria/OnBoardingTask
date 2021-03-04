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
           profilePicture.style.preferredSize = CGSize(width: 40, height: 40)
//           profilePicture.cornerRadius = 32/2

           //bikin label name
            profileName = ASTextNode()
            profileName.attributedText = NSAttributedString(string: postheader.user.username)
            postdate = ASTextNode()
            postdate.attributedText = NSAttributedString(string: postheader.timepost)
//           profileName.attributedText = NSAttributedString.bold(postheader.user.username)

           //location optional ada atau gaada
            if let headline = postheader.user.userheadline {
               profileHeadline = ASTextNode()
               profileHeadline?.attributedText = NSAttributedString(string: headline)
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
        
        let textStack = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 2,
                                          justifyContent: .start,
                                          alignItems: .start,
                                          children: textStackComponents)
        
        let HeaderStack = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 2,
                                            justifyContent: .start,
                                            alignItems: .start,
                                            children: [profilePicture,textStack])
        
           let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 4, right: 8), child: HeaderStack)

        return padding

    }
    
}
