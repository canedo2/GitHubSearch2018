//
//  RepositoriesTransformer.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

class RepositoryTransformer {
    func transform(from netRepositories:[NetRepository]?) -> [Repository]? {
        
        guard let reposToProcess = netRepositories, !reposToProcess.isEmpty else {
            return nil
        }
        
        var processedRepos = [Repository]()
        
        for repoToProcess in reposToProcess {
            guard let url = URL(string: repoToProcess.owner.avatar_url) else {
                break
            }
            
            //TODO: Process Date
            processedRepos.append(Repository(name: repoToProcess.name,
                                             overview: repoToProcess.desc,
                                             imageUrl: url, user: repoToProcess.owner.login,
                                             gitUrl: repoToProcess.html_url,
                                             date: Date(),
                                             stars: repoToProcess.stargazers_count,
                                             forks: repoToProcess.forks_count,
                                             issues: repoToProcess.open_issues_count))
        }
        
        return processedRepos
    }
}
