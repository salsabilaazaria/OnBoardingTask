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
	var completionHandler: ((Int)->Void)?
	
	private let posts: [Post]
	let postViewModel: PostViewModel
	
    
    

	init(viewModel: PostViewModel) {
		print("HOMENODE")
	
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
		print("NUMBER OF SECTION")
		return 1
	}
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		print("postcount")
		return postViewModel.posts.value.count
	}
//	func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
//		print("ngisi table")
//		//ngisi table
//		guard posts.count > indexPath.row else { return { ASCellNode() } }
//		let post = posts[indexPath.row]
//		print(post.likeCount)
//
//		// this may be executed on a background thread - it is important to make sure it is thread safe
//		let cellNodeBlock = { () -> ASCellNode in
//			let onePost = OnePost(post: post)
//			onePost.didLove = {
//				self.didLove?(indexPath.row)
//			}
//			print(onePost.postlike.attributedText)
//			return onePost
//		}
//
//
//		return cellNodeBlock
//	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		print("ngisi table")
				//ngisi table
				guard postViewModel.posts.value.count > indexPath.row else { return  ASCellNode() }
				let post = postViewModel.posts.value[indexPath.row]
//				print(posts)
		

		print("LIKECOUNT : \(post.likeCount)")
		let onePost = OnePost(post: post)
		let like = post.likeCount

//		onePost.postlike.attributedText = NSAttributedString(string: "\(like) likes")
		onePost.didLove = {
			print("didlove homepost")
			self.didLove?(indexPath.row)
		}

		return onePost
	}
	
	
//    typealias CompletionHandler = (index: IndexPath) -> Void
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		print("deselectRow")
		tableNode.deselectRow(at: indexPath, animated: true)
	
        completionHandler!(indexPath.row)
     
	}
	
	

}
