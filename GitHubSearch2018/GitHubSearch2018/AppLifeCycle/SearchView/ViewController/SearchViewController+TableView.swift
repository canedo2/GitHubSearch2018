//
//  SearchViewController+TableView.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation
import UIKit
//import SDWebImage

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell") as? RepositoryCell else {
            print("Cell creation error")
            return UITableViewCell()
        }
        
        let item = tableItems![indexPath.row]
        //cell.repositoryImage.sd_setImage(with: item.imageUrl, placeholderImage: UIImage(named: "github-image"))
        cell.repositoryName.text = item.name
        cell.repositoryOverview.text = item.overview
        return cell
    }
    
}
