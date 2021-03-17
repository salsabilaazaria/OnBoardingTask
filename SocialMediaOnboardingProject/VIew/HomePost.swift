//
//  HomePost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit


class HomePost: ASTableNode {
    
    var didLove: ((Int) -> Void)?
    var toDetail: ((Int)->Void)?
    
    private let posts: [Post]
    let postViewModel: PostViewModel
    
    
    
    
    init(viewModel: PostViewModel) {
        
        self.posts = viewModel.posts.value
        self.postViewModel = viewModel
        
        
        super.init(style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.view.separatorStyle = .singleLine
        self.view.separatorColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        self.style.width = ASDimension(unit: .fraction, value: 1)
        self.style.height = ASDimension(unit: .fraction, value: 1)
        
        self.style.flexShrink = 1
    }
}



extension HomePost: ASTableDataSource, ASTableDelegate{
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.posts.value.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        print("ngisi table")
        //ngisi tablr
        guard postViewModel.posts.value.count > indexPath.row else { return  ASCellNode() }
        
        let onePost = OnePost(viewModel: postViewModel, index: indexPath.row)
        
        
        return onePost
    }
    
    
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        //select one of cellnode
        tableNode.deselectRow(at: indexPath, animated: true)
        toDetail!(indexPath.row)
        
    }
    
    
    
}
