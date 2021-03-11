//
//  UITextField.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

extension UITextField{
    func configure(textColor: UIColor = .white,
                   placeHolderColor: UIColor = .lightGray,
                   placeHolderText: String = "placeholder",
                   cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.textColor = textColor
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                     attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
}
