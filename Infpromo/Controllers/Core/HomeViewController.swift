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
        label.attributedText = NSAttributedString(string: "Bu ay en çok ziyaret edilen raporlar", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .systemGray6
        return label
    }()
    
    private let mostVisitedReportsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.6))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.40), heightDimension: .fractionalWidth(0.65))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 8
            section.orthogonalScrollingBehavior = .continuous
            return section
        }))
        
        collectionView.register(MostVisitedReportsCollectionViewCell.self, forCellWithReuseIdentifier: MostVisitedReportsCollectionViewCell.reuseIdentifier)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .systemGray6
//        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let searchResultCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
                
            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))

            let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: SearchResultCollectionReusableView.kind, alignment: .bottom)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            section.boundarySupplementaryItems = [footerView]
            
            return section
        }))
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.reuseIdentifier)
        collectionView.register(SearchResultCollectionReusableView.self, forSupplementaryViewOfKind: SearchResultCollectionReusableView.kind, withReuseIdentifier: SearchResultCollectionReusableView.reuseIdentifier)
//        collectionView.backgroundColor = .white
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    private let accountCountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "\"123423\" hesap bulundu.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .systemGray6
        return label
    }()
    
    private let filterButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.imageView?.tintColor = UIColor().infpromo
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        return tableView
    }()
    
    let customView: UIView = {
        let view = UIView(frame: .zero)
        view.frame.size = CGSize(width: 120, height: 36)
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 4
        return view
    }()
    
    let customLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 260, y: 8, width: 120, height: 30))
        label.attributedText = NSAttributedString(string: "Rapor: 10", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.numberOfLines = 0
        label.textColor = UIColor().infpromo
        return label
    }()
    
    let customImageView: UIImageView = {
        let image = UIImage(systemName: "doc", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor().infpromo
        
        imageView.frame = CGRect(x: 340, y: 12, width: 22, height: 22)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var mostViewedArray: [MostViewedProfileData] = []
    var viewCountArray: [Int] = []
    
    var directProfileResponseArray: [DirectProfileResponse] = []
    
    
    var searchByFilterResultArray: [SearchWithFilterCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
//        title = "Infpromo"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        
        view.backgroundColor = .white
        addSubviews()

        customView.addSubview(customLabel)
        customView.addSubview(customImageView)
        
//        let searchButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium)), style: .done, target: self, action: #selector(searchButtonClicked))
//        searchButton.tintColor = UIColor().infpromo
////        searchButton.tintColor = .black
////        let remainingNumberOfReports = UIBarButtonItem(image: UIImage(systemName: "bubble.left"), style: .done, target: self, action: #selector(remainingNumberOfReportsClicked))
//        let remainingCredits = UIBarButtonItem(customView: customView)
//
////        navigationItem.rightBarButtonItem = searchButton
//
//        navigationItem.leftBarButtonItem = remainingCredits
////        navigationController?.navigationBar.barTintColor = .white
////
////        navigationController?.navigationBar.isTranslucent = true
////        navigationController?.navigationBar.tintColor = .white
//
        
        let logoImage = UIImage.init(named: "LogoPng")
                let logoImageView = UIImageView.init(image: logoImage)
                logoImageView.frame = CGRect(x: 10, y: 5, width: 150, height: 35)
                logoImageView.contentMode = .scaleAspectFit
//                let imageItem = UIBarButtonItem.init(customView: logoImageView)
                let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                negativeSpacer.width = -25
//                self.navigationItem.leftBarButtonItems = [negativeSpacer,imageItem]
        navigationController?.navigationBar.addSubview(logoImageView)
        navigationController?.navigationBar.addSubview(customView)
        
        view.backgroundColor = .systemGray6
        mostVisitedReportsCollectionView.delegate = self
        mostVisitedReportsCollectionView.dataSource = self
        
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
        
        filterButton.addTarget(self, action: #selector(filterButtonClicked), for: .touchUpInside)
        
        
        DispatchQueue.main.async {
            self.loadViewElements()
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUIByUsername), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
      
        
    }
    
    
    @objc func refreshUIByUsername(_ notification: NSNotification) {

        if let byUsernameDict = notification.userInfo?["dataDict"] as? [DirectProfileResponse] {
            directProfileResponseArray = byUsernameDict
            DispatchQueue.main.async {
                self.searchResultCollectionView.reloadData()
            }
            
        }
    }
    
    
    func loadViewElements() {
        APICaller.shared.getMostViews { response in
            switch response {
            case .success(let response):
                var mostViewedProfileData: [MostViewedProfileData] = []
                
                mostViewedProfileData.append(contentsOf: response.data.reports.map({.init(fullname: $0.data.profile.profile.fullname,
                                                                                        username: $0.data.profile.profile.username,
                                                                                        url: $0.data.profile.profile.url,
                                                                                        picture: $0.data.profile.profile.picture,
                                                                                        followers: $0.data.profile.profile.followers,
                                                                                        engagementRate: $0.data.profile.profile.engagementRate,
                                                                                        engagements: $0.data.profile.profile.engagements)}))
                self.mostViewedArray = mostViewedProfileData.prefix(8).map({$0}) // get first 8 item
                var viewCount: [Int] = []
                viewCount.append(contentsOf: response.data.reports.map({
                    $0.viewCount
                }))
                self.viewCountArray = viewCount
                
                DispatchQueue.main.async {
                    self.mostVisitedReportsCollectionView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // base search result
        APICaller.shared.baseFilterResult { response in
            switch response {
            case .success(let model):
                var filterResultData: [SearchWithFilterCellViewModel] = []
                
                filterResultData.append(contentsOf: model.data.bodyNew.lookalikes.map({
                    .init(engagementRate: $0.profile.engagementRate,
                          engagements: $0.profile.engagements,
                          followers: $0.profile.followers,
                          fullname: $0.profile.fullname,
                          picture: $0.profile.picture,
                          url: nil,
                          username: $0.profile.username,
                          isPrivate: nil)
                }))
                
                self.searchByFilterResultArray = filterResultData
                
                DispatchQueue.main.async {
                    self.searchResultCollectionView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mostVisitedReportsLabel)
        scrollView.addSubview(mostVisitedReportsCollectionView)
        scrollView.addSubview(accountCountLabel)
        scrollView.addSubview(searchResultCollectionView)
        scrollView.addSubview(filterButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        mostVisitedReportsLabel.frame = CGRect(x: 16, y: scrollView.top + 16, width: view.width, height: 20)
        mostVisitedReportsCollectionView.frame = CGRect(x: 0, y: mostVisitedReportsLabel.bottom, width: scrollView.width, height: scrollView.width * 0.65)
        accountCountLabel.frame = CGRect(x: 16, y: mostVisitedReportsCollectionView.bottom + 20, width: view.width - 100, height: 20)
        filterButton.frame = CGRect(x: view.width - 38, y: mostVisitedReportsCollectionView.bottom + 20, width: 24, height: 24)
        searchResultCollectionView.frame = CGRect(x: 0, y: accountCountLabel.bottom, width: view.width, height: searchResultCollectionView.contentSize.height + 20)
        scrollView.contentSize = CGSize(width: view.width, height: mostVisitedReportsLabel.height + mostVisitedReportsCollectionView.height + accountCountLabel.height + searchResultCollectionView.height + 40)
    }
    
    @objc func remainingNumberOfReportsClicked() {
        
    }
    
    @objc func filterButtonClicked() {
        let vc = SearchViewController()
//        let navVc = UINavigationController(rootViewController: vc)
//        navVc.modalPresentationStyle = .formSheet
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
        
        
//        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        
//        navigationController?.present(navVc, animated: true)
    }
    
    @objc func searchButtonClicked() {
        let vc = SearchViewController()
//        let navVc = UINavigationController(rootViewController: vc)
//        navVc.modalPresentationStyle = .formSheet
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
        
        
//        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        
//        navigationController?.present(navVc, animated: true)
        
    }
        
}

//UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.searchResultCollectionView {
            
//            if directProfileResponseArray.count == 0 {
//                return 12
//            } else {
//                return 1
//            }
            if directProfileResponseArray.isEmpty == false {
                return 1
            }
//
            if searchByFilterResultArray.isEmpty == false {
                return searchByFilterResultArray.count
            } else {
                return 1
            }
            
        } else {
            if mostViewedArray.count == 0 {
                return 12
            } else {
                return mostViewedArray.count
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mostVisitedReportsCollectionView {
            //Most visited reports cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostVisitedReportsCollectionViewCell.reuseIdentifier, for: indexPath) as! MostVisitedReportsCollectionViewCell
            cell.backgroundColor = .white

            if mostViewedArray.count == 0 {
                // do skeleton view
                cell.contentView.backgroundColor = .white
            } else {
                let mostViewed = mostViewedArray[indexPath.row]
                let viewCount = viewCountArray[indexPath.row]
                cell.configureCellData(with: MostViewedProfileDataCellViewModel(viewCount: viewCount,
                                                                                fullname: mostViewed.fullname ?? "",
                                                                                username: "",
                                                                                url: "",
                                                                                picture: mostViewed.picture,
                                                                                followers: mostViewed.followers ?? 1,
                                                                                engagementRate: mostViewed.engagementRate ?? 1,
                                                                                engagements: 1))
                cell.contentView.backgroundColor = .clear
            }
            
            
            
            

            return cell
        } else {
            //Search result reports cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.reuseIdentifier, for: indexPath) as! SearchResultCollectionViewCell
            cell.backgroundColor = .white

            if searchByFilterResultArray.isEmpty == false {
                let searchByFilterResult = searchByFilterResultArray[indexPath.row]
                cell.configureCellByFilter(with: .init(engagementRate: searchByFilterResult.engagementRate,
                                                       engagements: searchByFilterResult.engagements,
                                                       followers: searchByFilterResult.followers,
                                                       fullname: searchByFilterResult.fullname,
                                                       picture: searchByFilterResult.picture,
                                                       url: nil,
                                                       username: searchByFilterResult.username,
                                                       isPrivate: nil))
                DispatchQueue.main.async {
                    self.searchResultCollectionView.frame = CGRect(x: 0, y: self.accountCountLabel.bottom, width: self.view.width, height: self.searchResultCollectionView.contentSize.height + 20)
                }
               
            }
            
            if directProfileResponseArray.isEmpty == false {
                let directProfileResponse = directProfileResponseArray[indexPath.row]
                cell.configureCellData(with: SearchByUsernameCellViewModel(engagementRate: directProfileResponse.engagementRate,
                                                                           engagements: directProfileResponse.engagements,
                                                                           followers: directProfileResponse.followers,
                                                                           fullname: directProfileResponse.fullname,
                                                                           picture: directProfileResponse.picture,
                                                                           username: directProfileResponse.username))
            }
            
            
            
            
            
                
            
            
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



