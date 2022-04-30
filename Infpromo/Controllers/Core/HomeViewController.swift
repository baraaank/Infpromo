//
//  HomeViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //        scrollView.contentSize = CGSize(width: 240, height: 2400)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    var mostVisitedReportsLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .systemGray6
        return label
    }()
    
    let accountCountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "\"123423\" hesap bulundu.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
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
    
    
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(weight: .regular)
        button.setImage(UIImage(systemName: "slider.horizontal.3")?.withTintColor(UIColor().infpromo, renderingMode: .alwaysOriginal).withConfiguration(config), for: .normal)
        //        button.imageView?.tintColor = UIColor().infpromo
        
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
        let deviceWidth = UIScreen.main.bounds.width
        let label = UILabel(frame: CGRect(x: deviceWidth - 110, y: 10, width: 80, height: 24))
        //        let label = UILabel(frame: CGRect(x: 260, y: 8, width: 120, height: 30))
        label.attributedText = NSAttributedString(string: "Rapor: ?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor :  UIColor().infpromo])
        label.numberOfLines = 0
        
        return label
    }()
    
    let customImageView: UIImageView = {
        let image = UIImage(systemName: "doc", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor().infpromo
        
        
        imageView.contentMode = .scaleAspectFit
        
        
        
        let deviceWidth = UIScreen.main.bounds.width
        
        imageView.frame = CGRect(x: deviceWidth - 30, y: 12, width: 20, height: 20)
        
        //        imageView.frame = CGRect(x: 340, y: 12, width: 22, height: 22)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var mostViewedArray: [MostViewedProfileData] = []
    var viewCountArray: [Int] = []
    
    var directProfileResponseArray: [SearchWithFilterCellViewModel] = []
    var searchByFilterResultArray: [SearchWithFilterCellViewModel] = []
    
    var initialPage: Int = 0
    var total: Int = 0
    var maxPage = -1
    
    var minFollowers: Int?
    var maxFollowers: Int?
    var gender: String?
    var interests: [Int?] = []
    var language: String?
    var engagementRate: Double?
    var hasYoutube: Bool?
    
    var audinenceGender: String?
    var audienceAges: [String?] = []
    var audienceInterests: [Int?] = []
    var audienceLanguage: String?
    
    var influencerIds: [String] = []
    
    //loading gifs
    var gif: LoadingGif!
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffectView = UIVisualEffectView()
        let style = UIBlurEffect.Style.light
        let effect = UIBlurEffect(style: style)
        blurEffectView.effect = effect
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gif = LoadingGif.init(imageName: "infpromoLoadingGif", frame: CGRect(x: (view.frame.size.width / 2) - 40, y: (view.frame.size.height / 2) - 40, width: 80, height: 80), duration: 0.8, repeatCount: 0)
        blurEffectView.frame = view.bounds
        
        view.backgroundColor = .white
        addSubviews()
        
        customView.addSubview(customLabel)
        customView.addSubview(customImageView)
        
        
        
        let logoImage = UIImage.init(named: "LogoPng")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x: 10, y: 5, width: 150, height: 35)
        logoImageView.contentMode = .scaleAspectFit
        //                let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -25
        
        
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(totalByFilter), name: NSNotification.Name(rawValue: "filterBasedDict"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUIByUsername), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUIByFilter), name: NSNotification.Name(rawValue: "newFilterResultDict"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(deletedComponentsFromHome), name: NSNotification.Name(rawValue: "deleteComponents"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(usernameSearchError), name: NSNotification.Name("usernameErrorDict"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(filterSearchError), name: NSNotification.Name("filterErrorDict"), object: nil)
        
        
        //
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //            self.mostVisitedReportsCollectionView.stopSkeletonAnimation()
        //            self.view.hideSkeleton()
        //            self.mostVisitedReportsCollectionView.reloadData()
        //        }
        //
        
        accountCountLabel.isSkeletonable = true
        mostVisitedReportsLabel.isSkeletonable = true
        
        accountCountLabel.showAnimatedGradientSkeleton()
        mostVisitedReportsLabel.showAnimatedGradientSkeleton()
        //        mostVisitedReportsLabel.showAnimatedGradientSkeleton()
        
        
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        navigationController?.navigationBar.barTintColor = .systemGray6
        
        //        tabBarController?.tabBar.isHidden = true
        
        startBlur()
        APIisNotWorking()
        
//        tabBarController?.tabBar.isUserInteractionEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func APIisNotWorking() {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.stopBlur()
//                    self.showAlert(title: "Ooops!", message: "İnternet bağlantınızı kontrol edin!")
//                }
        
    }
    
    //loading gif blur functionality
    func startBlur() {
//        view.addSubview(blurEffectView)
//        view.addSubview(gif)
//
//        gif.startAnimation()

    }
    
    func stopBlur() {
//        gif.stopAnimation()
//        gif.removeFromSuperview()
//        blurEffectView.removeFromSuperview()
//        tabBarController?.tabBar.barTintColor = .white
//        tabBarController?.tabBar.isUserInteractionEnabled = true
    
    }
    
    @objc func usernameSearchError(_ notification: NSNotification) {
        if let searchError = notification.userInfo?["searcByUsernameUnsuccessful"] as? String {
            DispatchQueue.main.async {
                self.stopBlur()
                self.showAlert(title: "Hata!", message: searchError)
            }
        }
        
    }
    
    @objc func filterSearchError(_ notification: NSNotification) {
        if let searchError = notification.userInfo?["searcByFilterUnsuccessful"] as? String {
            DispatchQueue.main.async {
                self.stopBlur()
                self.showAlert(title: "Hata!", message: searchError)
            }
        }
    }
    
    @objc func deletedComponentsFromHome(_ notification: NSNotification) {
        
        DispatchQueue.main.async {
            self.startBlur()
        }
        
        if let deleted = notification.userInfo?["maxPage"] as? Int {
            initialPage = 0
            maxPage = deleted
            searchByFilterResultArray.removeAll()
            directProfileResponseArray.removeAll()
            influencerIds.removeAll()
            
            
            print("eeeyyyyooooo")
            print(initialPage)
            print(maxPage)
            print(searchByFilterResultArray.count)
        }
        
    }
    
    
    //filter objects and total numb
    @objc func totalByFilter(_ notification: NSNotification) {
        if let byTotalFilter = notification.userInfo?["total"] as? Int {
            total = byTotalFilter
            initialPage = 0
            
            if (total / 15) <= 1 {
                maxPage = 0
            }
            
            //            if (total / 15) is Int {
            //                maxPage = 0
            //            }
            
            DispatchQueue.main.async {
                self.accountCountLabel.text = "\"\(self.total)\" hesap bulundu."
                
                
                
            }
        }
        
        if let minFollowersDict = notification.userInfo?["minFollowers"] as? Int {
            minFollowers = minFollowersDict
        }
        
        if let maxFollowersDict = notification.userInfo?["maxFollowers"] as? Int {
            maxFollowers = maxFollowersDict
        }
        
        if let genderDict = notification.userInfo?["gender"] as? String {
            gender = genderDict
        }
        
        if let interestsDict = notification.userInfo?["interests"] as? [Int] {
            interests = interestsDict
        }
        
        if let engagementRateDict = notification.userInfo?["engagementRate"] as? Double {
            engagementRate = engagementRateDict
        }
        
        if let hasYoutubeDict = notification.userInfo?["hasYoutube"] as? Bool {
            hasYoutube = hasYoutubeDict
        }
        
        if let audienceGenderDict = notification.userInfo?["audienceGender"] as? String {
            audinenceGender = audienceGenderDict
        }
        
       
        if let audienceAgeDict = notification.userInfo?["audienceAges"] as? [String] {
            audienceAges = audienceAgeDict
        }
        
        if let audienceInterestsDict = notification.userInfo?["audienceInterests"] as? [Int] {
            audienceInterests = audienceInterestsDict
        }
        
        
        if let audienceLanguageDict = notification.userInfo?["audienceLanguage"] as? String {
            audienceLanguage = audienceLanguageDict
        }
        
        
        
    }
    
    //influencers by filter
    @objc func refreshUIByFilter(_ notification: NSNotification) {
        searchByFilterResultArray.removeAll()
        if let byFilterDict = notification.userInfo?["filterResultDict"] as? [SearchWithFilterCellViewModel] {
            searchByFilterResultArray = byFilterDict
            DispatchQueue.main.async {
                self.stopBlur()
                self.searchResultCollectionView.reloadData()
            }
        }
    }
    
    //username by filter
    @objc func refreshUIByUsername(_ notification: NSNotification) {
        
        if let byUsernameDict = notification.userInfo?["dataDict"] as? [SearchWithFilterCellViewModel] {
            directProfileResponseArray = byUsernameDict
            total = 1
            DispatchQueue.main.async {
                self.stopBlur()
                self.searchResultCollectionView.reloadData()
                self.accountCountLabel.text = "\"\(self.total)\" hesap bulundu."
            }
            
        }
    }
    
    
    
    
    func loadViewElements() {
        
        //get user reports count--------
        
        APICaller.shared.getUser { result in
            switch result {
            case .success(let result):
                if let reportsCount = result.data.userPublic.credit {
                    DispatchQueue.main.async {
                        self.customLabel.text = "Rapor: \(reportsCount)"
                    }
                }
                
                
            case .failure(let error):
                print("getting user from home vc is broken \(error.localizedDescription)")
            }
        }
        
        
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
                    self.mostVisitedReportsLabel.text = "Bu ay en çok ziyaret edilen raporlar"
                    self.mostVisitedReportsLabel.hideSkeleton()
                    self.mostVisitedReportsLabel.stopSkeletonAnimation()
                    self.stopBlur()
                }
                
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // base search result
        APICaller.shared.filter(page: initialPage, minFollowers: nil, maxFollowers: nil, gender: nil, interests: [nil], language: nil, engagementRate: nil, hasYoutube: nil, audienceGender: nil, audienceAges: [], audienceInterests: [nil], audienceLanguage: nil, completion: { response in
            switch response {
            case .success(let model):
                var filterResultData: [SearchWithFilterCellViewModel] = []
                print("success???")
                filterResultData.append(contentsOf: model.data.bodyNew.lookalikes.map({
                    .init(engagementRate: $0.profile.engagementRate,
                          engagements: $0.profile.engagements,
                          followers: $0.profile.followers,
                          fullname: $0.profile.fullname,
                          picture: $0.profile.picture,
                          url: $0.profile.url,
                          username: $0.profile.username,
                          isPrivate: nil,
                          influencerId: $0.userId)
                }))
                
//                var influencerId: [String] = []
//                influencerId.append(contentsOf:model.data.bodyNew.lookalikes.map({
//                    $0.userId
//                }))
                
               
                
//                self.influencerIds = influencerId
                
                self.total = model.data.bodyNew.total
                print("total: \(self.total)")
                
                self.searchByFilterResultArray = filterResultData
                
                DispatchQueue.main.async {
                    
                    self.accountCountLabel.text =  "\"\(self.total)\" hesap bulundu."
                    self.searchResultCollectionView.reloadData()
                    self.accountCountLabel.hideSkeleton()
                    self.accountCountLabel.stopSkeletonAnimation()
                    self.stopBlur()
                }
                
                
            case .failure(let error):
                print(error)
                print("base result is not loading")
            }
            
            
        })
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        mostVisitedReportsLabel.isSkeletonable = true
        //        mostVisitedReportsLabel.showSkeleton()
        //        mostVisitedReportsLabel.showAnimatedGradientSkeleton()
        
        //        view.isSkeletonable = true
        //        mostVisitedReportsCollectionView.isSkeletonable = true
        //        mostVisitedReportsCollectionView.showSkeleton()
        
        //        mostVisitedReportsCollectionView.isSkeletonable = true
        //        mostVisitedReportsCollectionView.showAnimatedGradientSkeleton()
        //        mostVisitedReportsCollectionView.showAnimatedSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
        
        //        accountCountLabel.isSkeletonable = true
        //        mostVisitedReportsLabel.isSkeletonable = true
        //
        //        accountCountLabel.showAnimatedGradientSkeleton()
        
        
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
        filterButton.frame = CGRect(x: view.width - 36, y: mostVisitedReportsCollectionView.bottom + 22, width: 22, height: 22)
        searchResultCollectionView.frame = CGRect(x: 0, y: accountCountLabel.bottom, width: view.width, height: searchResultCollectionView.contentSize.height + 20)
        scrollView.contentSize = CGSize(width: view.width, height: mostVisitedReportsLabel.height + mostVisitedReportsCollectionView.height + accountCountLabel.height + searchResultCollectionView.height + 40)
    }
    
    @objc func remainingNumberOfReportsClicked() {
        
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        mostVisitedReportsCollectionView.isSkeletonable = true
    //    }
    //
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
    
    
    
    @objc func nextButtonClicked() {
        maxPage = Int(total / 15)
        initialPage += 1
        if initialPage <= Int(maxPage) {
            APICaller.shared.filter(page: initialPage, minFollowers: minFollowers, maxFollowers: maxFollowers, gender: gender, interests: interests, language: language, engagementRate: engagementRate, hasYoutube: hasYoutube, audienceGender: audinenceGender, audienceAges: audienceAges, audienceInterests: audienceInterests, audienceLanguage: audienceLanguage, completion: { response in
                switch response {
                case .success(let model):
                    var filterResultData: [SearchWithFilterCellViewModel] = []
                    
                    filterResultData.append(contentsOf: model.data.bodyNew.lookalikes.map({
                        .init(engagementRate: $0.profile.engagementRate,
                              engagements: $0.profile.engagements,
                              followers: $0.profile.followers,
                              fullname: $0.profile.fullname,
                              picture: $0.profile.picture,
                              url: $0.profile.url,
                              username: $0.profile.username,
                              isPrivate: nil,
                              influencerId: $0.userId)
                    }))
                    
                    self.total = model.data.bodyNew.total
                    
                    self.searchByFilterResultArray.append(contentsOf: filterResultData)
                    //                self.searchByFilterResultArray = filterResultData
                    
//                    self.influencerIds.append(contentsOf: model.data.bodyNew.lookalikes.map({
//                        $0.userId
//                    }))
//
                    DispatchQueue.main.async {
                        self.searchResultCollectionView.reloadData()
                    }
                    
                case .failure(let error):
                    print(error)
                }
            })
            
        }
        
        print("\(maxPage) : maxPage")
        print("\(initialPage) : initialPage")
        
    }
    
    func directToAccount(urlString: String, name: String) {
        if let urlString = URL(string: "https://www.\(urlString).com/\(name)") {
            UIApplication.shared.open(urlString)
        }
    }
    
    @objc func usernameButtonTapped(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        
        if !directProfileResponseArray.isEmpty {
            let responseIndex = directProfileResponseArray[indexPath.row]
//            if let network = responseIndex.network {
//                if network == "instagram", let name = responseIndex.username {
//                    directToAccount(urlString: network, name: name)
//                } else if network == "youtube", let name = responseIndex.fullname {
//                    directToAccount(urlString: network, name: name)
//                } else if network == "tiktok", let name = responseIndex.fullname {
//                    directToAccount(urlString: network, name: "@\(name)")
//                }
//            }
            if let url = responseIndex.url {
                if let urlString = URL(string: url) {
                    UIApplication.shared.open(urlString)
                }
            }
            
        } else {
//            let responseIndex = directProfileResponseArray[indexPath.row]
//            if let network = responseIndex.network {
//                if network == "instagram", let name = responseIndex.username {
//                    directToAccount(urlString: network, name: name)
//                } else if network == "youtube", let name = responseIndex.fullname {
//                    directToAccount(urlString: network, name: name)
//                } else if network == "tiktok", let name = responseIndex.fullname {
//                    directToAccount(urlString: network, name: "@\(name)")
//                }
//            }
            let responseIndex = searchByFilterResultArray[indexPath.row]
            if let url = responseIndex.url {
                if let urlString = URL(string: url) {
                    UIApplication.shared.open(urlString)
                }
            }
        }
        
        
    }
    
    @objc func goToDetailButtonTapped(sender: CustomFilterButton) {
        
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        
        
        if !directProfileResponseArray.isEmpty {
            let influencerId = directProfileResponseArray[indexPath.row].influencerId
            print("influencer id: \(influencerId)")
        } else {
            let influencerId = searchByFilterResultArray[indexPath.row].influencerId
            print("influencer id: \(influencerId)")
        }
            
        HapticsManager.shared.vibrate(for: .success)
        
        
        
        
    }
    
    
    
}

//UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.searchResultCollectionView {
            
            if directProfileResponseArray.isEmpty == false {
                return 1
            }
            
            if searchByFilterResultArray.isEmpty == false {
                return searchByFilterResultArray.count
            } else {
                return 10
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
            //            cell.isSkeletonable = true
            //            cell.showAnimatedGradientSkeleton()
            //            cell.contentView.backgroundColor = .white
            //            cell.backgroundColor = .white
            //            cell.showAnimatedGradientSkeleton()
            if mostViewedArray.count == 0 {
                // do skeleton view
                cell.isSkeletonable = true
                cell.showAnimatedGradientSkeleton()
                //                cell.contentView.backgroundColor = .white
            } else {
                let mostViewed = mostViewedArray[indexPath.row]
                let viewCount = viewCountArray[indexPath.row]
                cell.configureCellData(with: MostViewedProfileDataCellViewModel(viewCount: viewCount,
                                                                                fullname: mostViewed.fullname ?? "",
                                                                                username: "",
                                                                                url: mostViewed.url,
                                                                                picture: mostViewed.picture,
                                                                                followers: mostViewed.followers ?? 1,
                                                                                engagementRate: mostViewed.engagementRate ?? 1,
                                                                                engagements: 1))
                cell.contentView.isHidden = false
                //                cell.backgroundColor = .clear
                cell.hideSkeleton()
                cell.stopSkeletonAnimation()
            }
            
            
            cell.contentView.backgroundColor = .white
            //            cell.contentView.backgroundColor = .clear
            
            return cell
        } else {
            //Search result reports cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.reuseIdentifier, for: indexPath) as! SearchResultCollectionViewCell
            cell.backgroundColor = .white
            cell.usernameButton.row = indexPath.row
            cell.usernameButton.section = indexPath.section
            cell.usernameButton.addTarget(self, action: #selector(usernameButtonTapped), for: .touchUpInside)
            
            
            cell.goToDetailButton.row = indexPath.row
            cell.goToDetailButton.section = indexPath.section
            cell.goToDetailButton.addTarget(self, action: #selector(goToDetailButtonTapped), for: .touchUpInside)
            
            if searchByFilterResultArray.isEmpty && directProfileResponseArray.isEmpty {
                cell.isSkeletonable = true
                cell.showAnimatedGradientSkeleton()
            }
            
            
            
            if searchByFilterResultArray.isEmpty == false {
                let searchByFilterResult = searchByFilterResultArray[indexPath.row]
                cell.configureCellByFilter(with: .init(engagementRate: searchByFilterResult.engagementRate,
                                                       engagements: searchByFilterResult.engagements,
                                                       followers: searchByFilterResult.followers,
                                                       fullname: searchByFilterResult.fullname,
                                                       picture: searchByFilterResult.picture,
                                                       url: searchByFilterResult.url,
                                                       username: searchByFilterResult.username,
                                                       isPrivate: nil,
                                                       influencerId: searchByFilterResult.influencerId))
                
                //                cell.usernameButton.row = indexPath.row
                //                cell.usernameButton.section = indexPath.section
                
                
                DispatchQueue.main.async {
                    self.searchResultCollectionView.frame = CGRect(x: 0, y: self.accountCountLabel.bottom, width: self.view.width, height: self.searchResultCollectionView.contentSize.height + 20)
                }
                
                
                cell.contentView.isHidden = false
                //                cell.backgroundColor = .clear
                cell.hideSkeleton()
                cell.stopSkeletonAnimation()
            }
            
            if directProfileResponseArray.isEmpty == false {
                let directProfileResponse = directProfileResponseArray[indexPath.row]
                cell.configureCellByFilter(with: .init(engagementRate: directProfileResponse.engagementRate,
                                                       engagements: directProfileResponse.engagements,
                                                       followers: directProfileResponse.followers,
                                                       fullname: directProfileResponse.fullname,
                                                       picture: directProfileResponse.picture,
                                                       url: directProfileResponse.url,
                                                       username: directProfileResponse.username,
                                                       isPrivate: nil,
                                                       influencerId: directProfileResponse.influencerId))
                
                //                cell.backgroundColor = .clear
                cell.contentView.isHidden = false
                cell.hideSkeleton()
                cell.stopSkeletonAnimation()
            }
            
            
            return cell
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == self.searchResultCollectionView {
            if kind == SearchResultCollectionReusableView.kind {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: SearchResultCollectionReusableView.kind, withReuseIdentifier: SearchResultCollectionReusableView.reuseIdentifier, for: indexPath) as! SearchResultCollectionReusableView
                footer.button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
                
                if maxPage <= 0 {
                    footer.button.isHidden = true
                }
                
                
                
                if initialPage == maxPage {
                    footer.button.isHidden = true
                } else {
                    footer.button.isHidden = false
                }
                
                
                
                return footer
            } else {
                fatalError()
            }
        } else {
            fatalError()
        }
        
    }
    
    
}



//
//extension HomeViewController: SearchViewControllerDelegate {
//    func deleteComponents() {
//        maxPage = -1
//        initialPage = 0
//        searchByFilterResultArray.removeAll()
//        
//        print("max page delegate: \(maxPage)")
//        print("initial page delegate: \(initialPage)")
//        print("array delegate: \(searchByFilterResultArray)")
//        
//        print("inside in delegatee")
//    }
//    
//    
//}


extension HomeViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return MostVisitedReportsCollectionViewCell.reuseIdentifier
    }
    
    
    
    
}


//alerts
extension HomeViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
                                                    message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
