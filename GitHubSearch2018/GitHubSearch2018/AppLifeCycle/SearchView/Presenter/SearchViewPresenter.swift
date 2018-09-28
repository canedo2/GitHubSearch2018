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
    var gitHubService: GitHubServiceProtocol!
    var transformer = RepositoryTransformer()
    
    init(controller: SearchControllerProtocol) {
        self.searchController = controller
        defer {
            self.gitHubService = GitHubService(delegate: self)
        }
    }

    func performSearch(string: String?) {
        self.gitHubService.requestRepositories(string: string)
    }
    
    func process(result: [NetRepository]?) {
        self.searchController.insert(repositories: self.transformer.transform(from: result))
    }
    
}
