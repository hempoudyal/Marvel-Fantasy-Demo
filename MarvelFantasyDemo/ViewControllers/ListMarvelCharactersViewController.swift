//
//  ListMarvelCharactersViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit
import Kingfisher

class ListMarvelCharactersViewController: UIViewController {
    var mCharacters: [MarvelCharacter]?
    var dataSource: GenricCollectionViewDataSource<MarvelCharacter>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    func setCollectionView(){
        //Create a collection view
        let layout = UICollectionViewFlowLayout()
        
        let collectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: CellNames.homeCollectionViewCell, bundle: nil),
                                forCellWithReuseIdentifier: ReuseIdentifiers.homeCollectionReuseIdentifier)
        
        let config = MFantasyUIConfiguration()
        collectionView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        
        //Data source is passed to Reusable Collection Data Source
        let dataSource = GenricCollectionViewDataSource(models: mCharacters!,
                                                        reuseIdentifier: ReuseIdentifiers.homeCollectionReuseIdentifier)
        { (model, cell) in
            cell.configure(cornerRadius: 10)
            cell.mCharacterLabel.text = model.name
            if let imgPath = model.thumbnail.path, let ext = model.thumbnail.extensionImg{
                let img = imgPath + "." + ext
                cell.mCharacterImageView.kf.setImage(with: URL(string: img))
            }
        }
        
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        self.view.addSubview(collectionView)
    }
}

extension ListMarvelCharactersViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
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
        // space between two cell vertically
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
