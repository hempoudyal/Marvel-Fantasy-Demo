//
//  UIButton.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

extension UIButton{
    
    func configure(titleColor: UIColor = .white,
                   cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.setTitleColor(titleColor, for: .normal)
    }
    
}
