//
//  HomeViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: 240, height: 2400)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let mostVisitedReportsLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Bu ay en çok ziyaret edilen raporlar", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let mostVisitedReportsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalWidth(0.75))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 8
            section.orthogonalScrollingBehavior = .continuous
            return section
        }))
        
        collectionView.register(MostVisitedReportsCollectionViewCell.self, forCellWithReuseIdentifier: MostVisitedReportsCollectionViewCell.reuseIdentifier)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let searchResultCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))

            let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: SearchResultCollectionReusableView.kind, alignment: .bottom)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            section.boundarySupplementaryItems = [footerView]
            return section
        }))
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.reuseIdentifier)
        collectionView.register(SearchResultCollectionReusableView.self, forSupplementaryViewOfKind: SearchResultCollectionReusableView.kind, withReuseIdentifier: SearchResultCollectionReusableView.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let accountCountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "\"123423\" hesap bulundu.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        return tableView
    }()
    
    let customView: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = CGSize(width: 120, height: 36)
        view.backgroundColor = UIColor().infpromo
        view.layer.cornerRadius = 4
        return view
    }()
    
    let customLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 3, width: 120, height: 30))
        
        
        label.attributedText = NSAttributedString(string: "Rapor: 10", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.white])
        label.numberOfLines = 0
        return label
    }()
    
    let customImageView: UIImageView = {
        let image = UIImage(systemName: "doc", withConfiguration: UIImage.SymbolConfiguration.init(weight: .bold))
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor.white
        
        imageView.frame = CGRect(x: 95, y: 6, width: 22, height: 22)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Infpromo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        
        view.backgroundColor = .white
        addSubviews()
        
        customView.addSubview(customLabel)
        customView.addSubview(customImageView)
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration.init(weight: .bold)), style: .done, target: self, action: #selector(searchButtonClicked))
        searchButton.tintColor = UIColor().infpromo
//        let remainingNumberOfReports = UIBarButtonItem(image: UIImage(systemName: "bubble.left"), style: .done, target: self, action: #selector(remainingNumberOfReportsClicked))
        let remainingCredits = UIBarButtonItem(customView: customView)
        
        navigationItem.rightBarButtonItem = searchButton
        
        navigationItem.leftBarButtonItem = remainingCredits
        
        
        
        mostVisitedReportsCollectionView.delegate = self
        mostVisitedReportsCollectionView.dataSource = self
        
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
           
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mostVisitedReportsLabel)
        scrollView.addSubview(mostVisitedReportsCollectionView)
        scrollView.addSubview(accountCountLabel)
        scrollView.addSubview(searchResultCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        mostVisitedReportsLabel.frame = CGRect(x: 8, y: scrollView.top + 10, width: view.width, height: 20)
        mostVisitedReportsCollectionView.frame = CGRect(x: 0, y: mostVisitedReportsLabel.bottom + 10, width: scrollView.width, height: scrollView.width * 0.75)
        accountCountLabel.frame = CGRect(x: 8, y: mostVisitedReportsCollectionView.bottom + 10, width: view.width, height: 20)
        searchResultCollectionView.frame = CGRect(x: 0, y: accountCountLabel.bottom + 10, width: view.width, height: searchResultCollectionView.contentSize.height + 20)
        scrollView.contentSize = CGSize(width: view.width, height: mostVisitedReportsLabel.height + mostVisitedReportsCollectionView.height + accountCountLabel.height + searchResultCollectionView.height + 40)
    }
    
    @objc func remainingNumberOfReportsClicked() {
        
    }
    
    @objc func searchButtonClicked() {
        let vc = SearchViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
        
}

//UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.searchResultCollectionView {
            return 12
        } else {
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mostVisitedReportsCollectionView {
            //Most visited reports cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostVisitedReportsCollectionViewCell.reuseIdentifier, for: indexPath)
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor().infpromoBorder.cgColor
            
            cell.layer.borderWidth = 1
            return cell
        } else {
            //Search result reports cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.reuseIdentifier, for: indexPath)
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor().infpromoBorder.cgColor
            cell.layer.borderWidth = 1
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == self.searchResultCollectionView {
            if kind == SearchResultCollectionReusableView.kind {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: SearchResultCollectionReusableView.kind, withReuseIdentifier: SearchResultCollectionReusableView.reuseIdentifier, for: indexPath) as! SearchResultCollectionReusableView
                
                return footer
            } else {
                fatalError()
            }
        } else {
            fatalError()
        }
        
    }
    
    
}

