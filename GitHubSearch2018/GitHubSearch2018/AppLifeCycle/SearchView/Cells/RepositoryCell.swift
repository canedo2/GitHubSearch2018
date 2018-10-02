//
//  RepositoryCell.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repositoryImage: UIImageView!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.repositoryName.text = "Title"
        self.repositoryOverview.text = "Flutter makes it easy and fast to build beautiful mobile apps."
        self.repositoryImage.image = UIImage(named: "flutter")
    }
    
    func configure(title: String, overview: String, imageURL: URL) {
        self.repositoryName.text = title
        self.repositoryOverview.text = overview
        self.repositoryImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
    }
    
}
