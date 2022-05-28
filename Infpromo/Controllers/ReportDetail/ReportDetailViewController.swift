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
    var platform = ""
    
    var influencerDetails: ReportDetailViewModel?
    var firstDetail: FirstDetailViewModel?
    var popularPosts: [PopularPostViewModel] = []
    var chartStatHistory: [ChartsViewModel] = []
    var chartStatHistoryComLike: [ChartsAvgLikesCommentsViewModel] = []
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
    
    //notable
    var notableUsersModel: [SearchWithFilterCellViewModel] = []
    var notableLikersModel: [SearchWithFilterCellViewModel] = []
    
    
    var colors: [UIColor] = []
    
    
    var influencerIds: [String] = []
    var audienceInfluencerIds: [String] = []
    var myInfluencerIds: [String] = []
    var reportsCount = 0
    
    var titlesOfButton: [String] = []
    var buttonColors: [UIColor] = []
    
    var audienceTitlesOfButton: [String] = []
    var audienceButtonColors: [UIColor] = []
    
    
    private let firstChartLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçiler bu ay xxx artış göstermiş", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let secondChartLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takip edilen sayısı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let thirdChartLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Son 8 Post Etkileşimleri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let fourthChartLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Beğeni sayısı bu ay xxx artış göstermiş", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let hashtagsLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Popüler # (hastags)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let mentionsLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Popüler @ (mentions)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let audienceDatasLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçilere göre kitle verileri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let audienceAgeGenderLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi Yaş ve Cinsiyet Grafikleri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let likersDataLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Beğenenlere göre kitle verileri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let likersAgeGenderLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Beğenenlerin Yaş ve Cinsiyet Grafikleri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let notableFollowersLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçilerin referans kullanıcıları (Notable followers)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let notableLikersLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Beğenenlerin referans kullanıcıları (Notable likers)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.backgroundColor = .clear
        return label
    }()
    
    private let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    private let reportCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewCompositionalLayout { sectionNumber,env in
            
            if sectionNumber == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), elementKind: FirstDetailsCollectionReusableView.kind, alignment: .top)
                ]
                
                
                return section
            } else {

                //populer posts
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.8))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
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
        
      
        collectionView.backgroundColor = .systemGray6
        collectionView.isScrollEnabled = false
        
        
        return collectionView
    }()
    
    
    private lazy var agesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutCircle())
        
        collectionView.register(GendersPerAgeCollectionViewCell.self, forCellWithReuseIdentifier: GendersPerAgeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    private lazy var likersAgesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutCircle())
        collectionView.register(LikersGendersPerAgeCollectionViewCell.self, forCellWithReuseIdentifier: LikersGendersPerAgeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
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
        collectionView.register(NotableUsersCollectionViewCell.self, forCellWithReuseIdentifier: NotableUsersCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    private lazy var notableLikersCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: notableCollectionViewLayout())
        collectionView.register(NotableLikersCollectionViewCell.self, forCellWithReuseIdentifier: NotableLikersCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    
    
    
    //create charts views
    let followersChart = ChartsView()
    let followingChart = ChartsView()
    let avgLikesChart = ChartsView()
    let commentLikeChart = ChartsCommentLikeView()
    
    
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
        
        notableUsersCollectionView.delegate = self
        notableUsersCollectionView.dataSource = self
        
        notableLikersCollectionView.delegate = self
        notableLikersCollectionView.dataSource = self
        
        
        print(influencerId)
        view.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = UIColor().infpromo
        
        
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        reportCollectionView.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: reportCollectionView.contentSize.height + 1)
        firstChartLabel.frame = CGRect(x: 10, y: reportCollectionView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        followersChart.frame = CGRect(x: 10, y: firstChartLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.8)
        secondChartLabel.frame = CGRect(x: 10, y: followersChart.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        followingChart.frame = CGRect(x: 10, y: secondChartLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.8)
        thirdChartLabel.frame = CGRect(x: 10, y: followingChart.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        commentLikeChart.frame = CGRect(x: 10, y: thirdChartLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.8)
        fourthChartLabel.frame = CGRect(x: 10, y: commentLikeChart.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        avgLikesChart.frame = CGRect(x: 10, y: fourthChartLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.8)
        hashtagsLabel.frame = CGRect(x: 10, y: avgLikesChart.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        
        hashtagsView.frame = CGRect(x: 10, y: hashtagsLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        mentionsLabel.frame = CGRect(x: 10, y: hashtagsView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        mentionsView.frame = CGRect(x: 10, y: mentionsLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        
        
        audienceDatasLabel.frame = CGRect(x: 10, y: mentionsView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        fakeFollowersView.frame = CGRect(x: 10, y: audienceDatasLabel.bottom + 10, width: scrollView.width - 20, height: view.width * 0.6)
        
        
        followersGenderDistributionView.frame = CGRect(x: 10, y: fakeFollowersView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        followersLocationView.frame = CGRect(x: 10, y: followersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.4)
        audienceAgeGenderLabel.frame = CGRect(x: 10, y: followersLocationView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        agesCollectionView.frame = CGRect(x: 0, y: audienceAgeGenderLabel.bottom + 2, width: scrollView.width, height: agesCollectionView.contentSize.height + 0.1)
        
        likersDataLabel.frame = CGRect(x: 10, y: agesCollectionView.bottom + 2, width: view.width - 20, height: view.width * 0.1)
        likersCredibilityView.frame = CGRect(x: 10, y: likersDataLabel.bottom + 10, width: (view.width / 2) - 15, height: view.width * 0.6)
        likersNonFollowersLikesView.frame = CGRect(x: likersCredibilityView.right + 10, y: likersDataLabel.bottom + 10, width: (view.width / 2) - 15, height: view.width * 0.6)
        
        likersFollowersGenderDistributionView.frame = CGRect(x: 10, y: likersNonFollowersLikesView.bottom + 10, width: view.width - 20, height: view.width * 0.6)
        likersFollowersLocationView.frame = CGRect(x: 10, y: likersFollowersGenderDistributionView.bottom + 10, width: view.width - 20, height: view.width * 1.4)
        likersAgeGenderLabel.frame = CGRect(x: 10, y: likersFollowersLocationView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        likersAgesCollectionView.frame = CGRect(x: 0, y: likersAgeGenderLabel.bottom + 2, width: scrollView.width, height: likersAgesCollectionView.contentSize.height + 0.1)
        
        notableLikersLabel.frame = CGRect(x: 10, y: likersAgesCollectionView.bottom + 2, width: view.width - 20, height: view.width * 0.1)
        notableUsersCollectionView.frame = CGRect(x: 0, y: notableLikersLabel.bottom + 10, width: view.width, height: notableUsersCollectionView.contentSize.height + 0.1)
        notableFollowersLabel.frame = CGRect(x: 10, y: notableUsersCollectionView.bottom + 10, width: view.width - 20, height: view.width * 0.1)
        notableLikersCollectionView.frame = CGRect(x: 0, y: notableFollowersLabel.bottom + 10, width: view.width, height: notableLikersCollectionView.contentSize.height + 0.1)
        
        
        
        
        
        
        scrollView.contentSize = CGSize(width: view.width, height: reportCollectionView.height + followersChart.height + followingChart.height + avgLikesChart.height + hashtagsView.height + mentionsView.height + fakeFollowersView.height + followersGenderDistributionView.height + followersLocationView.height + agesCollectionView.height + likersCredibilityView.height + likersNonFollowersLikesView.height + likersFollowersGenderDistributionView.height + likersFollowersLocationView.height + likersAgesCollectionView.height + notableUsersCollectionView.height + notableLikersCollectionView.height + 300 + view.width * 1.4)
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(reportCollectionView)
        scrollView.addSubview(followersChart)
        scrollView.addSubview(followingChart)
        scrollView.addSubview(commentLikeChart)
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
        scrollView.addSubview(notableUsersCollectionView)
        scrollView.addSubview(notableLikersCollectionView)
        
        scrollView.addSubview(firstChartLabel)
        scrollView.addSubview(secondChartLabel)
        scrollView.addSubview(thirdChartLabel)
        scrollView.addSubview(fourthChartLabel)
        
        scrollView.addSubview(hashtagsLabel)
        scrollView.addSubview(mentionsLabel)
        scrollView.addSubview(audienceDatasLabel)
        scrollView.addSubview(audienceAgeGenderLabel)
        scrollView.addSubview(likersDataLabel)
        scrollView.addSubview(likersAgeGenderLabel)
        scrollView.addSubview(notableFollowersLabel)
        scrollView.addSubview(notableLikersLabel)
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nilForViewWillAppear()
        DispatchQueue.main.async {
            self.loadViewElements()
        }
        
    }
    
    func nilForViewWillAppear() {
        
        colors.removeAll()
        
        influencerDetails = nil
        firstDetail = nil
        popularPosts.removeAll()
        chartStatHistory.removeAll()
        chartStatHistoryComLike.removeAll()
        hashtags.removeAll()
        mentions.removeAll()
        
        hashtagsView.deleteComponents()
        mentionsView.deleteComponents()
        
        //followers datas
        credibility = nil
        gendersDistribution.removeAll()
        followersCountryLocation.removeAll()
        followersCityLocation.removeAll()
        gendersPerAge.removeAll()
        
        //audience
        likersCredibility = nil
        likersNonFollowersLikes = nil
        likersGenderDistribution.removeAll()
        likersFollowersCountryLocation.removeAll()
        likersFollowersCityLocation.removeAll()
        likersGendersPerAge.removeAll()
        
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
    
    
    private func loadViewElements() {
        
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
                print("getting influncer report error: \(error)")
            case .success(let model):
                
                let modelToProfile = model.data.pdfBody.data.profile
                let influencerDetail = modelToProfile.profile
                
                    self.influencerDetails = .init(fullName: influencerDetail?.fullname,
                                                   username: influencerDetail?.username,
                                                   picture: influencerDetail?.picture,
                                                   url: influencerDetail?.url)
                
                
                
                
                let avgDetail = modelToProfile
                
                
                self.firstDetail = .init(followers: influencerDetail?.followers ?? 0,
                                         engagementRate: influencerDetail?.engagementRate ?? 0,
                                         engagements: influencerDetail?.engagements ?? 0,
                                         likeValue: avgDetail.avgLikes,
                                         likeCompared: avgDetail.stats?.avgLikes?.compared ?? 1,
                                         followersValue: avgDetail.avgComments,
                                         followersCompared: avgDetail.stats?.followers?.compared ?? 1)
                
                
                
          
               
                
                self.colors = Array(repeating: .green, count: 2)
                if avgDetail.avgLikes! > 0 {
                    self.colors.insert(.green, at: 0)
                } else {
                    self.colors.insert(.red, at: 0)
                }
                
                if avgDetail.avgComments! > 0 {
                    self.colors.insert(.green, at: 1)
                } else {
                    self.colors.insert(.red, at: 1)
                }
                
                
                let popularPostsFromModel = modelToProfile.popularPosts
                if let popularPostsFromModel = popularPostsFromModel {
                    self.popularPosts.append(contentsOf: popularPostsFromModel.map({
                        .init(url: $0.url ?? "",
                              created: $0.created ?? "",
                              likes: $0.likes ?? 0,
                              comments: $0.comments ?? 0,
                              image: $0.image ?? "")
                    }))
                }
                
                
                
                let chartHistory = modelToProfile.statHistory
                
                if let chartHistory = chartHistory {
                    self.chartStatHistory.append(contentsOf: chartHistory.map({
                        .init(month: $0.month,
                              followers: $0.followers ?? 1,
                              avgLikes: $0.avgLikes,
                              following: $0.following ?? 1)
                    }))
                }
               
                
                
                let chartCommentLike = modelToProfile.recentPosts
                
                if let chartCommentLike = chartCommentLike {
                    self.chartStatHistoryComLike.append(contentsOf: chartCommentLike.map({
                        .init(likes: $0.likes ?? 0,
                              comments: $0.comments ?? 0,
                              created: $0.created ?? "")
                    }))
                }
                
                
                
                let tagModel = modelToProfile
                if let tagHashtags = tagModel.hashtags {
                    self.hashtags.append(contentsOf: tagHashtags.map({
                        .init(hashtag: $0.tag)
                    }))
                }
                
                if let tagMentions = tagModel.mentions {
                    self.mentions.append(contentsOf: tagMentions.map({
                        .init(mention: $0.tag)
                    }))
                }
                
               
                
                if let credibilityModel = modelToProfile.audience {
                    self.credibility = .init(credibility: credibilityModel.credibility ?? 0)
                }
                
                
                if let genderDistributionModel = modelToProfile.audience?.genders {
                    self.gendersDistribution = genderDistributionModel.map({.init(code: $0.code, weight: $0.weight)})
                }
                
                
                if let audienceLocations = modelToProfile.audience?.geoCountries {
                    self.followersCountryLocation = audienceLocations.map({.init(code: $0.name, weight: $0.weight)})
                }
                
                
                if let audienceCityLocations = modelToProfile.audience?.geoCities {
                    self.followersCityLocation = audienceCityLocations.map({.init(name: $0.name)})
                }
                
                
                if let gendersPerAge = modelToProfile.audience?.gendersPerAge {
                    self.gendersPerAge = gendersPerAge.map({ .init(code: $0.code, male: $0.male, female: $0.female)})
                }
                
                
                if let likersCredibilityModel = modelToProfile.audienceLikers {
                    self.likersCredibility = .init(credibility: likersCredibilityModel.credibility ?? 0.0)
                }
                
                
                if let likersNonFollowersLikesModel = modelToProfile.audienceLikers {
                    self.likersNonFollowersLikes = .init(credibility: likersNonFollowersLikesModel.nonFollowerLikes ?? 0.0)
                }
                
                
                let likersGenderDistributionModel = modelToProfile.audienceLikers?.genders
                
                if let likersGenderDistributionModel = likersGenderDistributionModel {
                    self.likersGenderDistribution = likersGenderDistributionModel.map({.init(code: $0.code, weight: $0.weight)})
                }
                
                
                let likersAudienceLocations = modelToProfile.audienceLikers?.geoCountries
                if let likersAudienceLocations = likersAudienceLocations {
                    self.likersFollowersCountryLocation = likersAudienceLocations.map({.init(code: $0.name, weight: $0.weight)})
                }
                
                
                let likersAudienceCityLocations = modelToProfile.audienceLikers?.geoCities
                
                if let likersAudienceCityLocations = likersAudienceCityLocations {
                    self.likersFollowersCityLocation = likersAudienceCityLocations.map({.init(name: $0.name)})
                }
                
                
                let likersGendersPerAge = modelToProfile.audienceLikers?.gendersPerAge
                if let likersGendersPerAge = likersGendersPerAge {
                    self.likersGendersPerAge = likersGendersPerAge.map({ .init(code: $0.code, male: $0.male, female: $0.female)})
                }
                
                let userNotableLikes = modelToProfile.audience?.notableUsers
                
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
                
                if let notablesLikes = modelToProfile.audienceLikers?.notableUsers {
                
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
                
                print("getting influnecer report is successful")
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
    
    
    func attributedIncreaseDecrease(avg: Double, stringOne: String) -> NSMutableAttributedString {
        let clearAvg = AbbreviationsHelper.clear(doubleOne: avg)
        let stringTwo = "\(clearAvg)%"
        let range = (stringOne as NSString).range(of: stringTwo)
        let attributedText = NSMutableAttributedString.init(string: stringOne, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        if avg > 0 {
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
        } else {
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        }
        return attributedText
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
        let responseIndex = influencerDetails?.url
        if let url = responseIndex {
            if let urlString = URL(string: url) {
                UIApplication.shared.open(urlString)
            }
        }
    }
    
}

//functions to fill views with datas
extension ReportDetailViewController {
    
    
    
    func callFillingFuncs() {
        self.reportCollectionView.reloadData()
        self.attributedLabel()
        self.handleCharts()
        self.handleBarChart()
        self.handleHashtagsMentions()
        self.handleCredibility()
        self.handleGenderDistribution()
        self.handleFollowersLocation()
        self.agesCollectionView.reloadData()
        self.handleLikersPercentage()
        self.handleLikersGenderDistribution()
        self.handleLikersFollowersLocation()
        self.likersAgesCollectionView.reloadData()
        self.notableUsersCollectionView.reloadData()
        self.notableLikersCollectionView.reloadData()
    }
    
    func attributedLabel() {
        let firstDetailAvarages = firstDetail?.likeCompared
        if let avg = firstDetailAvarages {
            let clearAvg = AbbreviationsHelper.clear(doubleOne: avg)
            var attributesFrom: NSMutableAttributedString?
            if avg > 0 {
                attributesFrom = self.attributedIncreaseDecrease(avg: avg, stringOne: "Beğeniler bu ay \(clearAvg)% artış göstermiş")
            } else {
                attributesFrom = self.attributedIncreaseDecrease(avg: avg, stringOne: "Beğeniler bu ay \(clearAvg)% azalma göstermiş")
            }
            self.fourthChartLabel.attributedText = attributesFrom
        }
        let firstDetailFollowersAvarage = firstDetail?.followersCompared
        if let avgFollowers = firstDetailFollowersAvarage {
            let clearAvgFollowers = AbbreviationsHelper.clear(doubleOne: avgFollowers)
            var attributesFromFollowers: NSMutableAttributedString?
            if avgFollowers > 0 {
                attributesFromFollowers = self.attributedIncreaseDecrease(avg: avgFollowers, stringOne: "Takipçiler bu ay \(clearAvgFollowers)% artış göstermiş")
            } else {
                attributesFromFollowers = self.attributedIncreaseDecrease(avg: avgFollowers, stringOne: "Takipçiler bu ay \(clearAvgFollowers)% azalma göstermiş")
            }
            self.firstChartLabel.attributedText = attributesFromFollowers
        }
    }
    
    func handleBarChart() {
        let indexLikes = chartStatHistoryComLike.map({$0.likes})
        let indexComments = chartStatHistoryComLike.map({$0.comments})
        let indexDates = chartStatHistoryComLike.map({$0.created})
        
        commentLikeChart.handleChart(likes: indexLikes, comments: indexComments, created: indexDates)
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
                    
                    let avgColorsZero = colors[0]
                    let avgColorsFirst = colors[1]
                    
                    if let targetCell = collectionView.cellForItem(at: .init(row: 0, section: 0)) as? FirstDetailsCollectionViewCell {
                        targetCell.changeColorLabel(colors: avgColorsZero)
                    }
                    
                    if let targetCell = collectionView.cellForItem(at: .init(row: 1, section: 0)) as? FirstDetailsCollectionViewCell {
                        targetCell.changeColorLabel(colors: avgColorsFirst)
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
                
                cell.photoImageView.row = indexPath.row
                cell.photoImageView.section = indexPath.section
                
                let tapGestureRecognizer = CustomTapGesture(target: self, action: #selector(tapGestureRecognizer))
                tapGestureRecognizer.row = indexPath.row
                tapGestureRecognizer.section = indexPath.section
                
                cell.photoImageView.addGestureRecognizer(tapGestureRecognizer)
                
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
            
        } else if collectionView == likersAgesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikersGendersPerAgeCollectionViewCell.reuseIdentifier, for: indexPath) as! LikersGendersPerAgeCollectionViewCell
            
            let likersGendersPerAgeIndex = likersGendersPerAge[indexPath.row]
            cell.configureCell(with: .init(code: likersGendersPerAgeIndex.code,
                                           male: likersGendersPerAgeIndex.male,
                                           female: likersGendersPerAgeIndex.female))
            return cell
        } else if collectionView == notableUsersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotableUsersCollectionViewCell.reuseIdentifier, for: indexPath) as! NotableUsersCollectionViewCell
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotableLikersCollectionViewCell.reuseIdentifier, for: indexPath) as! NotableLikersCollectionViewCell
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
        
//        return UICollectionViewCell()
      
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == reportCollectionView {
            return 2
        } else if collectionView == agesCollectionView {
            return 1
        } else if collectionView == likersAgesCollectionView {
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
        } else if collectionView == likersAgesCollectionView {
            return likersGendersPerAge.count
        } else if collectionView == notableUsersCollectionView {
            return notableUsersModel.count
        } else {
            return notableLikersModel.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == reportCollectionView {
            if indexPath.section == 0 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier, for: indexPath) as! FirstDetailsCollectionReusableView
                
                reuseView.configureProfile(with: .init(fullName: influencerDetails?.fullName,
                                                       username: influencerDetails?.username,
                                                       picture: influencerDetails?.picture,
                                                       url: influencerDetails?.url ))
                reuseView.usernameButton.row = indexPath.row
                reuseView.usernameButton.section = indexPath.section
                reuseView.usernameButton.addTarget(self, action: #selector(headUsernameButtonTapped), for: .touchUpInside)
                return reuseView
            } else if indexPath.section == 1 {
                let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier, for: indexPath)
                    
                return reuseView
            }
              
            
        }
        
        
        return UICollectionReusableView()
    }
    
}

