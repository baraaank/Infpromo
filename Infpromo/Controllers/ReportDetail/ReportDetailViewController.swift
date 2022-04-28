//
//  ReportDetailViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit


class ReportDetailViewController: UIViewController {
    
    var sfImages: [SFImagesForReport] = [
        SFImagesForReport(name: "followers", image: "person", explanation: "Takipçi (son 6 ay)"),
        SFImagesForReport(name: "engagement", image: "heart", explanation: "Toplam Etkileşim (son 6 ay)"),
        SFImagesForReport(name: "engagementRate", image: "network", explanation: "Etkileşim Oranı (son 6 ay)"),
        SFImagesForReport(name: "like", image: "heart", explanation: "Ortalama Beğeni Sayısı"),
        SFImagesForReport(name: "comment", image: "text.bubble", explanation: "Ortalama Yorum Sayısı")
    ]
    
    var influencerId = ""
    
    var influencerDetails: ReportDetailViewModel?
    var firstDetail: FirstDetailViewModel?
    var popularPosts: [PopularPostViewModel] = []
    var chartStatHistory: [ChartsViewModel] = []
    var hashtags: [HashtagsViewModel] = []
    var mentions: [MentionsViewModel] = []
    
    //followers datas
    var credibility: CredibilityViewModel?
    var gendersDistribution: [GendersViewModel] = []
    var followersCountryLocation: [FollowersLocationViewModel] = []
    var followersCityLocation: [FollowersGeoCities] = []
    var gendersPerAge: [GendersPerAgeViewModel] = []
    
    //audience
    var likersCredibility: CredibilityViewModel?
    var likersNonFollowersLikes: CredibilityViewModel?
    var likersGenderDistribution: [GendersViewModel] = []
    var likersFollowersCountryLocation: [FollowersLocationViewModel] = []
    var likersFollowersCityLocation: [FollowersGeoCities] = []
    var likersGendersPerAge: [GendersPerAgeViewModel] = []
    
    
    private let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let reportCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewCompositionalLayout { sectionNumber,env in
            
            if sectionNumber == 0 {
                //first informations
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), elementKind: FirstDetailsCollectionReusableView.kind, alignment: .top)
                ]
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
                return section
            } else {
                
                
                //populer posts
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 8
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.1)), elementKind: PopularPostsCollectionReusableView.kind, alignment: .topLeading)
                ]
                return section
            }
    })
        
        
        collectionView.register(FirstDetailsCollectionViewCell.self, forCellWithReuseIdentifier: FirstDetailsCollectionViewCell.reuseIdentifier)
        collectionView.register(FirstDetailsCollectionReusableView.self, forSupplementaryViewOfKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(PopularPostsCollectionViewCell.self, forCellWithReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier)
        collectionView.register(PopularPostsCollectionReusableView.self, forSupplementaryViewOfKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier)
        
      
        collectionView.isScrollEnabled = false
        
        
        return collectionView
    }()
    
    
    private let agesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
            return section
        }))
        
        collectionView.register(GendersPerAgeCollectionViewCell.self, forCellWithReuseIdentifier: GendersPerAgeCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    private let likersAgesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
            return section
        }))
        
        collectionView.register(LikersGendersPerAgeCollectionViewCell.self, forCellWithReuseIdentifier: LikersGendersPerAgeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    
    
    
    //create charts views
    let followersChart = ChartsView()
    let followingChart = ChartsView()
    let avgLikesChart = ChartsView()
    
    
    //create hashtags and mentions
    let hashtagsView = HashtagsMentionsView()
    let mentionsView = HashtagsMentionsView()
    
    
    
    //followers datas
    let fakeFollowersView = PercentsFollowersView()
    let followersGenderDistributionView = FollowersGenderDistributionView()
    let followersLocationView = FollowersLocationView()
    
    
    //likers views
    let likersCredibilityView = PercentsFollowersView()
    let likersNonFollowersLikesView = PercentsFollowersView()
    let likersFollowersGenderDistributionView = FollowersGenderDistributionView()
    let likersFollowersLocationView = FollowersLocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
        
        agesCollectionView.delegate = self
        agesCollectionView.dataSource = self
        
        likersAgesCollectionView.delegate = self
        likersAgesCollectionView.dataSource = self
        
        
        print(influencerId)
        view.backgroundColor = .white
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        reportCollectionView.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: reportCollectionView.contentSize.height + 100)
        followersChart.frame = CGRect(x: 10, y: reportCollectionView.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        followingChart.frame = CGRect(x: 10, y: followersChart.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        avgLikesChart.frame = CGRect(x: 10, y: followingChart.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        hashtagsView.frame = CGRect(x: 10, y: avgLikesChart.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        mentionsView.frame = CGRect(x: 10, y: hashtagsView.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        fakeFollowersView.frame = CGRect(x: 10, y: mentionsView.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        
        
        followersGenderDistributionView.frame = CGRect(x: 10, y: fakeFollowersView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        followersLocationView.frame = CGRect(x: 10, y: followersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.2)
        agesCollectionView.frame = CGRect(x: 0, y: followersLocationView.bottom + 10, width: scrollView.width, height: 600)
        
        likersCredibilityView.frame = CGRect(x: 10, y: agesCollectionView.bottom + 10, width: (view.width / 2) - 15, height: view.width * 0.6)
        likersNonFollowersLikesView.frame = CGRect(x: likersCredibilityView.right + 10, y: agesCollectionView.bottom + 10, width: (view.width / 2) - 15, height: view.width * 0.6)
        
        likersFollowersGenderDistributionView.frame = CGRect(x: 10, y: likersNonFollowersLikesView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        likersFollowersLocationView.frame = CGRect(x: 10, y: likersFollowersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.2)
        likersAgesCollectionView.frame = CGRect(x: 0, y: likersFollowersLocationView.bottom + 10, width: scrollView.width, height: 600)
        
        scrollView.contentSize = CGSize(width: view.width, height: reportCollectionView.height + followersChart.height + followingChart.height + avgLikesChart.height + hashtagsView.height + mentionsView.height + fakeFollowersView.height + followersGenderDistributionView.height + followersLocationView.height + agesCollectionView.height + likersCredibilityView.height + likersNonFollowersLikesView.height + likersFollowersGenderDistributionView.height + likersFollowersLocationView.height + likersAgesCollectionView.height + 200)
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(reportCollectionView)
        scrollView.addSubview(followersChart)
        scrollView.addSubview(followingChart)
        scrollView.addSubview(avgLikesChart)
        scrollView.addSubview(hashtagsView)
        scrollView.addSubview(mentionsView)
        scrollView.addSubview(fakeFollowersView)
        scrollView.addSubview(followersGenderDistributionView)
        scrollView.addSubview(followersLocationView)
        scrollView.addSubview(agesCollectionView)
        scrollView.addSubview(likersCredibilityView)
        scrollView.addSubview(likersNonFollowersLikesView)
        scrollView.addSubview(likersFollowersGenderDistributionView)
        scrollView.addSubview(likersFollowersLocationView)
        scrollView.addSubview(likersAgesCollectionView)
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewElements()
    }
    
    
    private func loadViewElements() {
        APICaller.shared.getInfluencerReport(influencerId: influencerId) { result in
            switch result {
            case .failure(let error):
                print("getting influncer report error: \(error)")
            case .success(let model):
                
                let modelToProfile = model.data.pdfBody.data.profile
                let influencerDetail = modelToProfile.profile
                self.influencerDetails = .init(fullName: influencerDetail.fullname,
                                               username: influencerDetail.username,
                                               picture: influencerDetail.picture)
                
                let avgDetail = modelToProfile
                self.firstDetail = .init(followers: influencerDetail.followers,
                                         engagementRate: influencerDetail.engagementRate,
                                         engagements: influencerDetail.engagements,
                                         likeValue: avgDetail.avgLikes,
                                         likeCompared: avgDetail.stats.avgLikes.compared,
                                         followersValue: avgDetail.avgComments,
                                         followersCompared: avgDetail.stats.followers.compared)
                
                let popularPostsFromModel = modelToProfile.popularPosts
                self.popularPosts.append(contentsOf: popularPostsFromModel.map({
                    .init(url: $0.url,
                          created: $0.created,
                          likes: $0.likes,
                          comments: $0.comments,
                          image: $0.image)
                }))
                
                
                let chartHistory = modelToProfile.statHistory
                
                self.chartStatHistory.append(contentsOf: chartHistory.map({
                    .init(month: $0.month,
                          followers: $0.followers,
                          avgLikes: $0.avgLikes,
                          following: $0.following)
                }))
                
                let tagModel = modelToProfile
                
                self.hashtags.append(contentsOf: tagModel.hashtags.map({
                    .init(hashtag: $0.tag)
                }))
                
                self.mentions.append(contentsOf: tagModel.mentions.map({
                    .init(mention: $0.tag)
                }))
                
                let credibilityModel = modelToProfile.audience
                self.credibility = .init(credibility: credibilityModel.credibility)
                
                let genderDistributionModel = modelToProfile.audience.genders
                self.gendersDistribution = genderDistributionModel.map({.init(code: $0.code, weight: $0.weight)})
                
                let audienceLocations = modelToProfile.audience.geoCountries
                self.followersCountryLocation = audienceLocations.map({.init(code: $0.name, weight: $0.weight)})
                
                let audienceCityLocations = modelToProfile.audience.geoCities
                self.followersCityLocation = audienceCityLocations.map({.init(name: $0.name)})
                
                let gendersPerAge = modelToProfile.audience.gendersPerAge
                self.gendersPerAge = gendersPerAge.map({ .init(code: $0.code, male: $0.male, female: $0.female)})
                
                let likersCredibilityModel = modelToProfile.audienceLikers
                self.likersCredibility = .init(credibility: likersCredibilityModel.credibility ?? 0.0)
                
                let likersNonFollowersLikesModel = modelToProfile.audienceLikers
                self.likersNonFollowersLikes = .init(credibility: likersNonFollowersLikesModel.nonFollowerLikes ?? 0.0)
                
                let likersGenderDistributionModel = modelToProfile.audienceLikers.genders
                
                if let likersGenderDistributionModel = likersGenderDistributionModel {
                    self.likersGenderDistribution = likersGenderDistributionModel.map({.init(code: $0.code, weight: $0.weight)})
                }
                
                
                let likersAudienceLocations = modelToProfile.audienceLikers.geoCountries
                if let likersAudienceLocations = likersAudienceLocations {
                    self.likersFollowersCountryLocation = likersAudienceLocations.map({.init(code: $0.name, weight: $0.weight)})
                }
                
                
                let likersAudienceCityLocations = modelToProfile.audienceLikers.geoCities
                
                if let likersAudienceCityLocations = likersAudienceCityLocations {
                    self.likersFollowersCityLocation = likersAudienceCityLocations.map({.init(name: $0.name)})
                }
                
                
                let likersGendersPerAge = modelToProfile.audienceLikers.gendersPerAge
                if let likersGendersPerAge = likersGendersPerAge {
                    self.likersGendersPerAge = likersGendersPerAge.map({ .init(code: $0.code, male: $0.male, female: $0.female)})
                }
                     
                DispatchQueue.main.async {
                    self.callFillingFuncs()
                }
                
                print("getting influnecer report is successful")
            }
        }
    }
    
}

//functions to fill views with datas
extension ReportDetailViewController {
    
    func callFillingFuncs() {
        self.reportCollectionView.reloadData()
        self.handleCharts()
        self.handleHashtagsMentions()
        self.handleCredibility()
        self.handleGenderDistribution()
        self.handleFollowersLocation()
        self.agesCollectionView.reloadData()
        self.handleLikersPercentage()
        self.handleLikersGenderDistribution()
        self.handleLikersFollowersLocation()
        self.likersAgesCollectionView.reloadData()
    }
    
    func handleCharts() {
        let indexMonth = chartStatHistory.map({$0.month})
        let indexFollowers = chartStatHistory.map({Double($0.followers)})
        let indexFollowing = chartStatHistory.map({Double($0.following)})
        let indexLikes = chartStatHistory.map({Double($0.avgLikes)})
        followersChart.prepareChartsWithData(yValues: indexFollowers, labels: indexMonth)
        followingChart.prepareChartsWithData(yValues: indexFollowing, labels: indexMonth)
        avgLikesChart.prepareChartsWithData(yValues: indexLikes, labels: indexMonth)
    }
    
    
    func handleHashtagsMentions() {
        hashtagsView.configureHashtags(with: hashtags)
        mentionsView.configureMentions(with: mentions)
    }
    
    func handleCredibility() {
        if let credibility = credibility {
            fakeFollowersView.configurePercentage(with: credibility, title: "Reel Takipçi Oranı (Fake olmayan)", info: "(Influencer 'ı takip edip, aktif olmayan kullanıcılar baz alınarak hesaplanmıştır. )")
        }
        
    }
    
    func handleGenderDistribution() {
        followersGenderDistributionView.configureWight(with: gendersDistribution)
    }
    
    func handleFollowersLocation() {
        followersLocationView.configureFollowersLocations(with: followersCountryLocation, city: followersCityLocation)
    }
    
    //likers
    
    func handleLikersPercentage() {
        if let likersCredibility = likersCredibility {
            likersCredibilityView.configurePercentage(with: likersCredibility, title: "Beğenen kullanıcıların reel oranı", info: nil)
        }
        
        if let likersNonFollowersLikes = likersNonFollowersLikes {
            likersNonFollowersLikesView.configurePercentage(with: likersNonFollowersLikes, title: "Takipçi olmayan kullanıcıların beğenme oranı", info: nil)
        }
        
    }
    
    func handleLikersGenderDistribution() {
        likersFollowersGenderDistributionView.configureWight(with: likersGenderDistribution)
    }
    
    func handleLikersFollowersLocation() {
        likersFollowersLocationView.configureFollowersLocations(with: likersFollowersCountryLocation, city: likersFollowersCityLocation)
    }
    
}

//Collection view

extension ReportDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == reportCollectionView {
            DispatchQueue.main.async {
                let consHeight = self.reportCollectionView.collectionViewLayout.collectionViewContentSize.height
                self.reportCollectionView.frame = CGRect(x: 0, y: 0, width: self.scrollView.width, height: consHeight)
            }
            
            if indexPath.section == 0 {
                // First Details !!!!
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstDetailsCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstDetailsCollectionViewCell
                var firstDetailArray: [String] = []
                
                if let firstDetail = firstDetail {
                    let intFollowers = Int(firstDetail.followers)
                    firstDetailArray.append("\(intFollowers.roundedWithAbbreviations)")
                    
                    let intEngagement = Int(firstDetail.engagements)
                    firstDetailArray.append("\(intEngagement.roundedWithAbbreviations)")
                    firstDetailArray.append("\(firstDetail.clearEngagement) %")
                    
                    if let likeValue = firstDetail.likeValue {
                        let intLikeValue = Int(likeValue)
                        firstDetailArray.append("\(intLikeValue.roundedWithAbbreviations)")
                    }
                    
                    if let followersValue = firstDetail.followersValue {
                        let intFollowersValue = Int(followersValue)
                        firstDetailArray.append("\(intFollowersValue.roundedWithAbbreviations)")
                    }
                    let configCell = sfImages[indexPath.row]
                    cell.configureCell(with: .init(name: configCell.name,
                                                   image: configCell.image,
                                                   explanation: configCell.explanation))
                    
                    let avgLikesDetail = firstDetail.clearLikeCompared
                    let avgFollowersDetail = firstDetail.clearFollowersCompared
                    let secondLabelFillArray = [
                        "\(avgFollowersDetail) %",
                        "\(avgLikesDetail) %",
                        "( takipçi sayısı / beğeni sayısı + yorum sayısı + vs. )",
                        "(***Son 10 post baz alınarak hesaplanmıştır.)",
                        "(***Son 10 post baz alınarak hesaplanmıştır.)"
                    ]
                    
                    
                    cell.secondInfoLabel.text = secondLabelFillArray[indexPath.row]
                    
                    DispatchQueue.main.async {
                        let targetCells = collectionView.numberOfItems(inSection: 0)
                        for x in 0..<targetCells {
                            if let targetCell = collectionView.cellForItem(at: IndexPath(item: x, section: 0)) as? FirstDetailsCollectionViewCell {
                                if x == 0 {
                                    targetCell.changeColorLabel(number: avgFollowersDetail)
                                } else if x == 1 {
                                    targetCell.changeColorLabel(number: avgLikesDetail)
                                }
                            }
                            
                            
                        }
                    }
                    
                    
                    cell.numberLabel.text = firstDetailArray[indexPath.row]
                }
                
                
                
                return cell
                
                
            } else {
                
                // Popular Posts !!!!
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier, for: indexPath) as! PopularPostsCollectionViewCell
                let popularPostIndex = popularPosts[indexPath.row]
                cell.configureCell(with: .init(url: popularPostIndex.url,
                                               created: popularPostIndex.created,
                                               likes: popularPostIndex.likes,
                                               comments: popularPostIndex.comments,
                                               image: popularPostIndex.image))
                return cell
            }
            
    //        return UICollectionViewCell()
            
            
        } else if collectionView == agesCollectionView {
                
//            DispatchQueue.main.async {
//                let consHeight = self.agesCollectionView.collectionViewLayout.collectionViewContentSize.height
//                self.agesCollectionView.frame = CGRect(x: 0, y: 0, width: self.scrollView.width, height: consHeight)
//            }
//
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GendersPerAgeCollectionViewCell.reuseIdentifier, for: indexPath) as! GendersPerAgeCollectionViewCell
            let gendersPerAgeIndex = gendersPerAge[indexPath.row]
            cell.configureCell(with: .init(code: gendersPerAgeIndex.code,
                                           male: gendersPerAgeIndex.male,
                                           female: gendersPerAgeIndex.female))
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikersGendersPerAgeCollectionViewCell.reuseIdentifier, for: indexPath) as! LikersGendersPerAgeCollectionViewCell
//            let gendersPerAgeIndex = gendersPerAge[indexPath.row]
//            cell.configureCell(with: .init(code: gendersPerAgeIndex.code,
//                                           male: gendersPerAgeIndex.male,
//                                           female: gendersPerAgeIndex.female))
            
            let likersGendersPerAgeIndex = likersGendersPerAge[indexPath.row]
            cell.configureCell(with: .init(code: likersGendersPerAgeIndex.code,
                                           male: likersGendersPerAgeIndex.male,
                                           female: likersGendersPerAgeIndex.female))
            return cell
        }
        
//        return UICollectionViewCell()
      
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == reportCollectionView {
            return 2
        } else if collectionView == agesCollectionView{
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
        } else {
            return likersGendersPerAge.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == reportCollectionView {
            if indexPath.section == 0 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier, for: indexPath) as! FirstDetailsCollectionReusableView
                
                reuseView.configureProfile(with: .init(fullName: influencerDetails?.fullName,
                                                       username: influencerDetails?.username,
                                                       picture: influencerDetails?.picture))
                return reuseView
            } else if indexPath.section == 1 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier, for: indexPath)
                return reuseView
            }
        }
        
        
        return UICollectionReusableView()
    }
    
}

