//
//  UIConfiguration.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

//#06022F
class MFantasyUIConfiguration{
    let mainThemeBackgroundColor = "#06022F"
    let mainThemeForegroundColor = "#201C3D"
    let mainTextColor = "#D8D8D8"
    let mainButtonColor = "#546EE5"
    
    let statusBarStyle: UIStatusBarStyle = .default

    func configureUI() {
        UITabBar.appearance().barTintColor = UIColor.init(hexString: self.mainThemeBackgroundColor)
        UITabBar.appearance().tintColor =  UIColor.init(hexString: self.mainThemeForegroundColor)
        UITabBar.appearance().unselectedItemTintColor =  UIColor.init(hexString: self.mainTextColor)

        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar( UIColor.init(hexString: self.mainThemeBackgroundColor))

        UINavigationBar.appearance().barTintColor =  UIColor.init(hexString: self.mainThemeBackgroundColor)
        UINavigationBar.appearance().tintColor =  UIColor.init(hexString: self.mainThemeForegroundColor)
    }
}

