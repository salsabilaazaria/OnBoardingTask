////
////  PostViewModel.swift
////  SocialMediaOnboardingProject
////
////  Created by Salsabila Azaria on 3/6/21.
////  Copyright © 2021 salsabilaazaria. All rights reserved.
////
//
import Foundation
import RxSwift
import RxRelay

class PostViewModel {

//	var post: Post
	var posts: BehaviorRelay<[Post]> = BehaviorRelay(value: Post.createdummypost())
    
    init() {
        
    }
    
    var description: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
	
	func didLove(index: Int) {
		print("didlove ViewModel")
		var post = posts.value[index]
		let postLike = post.likeCount + 1
		post.likeCount = postLike
		
		var postsTemp = self.posts.value
		
		postsTemp[index] = post
		
		self.posts.accept(postsTemp)
		print("viewmodel")
		print(posts.value)
		
	}
    
    func addPost(){
        var addPost = Post(user: User.user1, timepost: "03/03/2021", likeCount: 0, commentCount: 0, description: self.description.value)
        
        var postsTemp = self.posts.value
        postsTemp.append(addPost)
        
       self.posts.accept(postsTemp)
        print(posts.value.count)
        
    }
    
  

}

