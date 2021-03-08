//
//  NSAttributedString+Extension.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

extension NSAttributedString {
    static func bold(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-Medium", size: 14)!]
        let boldString = NSAttributedString(string:text, attributes: attrs)
        
        return boldString
    }
    
    static func normal(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular)]
        let string = NSAttributedString(string:text, attributes: attrs)
        
        return string
    }
    
    static func subtitle(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 10, weight: .light)]
        let string = NSAttributedString(string:text, attributes: attrs)
        
        return string
    }
}

