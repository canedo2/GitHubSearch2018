//
//  RepositoriesTransformer.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

class RepositoryTransformer {
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()
    
    func transform(from netRepositories:[NetRepository]?) -> [Repository]? {
        
        guard let reposToProcess = netRepositories, !reposToProcess.isEmpty else {
            return nil
        }
        
        var processedRepos = [Repository]()
        
        for repoToProcess in reposToProcess {
            guard let imageUrl = URL(string: repoToProcess.owner.avatar_url), let gitUrl = URL(string: repoToProcess.html_url), let date = RepositoryTransformer.dateFormatter.date(from: repoToProcess.created_at) else {
                break
            }
            
            processedRepos.append(Repository(name: repoToProcess.name,
                                             overview: repoToProcess.desc,
                                             imageUrl: imageUrl, user: repoToProcess.owner.login,
                                             gitUrl: gitUrl,
                                             date: date,
                                             stars: repoToProcess.stargazers_count,
                                             forks: repoToProcess.forks_count,
                                             issues: repoToProcess.open_issues_count))
        }
        
        return processedRepos
    }
}
