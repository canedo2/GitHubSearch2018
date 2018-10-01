//
//  NetRepository.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

struct NetRepository {
    let name:String
    let owner:Owner
    let html_url:String
    let created_at:String
    let stargazers_count:Int
    let forks_count:Int
    let open_issues_count:Int
    let desc:String
    
    init?(dictionary: [String:Any]) {
        
        if let dName = dictionary["name"] as? String,
            let dOwner = dictionary["owner"] as? [String:Any],
            let dOwnerLogin = dOwner["login"] as? String,
            let dOwnerAvatar = dOwner["avatar_url"] as? String,
            let dUrl = dictionary["html_url"] as? String,
            let dDate = dictionary["created_at"] as? String,
            let dStars = dictionary["stargazers_count"] as? Int,
            let dForks = dictionary["forks_count"] as? Int,
            let dIssues = dictionary["open_issues_count"] as? Int,
            let dDescription = dictionary["description"] as? String {
                
                self.name = dName
                self.owner = Owner(login: dOwnerLogin, avatar_url: dOwnerAvatar)
                self.html_url = dUrl
                self.created_at = dDate
                self.stargazers_count = dStars
                self.forks_count = dForks
                self.open_issues_count = dIssues
                self.desc = dDescription
            
        } else { return nil }
        
    }
}

struct Owner {
    let login:String
    let avatar_url:String
}
