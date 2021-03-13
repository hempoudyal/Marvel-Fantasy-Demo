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
    var mCharacters = [MarvelCharacter]()
    var dataSource: GenricCollectionViewDataSource<MarvelCharacter>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    func setUpLayout(){
        let config = MFantasyUIConfiguration()
        
        //configure view
        searchTextField.configure(placeHolderText: "Find your SuperHero", cornerRadius: 15)
        searchHolderView.configure(backgroundColor: UIColor(hexString: config.mainThemeBackgroundColor))
        searchButton.configureBtn(cornerRadius: 10)
        separatorView.configure(cornerRadius: 25)
        
        collectionView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        setCollectionView()
        
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if searchTextField.text?.isEmpty ?? true {
            return
        } else {
            let param : [String: Any] = ["nameStartsWith": searchTextField.text!]
            parseResponse(param: param)
        }
    }
    
    func setCollectionView(){
        collectionView.register(UINib(nibName: CellNames.homeCollectionViewCell, bundle: nil),
                                forCellWithReuseIdentifier: ReuseIdentifiers.homeCollectionReuseIdentifier)
        //Flow layout for sizes
        let layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        //Data source is passed to Reusable Collection Data Source
        let dataSource = GenricCollectionViewDataSource(models: SuperHeroData.heroCharacters,
                                                        reuseIdentifier: ReuseIdentifiers.homeCollectionReuseIdentifier)
        { (model, cell) in
            cell.configure(cornerRadius: 10)
            cell.mCharacterLabel.text = model.name
            cell.mCharacterImageView.image = UIImage(named: model.thumbnail.path!)
        }
        
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
    }
    
    func parseResponse(param: [String: Any]){
        WebService.webRequest(.getCharacters,
                              parameters: param)
        { (response) in
            
            do{
                let m = try JSONDecoder().decode(Response.self, from: response)
                print(m.data.results)
                
            } catch{
                //failed to parse
            }
            
        } failureBlock: { (message) in
            print(message)
        }
    }
    
}

