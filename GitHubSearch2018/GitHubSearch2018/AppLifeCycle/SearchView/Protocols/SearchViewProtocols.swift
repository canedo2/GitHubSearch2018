//
//  SearchViewProtocols.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

protocol SearchControllerProtocol {
    var searchPresenter: SearchPresenterProtocol? { get set }
    func insert(repositories: [Repository]?)
}

protocol SearchPresenterProtocol {
    var searchController: SearchControllerProtocol { get set }
    func performSearch(string: String?)
}
