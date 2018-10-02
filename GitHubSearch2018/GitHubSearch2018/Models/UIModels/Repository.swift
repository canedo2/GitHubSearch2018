//
//  Repository.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

struct Repository {
    let name:String
    let overview:String
    let imageUrl:URL
    let user:String
    let gitUrl:URL
    let date:Date
    let stars:Int
    let forks:Int
    let issues:Int
}
