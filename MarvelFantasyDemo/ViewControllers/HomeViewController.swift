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
    @IBOutlet weak var separatorView: UIView!
    
    override func viewDidLoad() {
        searchTextField.configure(placeHolderText: "Find your SuperHero", cornerRadius: 15)
        searchButton.configure(cornerRadius: 10)
        separatorView.configure(cornerRadius: 25)
    }
    
}
