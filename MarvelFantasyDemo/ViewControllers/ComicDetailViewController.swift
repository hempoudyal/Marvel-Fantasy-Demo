//
//  ComicDetailViewController.swift
//  MarvelFantasyDemo
//
//  Created by Hem Poudyal on 3/14/21.
//

import UIKit
import WebKit

class ComicDetailViewController: UIViewController, WKNavigationDelegate{
    var linkUrl : linkURL?
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        let webV = WKWebView()
        webV.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        if let link = linkUrl?.url{
            webV.load(URLRequest(url: URL(string: link)!))
        }
        
        let uiConfig = MFantasyUIConfiguration()
        webV.backgroundColor = UIColor.init(hexString: uiConfig.mainThemeBackgroundColor)
        webV.navigationDelegate = self
        self.view.addSubview(webV)
        
        //set activity indicator
        activityIndicator.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.minY + 50)
        activityIndicator.color = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!){
        activityIndicator.stopAnimating()
    }

}
