//
//  User.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/3/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

struct User {
    let username: String
    let userPhoto: UIImage
    let userheadline: String?
    
    static var user1: User {
        return User(username: "Salsabila Azaria", userPhoto: #imageLiteral(resourceName: "person.jpg"), userheadline: "Mobile Programmer Intern at DANA Indonesia")
    }
    
    static var user2: User {
        return User(username: "Marcellinus B D", userPhoto: #imageLiteral(resourceName: "person.jpg"), userheadline: "Code Instructor at KodeKiddo")
    }
    
    static var user3: User {
        return User(username: "David Setyawan",userPhoto: #imageLiteral(resourceName: "person.jpg"), userheadline: "Data Analyst at PT. APSI")
    }
    
    static var user4: User {
        return User(username: "Felicia Angeline", userPhoto: #imageLiteral(resourceName: "person.jpg"),userheadline: "Data Analyst at BCA")
    }
    
    static var user5: User {
        return User(username: "Rifqi Aditya", userPhoto: #imageLiteral(resourceName: "person.jpg"),userheadline: "Software Engineer Intern at PT Drife Solusi Integrasi")
    }
    
}

