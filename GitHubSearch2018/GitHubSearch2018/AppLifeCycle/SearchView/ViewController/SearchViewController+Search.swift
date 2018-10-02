//
//  SearchViewController+Search.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UISearchControllerDelegate {

}

extension SearchViewController: UISearchBarDelegate {    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchPresenter?.performSearch(string: searchBar.text)
        self.navigationItem.searchController?.isActive = false
    }
}
