//
//  StoriesTableViewCell.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

class StoriesTableViewCell: UITableViewCell{
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var customBackgroundView: UIView!
    
    
    func configureData(comic: Comic){
        let uiConfig = MFantasyUIConfiguration()
        
        titleLabel.textColor = UIColor.white
        titleLabel.text = comic.title
        customBackgroundView.configure(cornerRadius: 10.0, backgroundColor: UIColor(hexString: uiConfig.mainThemeForegroundColor))
        thumbnail.configure(cornerRadius: 10, backgroundColor: UIColor.gray)
  
        if let imageUrl = comic.thumbnail.path{
            if let ext = comic.thumbnail.extensionImg{
                let imageString = imageUrl + "." + ext
                thumbnail.kf.setImage(with: URL(string:imageString))
            }
        }
    }
}
