//
//  YoutubeReportDetailViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 30.04.2022.
//

import UIKit

class YoutubeReportDetailViewController: UIViewController {

    var sfImages: [SFImagesForReport] = [
        SFImagesForReport(name: "followers", image: "person", explanation: "Takipçi (son 6 ay)"),
        SFImagesForReport(name: "engagement", image: "heart", explanation: "Toplam Etkileşim (son 6 ay)"),
        SFImagesForReport(name: "engagementRate", image: "network", explanation: "Etkileşim Oranı (son 6 ay)"),
        SFImagesForReport(name: "views", image: "heart", explanation: "Ortalama Beğeni Sayısı"),
        SFImagesForReport(name: "comment", image: "text.bubble", explanation: "Ortalama Yorum Sayısı")
    ]
    
    var influencerId = ""
    var platform = ""
    
    var lastPosts: YoutubeFirstDetailViewModel?
    
    var influencerDetails: ReportDetailViewModel?
    var firstDetail: YoutubeFirstDetailViewModel?
    var popularPosts: [YoutubePopularPostsViewModel] = []
    
    var credibility: CredibilityViewModel?
    var gendersDistribution: [GendersViewModel] = []
    var followersCountryLocation: [FollowersLocationViewModel] = []
    var followersCityLocation: [FollowersGeoCities] = []
    var gendersPerAge: [GendersPerAgeViewModel] = []
    
    var notableUsersModel: [SearchWithFilterCellViewModel] = []
    var notableLikersModel: [SearchWithFilterCellViewModel] = []
    
    
    
    var influencerIds: [String] = []
    var audienceInfluencerIds: [String] = []
    var myInfluencerIds: [String] = []
    var reportsCount = 0
    
    var titlesOfButton: [String] = []
    var buttonColors: [UIColor] = []
    
    var audienceTitlesOfButton: [String] = []
    var audienceButtonColors: [UIColor] = []
    
   
    private let audienceDatasLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçilere göre kitle verileri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .blue
        return label
    }()
    
    private let audienceAgeGenderLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi Yaş ve Cinsiyet Grafikleri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .blue
        return label
    }()
    
    private let notableFollowersLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçilerin referans kullanıcıları (Notable followers)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .blue
        return label
    }()
    
    private let notableLikersLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Beğenenlerin referans kullanıcıları (Notable likers)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .blue
        return label
    }()
    
    
    private let reportCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewCompositionalLayout { sectionNumber,env in
            
            if sectionNumber == 0 {
                let inset: CGFloat = 4
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), elementKind: YoutubeFirstDetailsCollectionReusableView.kind, alignment: .top)
                ]
                
                section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
                return section
            }
            else {

                //populer posts
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 8
                section.boundarySupplementaryItems = [
                                   .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.1)), elementKind: YoutubePopularPostsCollectionReusableView.kind, alignment: .topLeading)
                               ]
                return section
            }
    })
        
        
        collectionView.register(YoutubeFirstDetailsCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeFirstDetailsCollectionViewCell.reuseIdentifier)
        collectionView.register(YoutubeFirstDetailsCollectionReusableView.self, forSupplementaryViewOfKind: YoutubeFirstDetailsCollectionReusableView.kind, withReuseIdentifier: YoutubeFirstDetailsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(YoutubePopularPostsCollectionViewCell.self, forCellWithReuseIdentifier: YoutubePopularPostsCollectionViewCell.reuseIdentifier)
        collectionView.register(YoutubePopularPostsCollectionReusableView.self, forSupplementaryViewOfKind: YoutubePopularPostsCollectionReusableView.kind, withReuseIdentifier: YoutubePopularPostsCollectionReusableView.reuseIdentifier)
        
      
        collectionView.backgroundColor = .systemGray6
        collectionView.isScrollEnabled = false
        
        
        return collectionView
    }()
    
    func collectionViewLayoutCircle() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
            return section
        }
        
        return layout
    }
    
    private lazy var agesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutCircle())
        
        collectionView.register(YoutubeGendersPerAgeCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeGendersPerAgeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    func notableCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            return section
        }
        
        return layout
    }
    
    
    private lazy var notableUsersCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: notableCollectionViewLayout())
        collectionView.register(YoutubeNotableUsersCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeNotableUsersCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    private lazy var notableLikersCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: notableCollectionViewLayout())
        collectionView.register(YoutubeNotableLikersCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeNotableLikersCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
   
    
    let notableSubsView = PercentsFollowersView()
    let followersGenderDistributionView = FollowersGenderDistributionView()
    let followersLocationView = FollowersLocationView()
  
   
    
   
    
    private let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
        
        agesCollectionView.delegate = self
        agesCollectionView.dataSource = self
        
        notableUsersCollectionView.delegate = self
        notableUsersCollectionView.dataSource = self
        
        notableLikersCollectionView.delegate = self
        notableLikersCollectionView.dataSource = self
        
        
        
        addSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        reportCollectionView.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: reportCollectionView.contentSize.height + 0.1)

        audienceDatasLabel.frame = CGRect(x: 10, y: reportCollectionView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        notableSubsView.frame = CGRect(x: 10, y: audienceDatasLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        
        followersGenderDistributionView.frame = CGRect(x: 10, y: notableSubsView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        followersLocationView.frame = CGRect(x: 10, y: followersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.4)
        audienceAgeGenderLabel.frame = CGRect(x: 10, y: followersLocationView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        agesCollectionView.frame = CGRect(x: 0, y: audienceAgeGenderLabel.bottom + 10, width: scrollView.width, height: agesCollectionView.contentSize.height + 0.1)
        notableLikersLabel.frame = CGRect(x: 10, y: agesCollectionView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        notableUsersCollectionView.frame = CGRect(x: 0, y: notableLikersLabel.bottom + 10, width: view.width, height: notableUsersCollectionView.contentSize.height + 0.1)
        notableFollowersLabel.frame = CGRect(x: 10, y: notableUsersCollectionView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        notableLikersCollectionView.frame = CGRect(x: 0, y: notableFollowersLabel.bottom + 10, width: view.width, height: notableLikersCollectionView.contentSize.height + 0.1)
        
        scrollView.contentSize = CGSize(width: view.width, height: reportCollectionView.height + notableSubsView.height + followersGenderDistributionView.height + followersLocationView.height + agesCollectionView.height +  notableUsersCollectionView.height + notableLikersCollectionView.height + 300 + view.width * 0.8)
    }
    
    
    
    
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(reportCollectionView)
        scrollView.addSubview(notableSubsView)
        scrollView.addSubview(followersGenderDistributionView)
        scrollView.addSubview(followersLocationView)
        scrollView.addSubview(agesCollectionView)
        scrollView.addSubview(notableUsersCollectionView)
        scrollView.addSubview(notableLikersCollectionView)
        scrollView.addSubview(audienceDatasLabel)
        scrollView.addSubview(audienceAgeGenderLabel)
        scrollView.addSubview(notableFollowersLabel)
        scrollView.addSubview(notableLikersLabel)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nilForViewWillAppear()
        loadViewElements()
    }
    
    func nilForViewWillAppear() {
        
        influencerDetails = nil
        firstDetail = nil
        popularPosts.removeAll()
       
        
        //followers datas
        credibility = nil
        gendersDistribution.removeAll()
        followersCountryLocation.removeAll()
        followersCityLocation.removeAll()
        gendersPerAge.removeAll()
        
       
        
        //notable
        notableUsersModel.removeAll()
        notableLikersModel.removeAll()
        
        
    }
    
    func buttonTitlesLogic(myIds: [String], ids: [String], reportCount: Int) -> ([String], [UIColor]) {
        let myCount = myIds.count
        var idsIn: [String] = []
        idsIn.append(contentsOf: ids.map({$0}))
        var buttonTitle = Array(repeating: "Detay +1", count: ids.count)
        var buttonColors = Array(repeating: UIColor().infpromo, count: ids.count)
        if reportCount == 0 {
            buttonColors = Array(repeating: UIColor.gray, count: ids.count)
        }
        
        for i in 0..<myCount {
            if let myReportsIds = idsIn.firstIndex(where: {$0 == myIds[i]}) {
                buttonTitle[myReportsIds] = "Detay"
                buttonColors[myReportsIds] = UIColor().infpromo
            }
        }
        
        return (buttonTitle, buttonColors)
    }
    
    func loadViewElements() {
        
        APICaller.shared.getUserReports { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let model):
                self.myInfluencerIds.append(contentsOf: model.data.reports.map({$0.data.userId}))
                
            }
        }
        
        APICaller.shared.getUser { result in
            switch result {
            case .success(let result):
                if let reportsCount = result.data.userPublic.credit {
                    self.reportsCount = reportsCount
                }
                
            case .failure(let error):
                print("getting report count from home vc is broken \(error.localizedDescription)")
            }
        }
        
        
        APICaller.shared.getInfluencerReport(platform: platform, influencerId: influencerId) { result in
            switch result {
            case .failure(let error):
                print("load youtube report error: \(error)")
            case .success(let model):
      
                let modelToProfile = model.data.pdfBody.data.profile
                let influencerDetail = modelToProfile.profile
                
                
                self.influencerDetails = .init(fullName: influencerDetail.fullname,
                                               username: influencerDetail.username,
                                               picture: influencerDetail.picture, url: influencerDetail.url)
                
                let viewsFrom = modelToProfile.recentPosts.map({$0.views})
                let commentsFrom = modelToProfile.recentPosts.map({$0.comments})
                
                var allViews = 0
                var allComments = 0
                
                print(viewsFrom.count)
                
                for i in 0..<viewsFrom.count {
                    allViews += viewsFrom[i]!
                    allComments += commentsFrom[i]
                }
                
                
                let views = allViews / viewsFrom.count
                let comments = allComments / commentsFrom.count
                
                let followers = Double(modelToProfile.profile.followers)
                let engagements = Double(modelToProfile.profile.engagements)
                let engagementRate = Double(modelToProfile.profile.engagementRate)
                
                self.lastPosts = .init(followers: followers, engagementRate: engagementRate, engagements: engagements, views: Double(views), comments: Double(comments))
                
                let popularPostsFromModel = modelToProfile.popularPosts
                self.popularPosts.append(contentsOf: popularPostsFromModel.map({
                    .init(url: $0.url,
                          created: $0.created,
                          likes: $0.likes,
                          comments: $0.comments,
                          views: $0.views ?? 0,
                          thumbnail: $0.thumbnail ?? "",
                          video: $0.video ?? "")
                }))
                
                print("popular ??? : \(self.popularPosts.count)")
                
                
                
                if let notableSubs = modelToProfile.audience.notable {
                    self.credibility = .init(credibility: notableSubs)
                }
                
                let genderDistributionModel = modelToProfile.audience.genders
                self.gendersDistribution = genderDistributionModel.map({.init(code: $0.code, weight: $0.weight)})
                
                let audienceLocations = modelToProfile.audience.geoCountries
                self.followersCountryLocation = audienceLocations.map({.init(code: $0.name, weight: $0.weight)})
                
                let audienceCityLocations = modelToProfile.audience.geoCities
                self.followersCityLocation = audienceCityLocations.map({.init(name: $0.name)})
                
                let gendersPerAge = modelToProfile.audience.gendersPerAge
                self.gendersPerAge = gendersPerAge.map({ .init(code: $0.code, male: $0.male, female: $0.female)})
                
                let userNotableLikes = modelToProfile.audience.notableUsers
                
                if let userNotableLikes = userNotableLikes {
                    self.notableUsersModel = userNotableLikes.map({.init(engagementRate: nil,
                                                                       engagements: $0.engagements,
                                                                       followers: $0.followers,
                                                                       fullname: $0.fullname,
                                                                       picture: $0.picture,
                                                                       url: $0.url,
                                                                       username: $0.username,
                                                                       isPrivate: nil,
                                                                         influencerId: $0.userId)}).prefix(15).map({$0})
                    self.influencerIds.append(contentsOf: userNotableLikes.map({$0.userId!}))
                }
                
                if let notablesLikes = modelToProfile.audienceCommenters?.notableUsers {
                
                    self.notableLikersModel = notablesLikes.map({.init(engagementRate: nil,
                                                                       engagements: $0.engagements,
                                                                       followers: $0.followers,
                                                                       fullname: $0.fullname,
                                                                       picture: $0.picture,
                                                                       url: $0.url,
                                                                       username: $0.username,
                                                                       isPrivate: nil,
                                                                       influencerId: $0.userId)}).prefix(15).map({$0})
                    self.audienceInfluencerIds.append(contentsOf: notablesLikes.map({$0.userId!}))
                    
                }
                
                let tupleButton = self.buttonTitlesLogic(myIds: self.myInfluencerIds, ids: self.influencerIds, reportCount: self.reportsCount)
                let audienceTupleButton = self.buttonTitlesLogic(myIds: self.myInfluencerIds, ids: self.audienceInfluencerIds, reportCount: self.reportsCount)
                
                self.titlesOfButton.append(contentsOf: tupleButton.0)
                self.buttonColors.append(contentsOf: tupleButton.1)
                
                self.audienceTitlesOfButton.append(contentsOf: audienceTupleButton.0)
                self.audienceButtonColors.append(contentsOf: audienceTupleButton.1)
                
                
                DispatchQueue.main.async {
                    self.callFillingFuncs()
                }
            }
        }
    }
    
    func handleHaptics(buttonArray: [String], indexPath: IndexPath, button: CustomFilterButton) {
        if reportsCount == 0 {
            if buttonArray[indexPath.row] != "Detay" {
                button.isUserInteractionEnabled = false
                HapticsManager.shared.vibrate(for: .error)
            } else {
                button.isUserInteractionEnabled = true
            }
        } else {
            if buttonArray[indexPath.row] != "Detay" {
                HapticsManager.shared.vibrate(for: .success)
            }
        }
    }
    
    
    
    
    @objc func notableUsersNameButtonClicked(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        let responseIndex = notableUsersModel[indexPath.row]
        if let url = responseIndex.url {
            if let urlString = URL(string: url) {
                UIApplication.shared.open(urlString)
            }
        }
    }
    
    @objc func notableUsersDetailButtonClicked(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        let influencerId = notableUsersModel[indexPath.row].influencerId
        handleHaptics(buttonArray: titlesOfButton, indexPath: indexPath, button: sender)
    }
    
    @objc func notableLikersNameButtonClicked(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        let responseIndex = notableLikersModel[indexPath.row]
        if let url = responseIndex.url {
            if let urlString = URL(string: url) {
                UIApplication.shared.open(urlString)
            }
        }
    }
    
    @objc func notableLikersDetailButtonClicked(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        let influencerId = notableLikersModel[indexPath.row].influencerId
        handleHaptics(buttonArray: audienceTitlesOfButton, indexPath: indexPath, button: sender)
    }
    
    
    @objc func tapGestureRecognizer(tapGestureRecognizer: CustomTapGesture) {
        let indexPath = IndexPath(row: tapGestureRecognizer.row, section: tapGestureRecognizer.section)
        let postsUrl = popularPosts[indexPath.row].url
        if let urlString = URL(string: postsUrl) {
            UIApplication.shared.open(urlString)
        }
        
    }
    
    @objc func headUsernameButtonTapped(sender: CustomFilterButton) {
        print(influencerDetails?.username)
        print(influencerDetails?.fullName)
        if platform == "youtube" {
            if let influencerDetails = influencerDetails {
                if let username = influencerDetails.username {
                    if let urlString = URL(string: "https://www.youtube.com/\(username)") {
                        UIApplication.shared.open(urlString)
                    }
                } else if let name = influencerDetails.fullName {
                    if let urlString = URL(string: "https://www.youtube.com/\(name)") {
                        UIApplication.shared.open(urlString)
                    }
                }
            }
        } else {
            if let username = influencerDetails?.username {
                if let urlString = URL(string: "https://www.tiktok.com/@\(username)") {
                    UIApplication.shared.open(urlString)
                }
            }
        }
        
       
       
    }
    
    
  

}

extension YoutubeReportDetailViewController {
    func callFillingFuncs() {
        reportCollectionView.reloadData()
        handleCredibility()
        handleGenderDistribution()
        handleFollowersLocation()
        agesCollectionView.reloadData()
        self.notableUsersCollectionView.reloadData()
        self.notableLikersCollectionView.reloadData()
    }
    
    func handleCredibility() {
        if let credibility = credibility {
            notableSubsView.configurePercentage(with: credibility, title: "Önemli Abone Oranı", info: "(Influencer 'ı takip edip, aktif olmayan kullanıcılar baz alınarak hesaplanmıştır. )")
        }
       
    }
    
    func handleGenderDistribution() {
        followersGenderDistributionView.configureWight(with: gendersDistribution)
    }
    
    func handleFollowersLocation() {
        followersLocationView.configureFollowersLocations(with: followersCountryLocation, city: followersCityLocation)
    }
}

extension YoutubeReportDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reportCollectionView {
                        DispatchQueue.main.async {
                            let consHeight = self.reportCollectionView.collectionViewLayout.collectionViewContentSize.height
                            self.reportCollectionView.frame = CGRect(x: 0, y: 0, width: self.scrollView.width, height: consHeight)
                        }
                    
            if indexPath.section == 0 {
                
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeFirstDetailsCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeFirstDetailsCollectionViewCell
                    var firstDetailArray: [String] = []
                    if let firstDetail = lastPosts {
                        let intFollowers = Int(firstDetail.followers)
                        firstDetailArray.append("\(intFollowers.roundedWithAbbreviations)")
                        
                        let intEngagement = Int(firstDetail.engagements)
                        firstDetailArray.append("\(intEngagement.roundedWithAbbreviations)")
                        
                        firstDetailArray.append("\(firstDetail.clearEngagement) %")
                        
                       
                        
                        let intViewsValue = Int(firstDetail.views)
                        firstDetailArray.append("\(intViewsValue.roundedWithAbbreviations)")
                        
                        
                        let intCommentsValue = Int(firstDetail.comments)
                        firstDetailArray.append("\(intCommentsValue.roundedWithAbbreviations)")
                        
                        let configCell = sfImages[indexPath.row]
                        cell.configureCell(with: configCell)
                        
                        let secondLabelFillArray = [
                            "",
                            "",
                            "( takipçi sayısı / beğeni sayısı + yorum sayısı + vs. )",
                            "(***Son 10 post baz alınarak hesaplanmıştır.)",
                            "(***Son 10 post baz alınarak hesaplanmıştır.)"
                        ]
                        
                        cell.secondInfoLabel.text = secondLabelFillArray[indexPath.row]
                        
                        cell.numberLabel.text = firstDetailArray[indexPath.row]
                        
                      
                    }
                    
                    return cell
                
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubePopularPostsCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubePopularPostsCollectionViewCell
                let popularPostIndex = popularPosts[indexPath.row]
                
                cell.configureCell(with: .init(url: popularPostIndex.url,
                                               created: popularPostIndex.created,
                                               likes: popularPostIndex.likes,
                                               comments: popularPostIndex.comments,
                                               views: popularPostIndex.views,
                                               thumbnail: popularPostIndex.thumbnail,
                                               video: popularPostIndex.video))
    //            cell.configureCell(with: .init(url: popularPostIndex.url,
    //                                           created: popularPostIndex.created,
    //                                           likes: popularPostIndex.likes,
    //                                           comments: popularPostIndex.comments,
    //                                           image: popularPostIndex.image))
    //
                cell.photoImageView.row = indexPath.row
                cell.photoImageView.section = indexPath.section
    
                let tapGestureRecognizer = CustomTapGesture(target: self, action: #selector(tapGestureRecognizer))
                tapGestureRecognizer.row = indexPath.row
                tapGestureRecognizer.section = indexPath.section
    
                cell.photoImageView.addGestureRecognizer(tapGestureRecognizer)
                
                return cell
                
            }
                
        }
        
        else if collectionView == agesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeGendersPerAgeCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeGendersPerAgeCollectionViewCell
            let gendersPerAgeIndex = gendersPerAge[indexPath.row]
            cell.configureCell(with: .init(code: gendersPerAgeIndex.code,
                                           male: gendersPerAgeIndex.male,
                                           female: gendersPerAgeIndex.female))
            return cell
        } else if collectionView == notableUsersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeNotableUsersCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeNotableUsersCollectionViewCell
            let notableIndex = notableUsersModel[indexPath.row]
            cell.configureCellByFilter(with: .init(engagementRate: nil,
                                                   engagements: notableIndex.engagements,
                                                   followers: notableIndex.followers,
                                                   fullname: notableIndex.fullname,
                                                   picture: notableIndex.picture,
                                                   url: notableIndex.url,
                                                   username: notableIndex.username,
                                                   isPrivate: nil,
                                                   influencerId: notableIndex.influencerId))
            cell.configureButtonTitle(titlesOfButton[indexPath.row], color: buttonColors[indexPath.row])
            cell.usernameButton.row = indexPath.row
            cell.usernameButton.section = indexPath.section
            
            cell.goToDetailButton.row = indexPath.row
            cell.goToDetailButton.section = indexPath.section
            
            cell.usernameButton.addTarget(self, action: #selector(notableUsersNameButtonClicked), for: .touchUpInside)
            cell.goToDetailButton.addTarget(self, action: #selector(notableUsersDetailButtonClicked), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeNotableLikersCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeNotableLikersCollectionViewCell
            let notableIndex = notableLikersModel[indexPath.row]
            cell.configureCellByFilter(with: notableIndex)
            cell.configureButtonTitle(audienceTitlesOfButton[indexPath.row], color: audienceButtonColors[indexPath.row])
            
            cell.usernameButton.row = indexPath.row
            cell.usernameButton.section = indexPath.section
            
            cell.goToDetailButton.row = indexPath.row
            cell.goToDetailButton.section = indexPath.section
            
            
            
            cell.usernameButton.addTarget(self, action: #selector(notableLikersNameButtonClicked), for: .touchUpInside)
            cell.goToDetailButton.addTarget(self, action: #selector(notableLikersDetailButtonClicked), for: .touchUpInside)

            return cell
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == reportCollectionView {
            return 2
        } else if collectionView == agesCollectionView {
            return 1
        } else if collectionView == notableUsersCollectionView {
            return 1
        } else {
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reportCollectionView {
            if section == 0 {
                return 5
            } else {
                return popularPosts.count
            }
        } else if collectionView == agesCollectionView {
            return gendersPerAge.count
        } else if collectionView == notableUsersCollectionView {
            return notableUsersModel.count
        } else {
            return notableLikersModel.count
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == reportCollectionView {
            if indexPath.section == 0 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: YoutubeFirstDetailsCollectionReusableView.kind, withReuseIdentifier: YoutubeFirstDetailsCollectionReusableView.reuseIdentifier, for: indexPath) as! YoutubeFirstDetailsCollectionReusableView
                reuseView.configureProfile(with: .init(fullName: influencerDetails?.fullName,
                                                       username: influencerDetails?.username,
                                                       picture: influencerDetails?.picture,
                                                       url: influencerDetails?.url ))
                
                
                reuseView.usernameButton.row = indexPath.row
                reuseView.usernameButton.section = indexPath.section
                reuseView.usernameButton.addTarget(self, action: #selector(headUsernameButtonTapped), for: .touchUpInside)
                return reuseView
        
            } else if indexPath.section == 1 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: YoutubePopularPostsCollectionReusableView.kind, withReuseIdentifier: YoutubePopularPostsCollectionReusableView.reuseIdentifier, for: indexPath)
                    
                return reuseView
            }
 
    }
   
    return UICollectionReusableView()
    
    }
}
