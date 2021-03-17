//
//  NSAttributedString+Extension.swift
//  SocialMediaOnboardingProject
//
//  Created by Salsabila Azaria on 3/5/21.
//  Copyright © 2021 salsabilaazaria. All rights reserved.
//

import UIKit

extension NSAttributedString {
    static func header(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        let boldString = NSAttributedString(string:text, attributes: attrs)
        
        return boldString
    }
    static func bold(_ text: String) -> NSAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .semibold)]
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

