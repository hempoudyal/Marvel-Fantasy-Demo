//
//  HomeViewController+CollectionView.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/12/21.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Custom Marvel Characters
        return SuperHeroData.heroCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        let model = SuperHeroData.heroCharacters[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MCharacterCollectionViewCell
        cell.configure(cornerRadius: 10.0)
        cell.mCharacterLabel.text = model.name
        cell.mCharacterImageView.image = UIImage(named: model.thumbnail.path!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Give cell width and height
        let screenRect = UIScreen.main.bounds
        let cellwidth = (screenRect.size.width/2) - 40
        let cellHeight = cellwidth*1.3
        
        return CGSize(width: cellwidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Set Edge Insets
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        // splace between two cell vertically
        return 40
    }
}
