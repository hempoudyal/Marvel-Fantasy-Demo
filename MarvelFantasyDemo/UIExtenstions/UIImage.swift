//
//  UIImage.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

extension UIImage {
    class func colorForNavBar(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
