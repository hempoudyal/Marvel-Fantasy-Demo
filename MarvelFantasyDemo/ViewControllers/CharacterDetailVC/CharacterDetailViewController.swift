//
//  CharacterDetailViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    var characterDetail : MarvelCharacter?
    let config = MFantasyUIConfiguration()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        loadData()
    }
    
    func loadData(){
        characterImage.configure(cornerRadius: 10.0)
        if let imgPath = characterDetail!.thumbnail.path, let ext = characterDetail!.thumbnail.extensionImg{
            let img = imgPath + "." + ext
            characterImage.kf.setImage(with: URL(string: img))
        }
        
        characterTextView.text = "No Description"
        if let desc = characterDetail!.description{
            characterTextView.text = desc
        }
        
        characterTextView.textColor = UIColor.white
        characterTextView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        
        tableView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "storiesCell")
    }
    
}
