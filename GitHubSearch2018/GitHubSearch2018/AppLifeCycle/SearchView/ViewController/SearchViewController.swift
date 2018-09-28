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
    
    @IBOutlet weak var tableView: UITableView!
    var tableItems: [Repository]? = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchPresenter = SearchViewPresenter(controller: self)
        
        self.title = "Repository search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        self.navigationItem.searchController = UISearchController(searchResultsController: nil);
        self.navigationItem.searchController?.delegate = self
        self.navigationItem.searchController?.searchBar.delegate = self
        self.navigationItem.hidesSearchBarWhenScrolling = false;
        
        configureTableView()
    }
    
    func configureTableView() {
        tableView.rowHeight = 80
    }
    
    func insert(repositories: [Repository]?) {
        tableItems = repositories
        tableView.reloadData()
    }
}
