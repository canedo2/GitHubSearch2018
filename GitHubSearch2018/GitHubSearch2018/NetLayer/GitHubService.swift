//
//  GitHubService.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 28/9/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import Foundation
import Alamofire

class GitHubService: GitHubServiceProtocol {
    
    let baseUrlString = "https://api.github.com/search/repositories?q="
    let optionsString = "&sort=stars&order=desc"
    
    var delegate: GitHubServiceDelegate?
    
    func requestRepositories(searchString: String?) {
        guard let searchString = searchString, searchString != "" else {
            return
        }
        
        let url = "\(baseUrlString)\(searchString)\(optionsString)"
        
        Alamofire.request(url).responseJSON { response in
            if let status = response.response?.statusCode {
                if status >= 200, status < 300 {
                    print("Request success: \(status)")
                    if let response = response.result.value as? [String:Any],
                        let items = response["items"] as? [Any] {
                        var itemsArray = [NetRepository]()
                        for item in items {
                            guard let item = item as? [String:Any] else {
                                self.delegate?.process(result: nil)
                                return
                            }
                            if let netRepo = NetRepository(dictionary: item) {
                                itemsArray.append(netRepo)
                            }
                        }
                        if itemsArray.count > 0 {
                            self.delegate?.process(result: itemsArray)
                        } else { self.delegate?.process(result: nil)}
                    }
                } else {
                    print("Resquest unsuccessful: \(status)")
                    self.delegate?.process(result: nil)
                }
            }
        }
    }
}
