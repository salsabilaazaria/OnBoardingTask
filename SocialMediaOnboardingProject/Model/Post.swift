//
//  Post.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/3/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

struct Post{
	
	let user: User
	let timepost: String
	var likeCount: Int
	let commentCount: Int
	let description: String
	var indexPath: Int = -1
	
	internal static func createdummypost() -> [Post]{
		
		let post1 = Post(user: User.user1,
						 timepost: "01/03/2021" ,
						 likeCount: 2,
						 commentCount: 5,
						 description: "Congratulate salsa on her new job")
		
		let post2 = Post(user: User.user2,
						 timepost: "09/02/2021",
						 likeCount: 3,
						 commentCount: 4,
						 description: "View my verified achievement from Microsoft! The course is so easy to undestand. It is a really great course to join especially during this pandemic.")
		
		let post3 = Post(user: User.user3,
						 timepost: "31/12/2020" ,
						 likeCount: 3,
						 commentCount: 4,
						 description: "Starting 2021 with a new job.")
		
		let post4 = Post(user: User.user4,
						 timepost: "01/01/2021" ,
						 likeCount: 3,
						 commentCount: 4,
						 description: "Looking for RapidMinder course")
		
		let post5 = Post(user: User.user5,
						 timepost: "02/01/2021" ,
						 likeCount: 3,
						 commentCount: 4,
						 description: "Congratulate Rifqi on his new position at PT Drife Solusi Integrasi")
		
		
		
		return [post1]
	}
	
	
	
}
