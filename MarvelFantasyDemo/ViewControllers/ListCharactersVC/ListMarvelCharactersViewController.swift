//
//  ListMarvelCharactersViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

class ListMarvelCharactersViewController: UIViewController {
    var mCharacters: [MarvelCharacter]?
    var dataSource: GenricCollectionViewDataSource<MarvelCharacter>?
    var titleText : String?
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    func setupLayout(){
        self.title = titleText
        
        //set activity indicator
        activityIndicator.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.minY + 50)
        activityIndicator.color = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.hidesWhenStopped = true
        
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
                cell.mCharacterImageView.kf.setImage(with: URL(string:img))
            }
        }
        
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        self.view.addSubview(collectionView)
    }
}
