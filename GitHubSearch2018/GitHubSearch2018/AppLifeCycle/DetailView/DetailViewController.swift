//
//  DetailViewController.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import UIKit
import SwiftDate
import SafariServices

class DetailViewController: UIViewController {
    
    var item: Repository?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var browserButton: LargeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item?.name
        userImage.sd_setImage(with: item?.imageUrl, placeholderImage: UIImage(named: "placeholder"), options: [])
        userNameLabel.text = item?.user
        starsLabel.text = item?.stars.description
        forksLabel.text = item?.forks.description
        issuesLabel.text = item?.issues.description
        overviewLabel.text = item?.overview.description
        if let date = item?.date {
            dateLabel.text = "\(date.shortMonthName) \(date.day), \(date.year)"
        }
        
        browserButton.configure()
        
    }

    @IBAction func browserButtonTap(_ sender: Any) {
        if let url = item?.gitUrl {
            let safariController = SFSafariViewController(url: url)
            self.navigationController?.present(safariController, animated: true)
        }
        
    }
}
