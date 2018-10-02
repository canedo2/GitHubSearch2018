//
//  ServiceProtocol.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation

protocol GitHubServiceProtocol {
    var delegate: GitHubServiceDelegate? { get set }
    func requestRepositories(searchString:String?)
}

protocol GitHubServiceDelegate {
    func process(result: [NetRepository]?)
}
