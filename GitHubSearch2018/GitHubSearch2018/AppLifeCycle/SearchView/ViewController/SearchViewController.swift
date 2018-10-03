//
//  SearchViewController.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchControllerProtocol {
    var searchPresenter: SearchPresenterProtocol?
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var tableItems: [Repository]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchPresenter = SearchViewPresenter(controller: self, service: GitHubService(), transformer: RepositoryTransformer())
        
        self.title = NSLocalizedString("SEARCH_TITLE", comment: "")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        self.navigationItem.searchController = UISearchController(searchResultsController: nil);
        self.navigationItem.searchController?.delegate = self
        self.navigationItem.searchController?.searchBar.delegate = self
        self.navigationItem.hidesSearchBarWhenScrolling = false;
        
        self.searchPresenter?.performSearch(string: "swift")
        configureTableView()
    }
    
    func configureTableView() {
        tableView.rowHeight = 80
    }
    
    func showInfoIfNeeded() {
        if let items_count = tableItems?.count, items_count > 0 {
            infoLabel.text = ""
        } else {
            infoLabel.text = NSLocalizedString("SEARCH_NOT_FOUND", comment: "")
        }
    }
    
    func insert(repositories: [Repository]?) {
        tableItems = repositories
        showInfoIfNeeded()
        tableView.reloadData()
    }
}
