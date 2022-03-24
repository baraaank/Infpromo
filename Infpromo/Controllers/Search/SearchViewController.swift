

import UIKit

class SearchViewController: UIViewController {
    
    private let searchBar: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.placeholder = "Influencer Ara"
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        customView.backgroundColor = .clear
        let customImageView = UIImageView()
        customImageView.frame = CGRect(x: 5, y: 20, width: 30, height: 20)
        let customImage = UIImage(systemName: "magnifyingglass")
        customImageView.tintColor = UIColor().infpromo
        customImageView.contentMode = .scaleAspectFit
        customImageView.image = customImage
        customImageView.backgroundColor = .clear
        customView.addSubview(customImageView)
        textField.leftView = customView
//        textField.delegate = self
        
        textField.leftViewMode = .always
        return textField
    }()
    
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Instagram", "Youtube", "Tiktok"])
        
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
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        return segmentedControl
    }()
    
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .clear
        pageControl.currentPageIndicatorTintColor = UIColor().infpromo
        pageControl.pageIndicatorTintColor = .systemGray4
        
        return pageControl
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray4
        //        scrollView.showsHorizontalScrollIndicator = false
        //        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstDidMove()
        
        
        addSubviews()
        
        view.backgroundColor = .white
        
        
        
        
        
        
        
        
    }
    
    func addSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(searchBar)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentedControl.frame = CGRect(x: 30, y: 40, width: view.width - 60, height: 30)
        searchBar.frame = CGRect(x: 20, y: segmentedControl.bottom + 20, width: view.width - 40, height: 40)
    }
    
    func firstDidMove() {
        addChildViewController(childViewController: instagramViewController)
        
    }
    
    
    private func addChildViewController(childViewController: UIViewController) {
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = CGRect(x: 0, y: 120, width: view.width, height: view.height - 70)
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        
    }
    
    
    @objc func segmentedControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            youtubeViewController.view.removeFromSuperview()
            tiktokViewController.view.removeFromSuperview()
            youtubeViewController.removeFromParent()
            tiktokViewController.removeFromParent()
            instagramViewController.didMove(toParent: self)
            addChildViewController(childViewController: instagramViewController)
            print("0")
        case 1:
            instagramViewController.view.removeFromSuperview()
            tiktokViewController.view.removeFromSuperview()
            instagramViewController.removeFromParent()
            tiktokViewController.removeFromParent()
            youtubeViewController.didMove(toParent: self)
            addChildViewController(childViewController: youtubeViewController)
            print("1")
        case 2:
            instagramViewController.view.removeFromSuperview()
            youtubeViewController.view.removeFromSuperview()
            instagramViewController.removeFromParent()
            youtubeViewController.removeFromParent()
            tiktokViewController.didMove(toParent: self)
            addChildViewController(childViewController: tiktokViewController)
            print("2")
        default:
            print("errorrrrr")
        }
    }
    
    
    
    
    
}



