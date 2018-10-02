//
//  SearchViewPresenter.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

class SearchViewPresenter: SearchPresenterProtocol, GitHubServiceDelegate {
    
    var searchController: SearchControllerProtocol
    var gitHubService: GitHubServiceProtocol
    var transformer = RepositoryTransformer()
    
    init(controller: SearchControllerProtocol,service: GitHubServiceProtocol, transformer: RepositoryTransformer) {
        self.searchController = controller
        self.gitHubService = service
        self.transformer = transformer
        
        self.gitHubService.delegate = self
    }

    func performSearch(string: String?) {
        self.gitHubService.requestRepositories(searchString: string)
    }
    
    func process(result: [NetRepository]?) {
        let processedRepos = self.transformer.transform(from: result)
        DispatchQueue.main.async {
            self.searchController.insert(repositories: processedRepos)
        }
    }
}
