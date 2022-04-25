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
    
    private let reportCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewCompositionalLayout { sectionNumber,env in
            
            if sectionNumber == 0 {
                //first informations
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.24))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5)), elementKind: FirstDetailsCollectionReusableView.kind, alignment: .top)
                ]
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
                return section
            } else if sectionNumber == 1 {
                
                
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
            } else if sectionNumber == 2 {
                
                
                
                // charts
                let headerAnchor = NSCollectionLayoutAnchor(edges: .top, fractionalOffset: CGPoint(x: 0, y: -1.2))
                let header = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.1)), elementKind: ChartsCollectionReusableView.kind, containerAnchor: headerAnchor)
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [
                    header
                ])
                
                
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 48, leading: 8, bottom: 8, trailing: 8)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.28))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 16
                
                return section
            } else {
                
                //hashtags and mentions
                let headerAnchor = NSCollectionLayoutAnchor(edges: .top, fractionalOffset: CGPoint(x: 0, y: -1.2))
                let header = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.1)), elementKind: HashtagsMentionsCollectionReusableView.kind, containerAnchor: headerAnchor)
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [
                    header
                ])
                
                
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 48, leading: 8, bottom: 8, trailing: 8)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.28))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 16
                
                return section
            }
            
    })
        
        
        collectionView.register(FirstDetailsCollectionViewCell.self, forCellWithReuseIdentifier: FirstDetailsCollectionViewCell.reuseIdentifier)
        collectionView.register(FirstDetailsCollectionReusableView.self, forSupplementaryViewOfKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(PopularPostsCollectionViewCell.self, forCellWithReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier)
        collectionView.register(PopularPostsCollectionReusableView.self, forSupplementaryViewOfKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(ChartsCollectionViewCell.self, forCellWithReuseIdentifier: ChartsCollectionViewCell.reuseIdentifier)
        collectionView.register(ChartsCollectionReusableView.self, forSupplementaryViewOfKind: ChartsCollectionReusableView.kind, withReuseIdentifier: ChartsCollectionReusableView.reuseIdentifier)
        
        collectionView.register(HashtagsMentionsCollectionViewCell.self, forCellWithReuseIdentifier: HashtagsMentionsCollectionViewCell.reuseIdentifier)
        collectionView.register(HashtagsMentionsCollectionReusableView.self, forSupplementaryViewOfKind: HashtagsMentionsCollectionReusableView.kind, withReuseIdentifier: HashtagsMentionsCollectionReusableView.reuseIdentifier)
        
        
        
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(reportCollectionView)
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
        
        
        print(influencerId)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reportCollectionView.frame = view.bounds
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        loadViewElements()
//    }
    
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
                let influencerDetail = model.data.pdfBody.data.profile.profile
                self.influencerDetails = .init(fullName: influencerDetail.fullname,
                                               username: influencerDetail.username,
                                               picture: influencerDetail.picture)
                
                let avgDetail = model.data.pdfBody.data.profile
                self.firstDetail = .init(followers: influencerDetail.followers,
                                         engagementRate: influencerDetail.engagementRate,
                                         engagements: influencerDetail.engagements,
                                         likeValue: avgDetail.avgLikes,
                                         likeCompared: avgDetail.stats.avgLikes.compared,
                                         followersValue: avgDetail.avgComments,
                                         followersCompared: avgDetail.stats.followers.compared)
                
                let popularPostsFromModel = model.data.pdfBody.data.profile.popularPosts
                self.popularPosts.append(contentsOf: popularPostsFromModel.map({
                    .init(url: $0.url,
                          created: $0.created,
                          likes: $0.likes,
                          comments: $0.comments,
                          image: $0.image)
                }))
                
                
                let chartHistory = model.data.pdfBody.data.profile.statHistory
                
                self.chartStatHistory.append(contentsOf: chartHistory.map({
                    .init(month: $0.month,
                          followers: $0.followers,
                          avgLikes: $0.avgLikes,
                          following: $0.following)
                }))
                
                print(self.chartStatHistory)
                
                DispatchQueue.main.async {
                    self.reportCollectionView.reloadData()
                }
                
                print("getting influnecer report is successful")
            }
        }
    }
    
    
}


extension ReportDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
                
                    
                
                
                
                
                // if stats bigge than zero it should be green otherwise red don't forget
                
                
                
                cell.numberLabel.text = firstDetailArray[indexPath.row]
                 
                
                
            }
            
            
            
            return cell
            
            
        } else if indexPath.section == 1 {
            
            
            // Popular Posts !!!!
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier, for: indexPath) as! PopularPostsCollectionViewCell
            let popularPostIndex = popularPosts[indexPath.row]
            cell.configureCell(with: .init(url: popularPostIndex.url,
                                           created: popularPostIndex.created,
                                           likes: popularPostIndex.likes,
                                           comments: popularPostIndex.comments,
                                           image: popularPostIndex.image))
            return cell
        } else if indexPath.section == 2 {
            
            
            //charts !!!!!!
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartsCollectionViewCell.reuseIdentifier, for: indexPath) as! ChartsCollectionViewCell
            
            let indexMonth = chartStatHistory.map({$0.month})
            let indexFollowers = chartStatHistory.map({Double($0.followers)})
            let indexFollowing = chartStatHistory.map({Double($0.following)})
            let indexLikes = chartStatHistory.map({Double($0.avgLikes)})
            print(indexLikes)
            
            DispatchQueue.main.async {
                if let selectedCell = collectionView.cellForItem(at: .init(item: 0, section: 2)) as? ChartsCollectionViewCell {
                    selectedCell.prepareChartsWithData(yValues: indexFollowers, labels: indexMonth)
                }
                
                if let selectedCell = collectionView.cellForItem(at: .init(item: 1, section: 2)) as? ChartsCollectionViewCell {
                    selectedCell.prepareChartsWithData(yValues: indexFollowing, labels: indexMonth)
                }

                
                if let selectedCell = collectionView.cellForItem(at: .init(item: 3, section: 2)) as? ChartsCollectionViewCell {
                    selectedCell.prepareChartsWithData(yValues: indexLikes, labels: indexMonth)
                }
            }
            

            
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashtagsMentionsCollectionViewCell.reuseIdentifier, for: indexPath)
            
            return cell
        }
        
//        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 5
        } else if section == 1 {
            return popularPosts.count
        } else if section == 2 {
            return 4
        } else {
            return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier, for: indexPath) as! FirstDetailsCollectionReusableView
            
            reuseView.configureProfile(with: .init(fullName: influencerDetails?.fullName,
                                                   username: influencerDetails?.username,
                                                   picture: influencerDetails?.picture))
            return reuseView
        } else if indexPath.section == 1 {
            let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier, for: indexPath)
            return reuseView
        } else if indexPath.section == 2 {
            let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: ChartsCollectionReusableView.kind, withReuseIdentifier: ChartsCollectionReusableView.reuseIdentifier, for: indexPath)
            return reuseView
        } else if indexPath.section == 3 {
            let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: HashtagsMentionsCollectionReusableView.kind, withReuseIdentifier: HashtagsMentionsCollectionReusableView.reuseIdentifier, for: indexPath)
            
            return reuseView
        }
        
        return UICollectionReusableView()
    }
    
}

