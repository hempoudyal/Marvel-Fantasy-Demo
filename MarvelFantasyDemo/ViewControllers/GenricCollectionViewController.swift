//
//  GenricCollectionViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/13/21.
//

import UIKit

class GenricCollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource{
    typealias CellConfigurator = (Model, MCharacterCollectionViewCell) -> Void
    
    var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Custom models
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MCharacterCollectionViewCell
        cellConfigurator(model, cell )
        return cell
    }
    
    
}
