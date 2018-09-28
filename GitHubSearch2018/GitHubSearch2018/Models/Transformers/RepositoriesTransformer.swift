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
            guard let url = URL(string: repoToProcess.userImageUrl) else {
                break
            }
            processedRepos.append(Repository(name: repoToProcess.name, overview: repoToProcess.description, imageUrl: url))
        }
        
        return processedRepos
    }
}
