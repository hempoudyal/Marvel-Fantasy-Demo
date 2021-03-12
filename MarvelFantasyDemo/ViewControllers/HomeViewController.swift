//
//  HomeViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/11/21.
//

import UIKit

class HomeViewController: UIViewController{
  
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchHolderView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    func setUpLayout(){
        let config = MFantasyUIConfiguration()
        
        searchTextField.configure(placeHolderText: "Find your SuperHero", cornerRadius: 15)
        searchHolderView.configure(backgroundColor: UIColor(hexString: config.mainThemeBackgroundColor))
        searchButton.configureBtn(cornerRadius: 10)
        separatorView.configure(cornerRadius: 25)
        
        collectionView.register(UINib(nibName: "MCharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
    }
}

