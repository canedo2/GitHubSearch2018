//
//  LargeButton.swift
//  GitHubSearch2018
//
//  Created by Diego Manuel Molina Canedo on 3/10/18.
//  Copyright © 2018 dmmc. All rights reserved.
//

import UIKit

class LargeButton: UIButton {
    
    let normalBackgroundColor = UIColor(named: "custom-gray")?.cgColor
    let highlightedBackgroundColor = UIColor.darkGray.cgColor
    
    func configure() {
        self.layer.backgroundColor = UIColor(named: "custom-gray")?.cgColor
        self.layer.cornerRadius = 4.0
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        UIView.animate(withDuration: 0.2) {
            self.layer.backgroundColor = self.highlightedBackgroundColor
        }
        super.touchesBegan(touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        UIView.animate(withDuration: 0.2) {
            self.layer.backgroundColor = self.normalBackgroundColor
        }
        super.touchesEnded(touches, with: event)
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        UIView.animate(withDuration: 0.2) {
            self.layer.backgroundColor = self.normalBackgroundColor
        }
        super.touchesCancelled(touches, with: event)
    }

}
