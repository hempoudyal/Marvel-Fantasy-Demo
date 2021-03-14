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
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var mCharacters: [MarvelCharacter]?
    var dataSource: GenricCollectionViewDataSource<MarvelCharacter>?
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    var selectedTitle : String?
    var searchButtonClicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }
    
    func setUpLayout(){
        let config = MFantasyUIConfiguration()
        
        //configure view
        searchTextField.configure(placeHolderText: "Find your SuperHero", cornerRadius: 15)
        searchHolderView.configure(backgroundColor: UIColor(hexString: config.mainThemeBackgroundColor))
        searchButton.configureBtn(cornerRadius: 10)
        separatorView.configure(cornerRadius: 25)
        
        //set activity indicator
        activityIndicator.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.minY + 50)
        activityIndicator.color = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.hidesWhenStopped = true
        
        collectionViewHeight.constant = (self.view.frame.width/2 - 30) * 2.6 + 100 //height based on cells
        collectionView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        setCollectionView()
        
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if !searchButtonClicked {
            if searchTextField.text?.isEmpty ?? true {
                return
            } else {
                let param : [String: Any] = ["nameStartsWith": searchTextField.text!]
                self.selectedTitle = searchTextField.text!
                requestData(param: param)
                searchButtonClicked = true
            }
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
    
    func requestData(param: [String: Any]){
        activityIndicator.startAnimating()
        WebService.webRequest(.getCharacters,
                              parameters: param)
        { (response) in
            self.searchButtonClicked = false
            do{
                let m = try JSONDecoder().decode(Response.self, from: response)
                self.mCharacters = m.data.results
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    if self.mCharacters?.count != 0{
                        self.searchTextField.text = ""
                        self.navigateToListView()
                    } else {
                        alertUser(viewController: self, title: "Character not found", message: "Try with other chracters from Marvel Universe")
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
    
    func navigateToListView(){
        let listMarvel = ListMarvelCharactersViewController()
        listMarvel.titleText = selectedTitle?.capitalized
        listMarvel.mCharacters =  self.mCharacters
        self.navigationController?.pushViewController(listMarvel, animated: true)
    }
    
}

