//
//  UIView.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

extension UIView{
    
    func configure(cornerRadius: CGFloat = 0.0,
                   backgroundColor: UIColor = .white){
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
    }
    
}
