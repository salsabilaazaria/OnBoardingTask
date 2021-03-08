//
//  HomePost.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/4/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import AsyncDisplayKit


class HomePost: ASTableNode{
	
	private let posts: [Post]
	//    private let header :Header
	init(posts: [Post]) {
		print("HOMEPOSSTT")
		self.posts = posts
		
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
		return posts.count
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
		print("ngisi table")
		//ngisi table
		guard posts.count > indexPath.row else { return { ASCellNode() } }
		
		let post = posts[indexPath.row]
		
		// this may be executed on a background thread - it is important to make sure it is thread safe
		
		let cellNodeBlock = { () -> ASCellNode in
			print("return OnePost")
			return OnePost(post: post)
		}
	
		return cellNodeBlock
	}
	
	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		print("deselectRow")
		tableNode.deselectRow(at: indexPath, animated: true)
	}
}
