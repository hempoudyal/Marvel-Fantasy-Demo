//
//  CharacterDetailViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    var characterDetail : MarvelCharacter?
    let config = MFantasyUIConfiguration()
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    var comics: [Comic]?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        setupUI()
        loadComicsData()
    }
    
    func setupUI(){
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
        
        //set activity indicator
        activityIndicator.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.minY + 50)
        activityIndicator.color = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.hidesWhenStopped = true
        
        //set tableview
        tableView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "storiesCell")
    }
    
    func loadComicsData(){
        activityIndicator.startAnimating()
        WebService.webRequest(.comics(id: String(characterDetail!.id))) { (response) in
            do{
                let m = try JSONDecoder().decode(ResponseComic.self, from: response)
                self.comics = m.data.results
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    if self.comics?.count == 0{
                        let dialogMessage = UIAlertController(title: "", message: "No Comics available.", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                            print("Ok button tapped")
                         })
                        dialogMessage.addAction(ok)
                        // Present alert to user
                        self.present(dialogMessage, animated: true, completion: nil)
                    } else {
                        self.tableView.reloadData()
                    }
                }
            } catch{
                //failed to parse
                print("Failed to parse")
            }
        } failureBlock: { (message) in
            print(message)
        }
    }
    
}
