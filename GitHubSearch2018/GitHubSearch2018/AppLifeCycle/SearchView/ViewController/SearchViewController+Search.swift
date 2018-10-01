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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showInfoIfNeeded()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchPresenter?.performSearch(string: searchBar.text)
        showInfoIfNeeded()
    }
}
