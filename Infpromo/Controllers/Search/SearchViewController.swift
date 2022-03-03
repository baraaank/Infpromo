//
//  SearchViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.02.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Instagram", "Youtube", "Tiktok"])
        segmentedControl.sizeToFit()
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor().infpromo
        } else {
            segmentedControl.tintColor = UIColor().infpromo
        }
        
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor().infpromo], for: .normal)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor().infpromo.cgColor
        segmentedControl.sizeToFit()
        return segmentedControl
    }()
    
    
    private let searchController: UISearchController = {
        let searchController = UISearchController()
        
        return searchController
    }()
    
    lazy var instagramViewController: InstagramSearchViewController = {
        let vc = InstagramSearchViewController()
        addChildViewController(childViewController: vc)
        return vc
    }()
    
    lazy var youtubeViewController: YoutubeSearchViewController = {
        let vc = YoutubeSearchViewController()
        addChildViewController(childViewController: vc)
        return vc
    }()
    
    lazy var tiktokViewController: TiktokSearchViewController = {
        let vc = TiktokSearchViewController()
        addChildViewController(childViewController: vc)
        return vc
    }()
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.titleView = segmentedControl
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        
        navigationController?.navigationBar.tintColor = UIColor().infpromo
        
        
        searchController.delegate = self
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        segmentedControl.selectedSegmentIndex = 0
        instagramViewController.didMove(toParent: self)
    }
    
    private func addChildViewController(childViewController: UIViewController) {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
        blurEffectView.isHidden = true
    }
    
    @objc func segmentedControlTapped() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            youtubeViewController.view.removeFromSuperview()
            tiktokViewController.view.removeFromSuperview()
            youtubeViewController.removeFromParent()
            tiktokViewController.removeFromParent()
            instagramViewController.didMove(toParent: self)
            addChildViewController(childViewController: instagramViewController)
        case 1:
            instagramViewController.view.removeFromSuperview()
            tiktokViewController.view.removeFromSuperview()
            instagramViewController.removeFromParent()
            tiktokViewController.removeFromParent()
            youtubeViewController.didMove(toParent: self)
            addChildViewController(childViewController: youtubeViewController)
        case 2:
            instagramViewController.view.removeFromSuperview()
            youtubeViewController.view.removeFromSuperview()
            instagramViewController.removeFromParent()
            youtubeViewController.removeFromParent()
            tiktokViewController.didMove(toParent: self)
            addChildViewController(childViewController: tiktokViewController)
        default:
            print("errorrrrr")
        }
    }
     
}

extension SearchViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        tabBarController?.tabBar.isHidden = true
        blurEffectView.isHidden = false
    }


    func willDismissSearchController(_ searchController: UISearchController) {
        tabBarController?.tabBar.isHidden = false
        blurEffectView.isHidden = true
    }
}
