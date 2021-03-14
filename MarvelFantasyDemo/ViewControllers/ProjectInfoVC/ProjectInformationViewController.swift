//
//  ProjectInformationViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/14/21.
//

import UIKit

class ProjectInformationViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    let config = MFantasyUIConfiguration()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        infoLabel.text = appMessages.infoProduct
        infoLabel.textColor = UIColor.init(hexString: config.mainTextColor)
        self.view.backgroundColor = UIColor.init(hexString: config.mainThemeBackgroundColor)
        
        //set tableview
        tableView.backgroundColor = UIColor(hexString: config.mainThemeBackgroundColor)
        tableView.register(UINib(nibName: CellNames.projectFeatureTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.projectFeatureReuseIdentifier)
    }
}

extension ProjectInformationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductData.infoFeatureList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let featureText = ProductData.infoFeatureList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.projectFeatureReuseIdentifier, for: indexPath) as! ProjectFeatureTableViewCell
        cell.backgroundColor = UIColor.init(hexString: config.mainThemeBackgroundColor)
        cell.featureInfoLabel.textColor = UIColor.init(hexString: config.mainTextColor)
        cell.featureInfoLabel.text = featureText
        cell.labelBackgroundView.configure(cornerRadius: 10.0, backgroundColor: UIColor.init(hexString: config.mainThemeForegroundColor))
        cell.selectionStyle = .none
        return cell
    }
    
}

