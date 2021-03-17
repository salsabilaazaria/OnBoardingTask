//
//  OnePost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class OnePost: ASCellNode{
    
    
    let header: Header
    let postdesc: ASTextNode
    let postlike: ASTextNode
    let postcomment: ASTextNode
    let action: ActionPost
    
    
    let postViewModel: PostViewModel
    let disposeBag: DisposeBag
    let index: Int
    
    
    init(viewModel: PostViewModel, index: Int) {
        
        self.postViewModel = viewModel
        self.index = index
        self.header = Header(post: postViewModel.posts.value[index])
        self.action = ActionPost()
        self.disposeBag = DisposeBag()
        
        postdesc = ASTextNode()
        postdesc.attributedText = NSAttributedString.normal(postViewModel.posts.value[index].description)
        
        postlike = ASTextNode()
        let likecount = "\(postViewModel.posts.value[index].likeCount) likes"
        postlike.attributedText = NSAttributedString.bold(likecount)
        
        postcomment = ASTextNode()
        let commentcount = "\(postViewModel.posts.value[index].commentCount) comments"
        postcomment.attributedText = NSAttributedString.bold(commentcount)
        
        
        super.init()
        
        observePostValue()
        configurePostNode()
        
        self.automaticallyManagesSubnodes = true
    }
    
    private func observePostValue() {
        
        postViewModel.posts.asObservable()
            .subscribe(onNext: { [weak self] posts in
                guard let `self` = self else {
                    
                    return
                }
                
                DispatchQueue.main.async {
                    self.postlike.attributedText = NSAttributedString.bold("\(self.postViewModel.posts.value[self.index].likeCount) likes")
                    
                }
                
                
            }).disposed(by: disposeBag)
    }
    
    private func configurePostNode() {
        print("configurepostnode detail")
        
        action.didLove = { [weak self]  in
            guard let `self` = self else {
                return
            }
            
            self.postViewModel.didLove(index: self.index)
        }
    }
    
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        print("ONEPOST")
        
        let likecommentcounterStack = ASStackLayoutSpec(direction: .horizontal,
                                                        spacing: 5,
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
