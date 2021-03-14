//
//  CharacterDetailViewController+TableViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = comics?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell", for: indexPath) as! StoriesTableViewCell
        cell.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        cell.configureData(comic: comic!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120.0
    }

}
