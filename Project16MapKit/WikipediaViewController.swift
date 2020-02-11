//
//  WikipediaViewController.swift
//  Project16MapKit
//
//  Created by Ana Caroline de Souza on 11/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit
import WebKit

class WikipediaViewController: UIViewController {

    var webView : WKWebView!
    var capital : String?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let capital = capital else {return}
        
        webView.load(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/\(capital)")!))
        
        
    }
    

}
