//
//  SearchViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.02.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchController: UISearchController = {
       let searchController = UISearchController()
        
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationItem.searchController = searchController
        
    }
    



}
