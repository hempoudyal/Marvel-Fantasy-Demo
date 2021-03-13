//
//  CharacterDetailViewController+TableViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //       let event = eventArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath) as! StoriesTableViewCell
        cell.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
//        cell.textLabel?.text = event.title
//        if let imageUrl = event.thumbnail?.path{
//            if let ext = event.thumbnail?.extensionImg{
//                let imageString = imageUrl + "." + ext
//                cell.imageView?.sd_setImage(with: URL(string:imageString))
//            }
//        }
        return cell
    }

}
