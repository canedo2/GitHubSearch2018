//
//  GitHubService.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation
class GitHubService: GitHubServiceProtocol {
    
    var delegate: GitHubServiceDelegate
    
    init(delegate: GitHubServiceDelegate){
        self.delegate = delegate
    }
    
    func requestRepositories(string: String?) {
        //TODO: REMOVE THIS
        let result = NetRepository.init(name: "Flutter",
                           user: "Flutter",
                           url: "https://github.com/flutter/flutter",
                           date: Date(),
                           stars: 3,
                           watchers: 56,
                           forks: 3,
                           description: "Flutter makes it easy and fast to build beautiful mobile apps.",
                           userImageUrl:"68747470733a2f2f666c75747465722e696f2f696d616765732f666c75747465722d6d61726b2d7371756172652d3130302e706e67")
        delegate.process(result: [result,result,result])
    }
    
    
}
