//
//  RepositoryCell.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repositoryImage: UIImageView!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.repositoryName.text = "Flutter"
        self.repositoryOverview.text = "Flutter makes it easy and fast to build beautiful mobile apps."
        self.repositoryImage.image = UIImage(named: "flutter")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
