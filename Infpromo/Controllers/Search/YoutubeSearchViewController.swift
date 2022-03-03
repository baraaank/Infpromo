//
//  YoutubeSearchViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 28.02.2022.
//

import UIKit

class YoutubeSearchViewController: UIViewController {

    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "youtubeCell")
        tableView.backgroundColor = .yellow
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        addSubviews()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    


}

//Table View
extension YoutubeSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeCell", for: indexPath)
        
        return cell
    }
    
    
    
}

