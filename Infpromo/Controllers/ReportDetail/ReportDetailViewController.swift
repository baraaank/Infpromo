//
//  ReportDetailViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

struct SFImagesForReport {
    let name: String
    let image: String
}

class ReportDetailViewController: UIViewController {
    
    var sfImages: [SFImagesForReport] = [
        SFImagesForReport(name: "followers", image: "person"),
        SFImagesForReport(name: "engagement", image: "heart"),
        SFImagesForReport(name: "engagementRate", image: "network"),
        SFImagesForReport(name: "like", image: "heart"),
        SFImagesForReport(name: "comment", image: "text.bubble")
    ]
    
    var influencerId = ""
    
    var influencerDetails: ReportDetailViewModel?
    
    private let collectionView: UICollectionView = {
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
            } else {
                
                
                
                // graphs
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
            }
            
    })
        
        
        collectionView.register(FirstDetailsCollectionViewCell.self, forCellWithReuseIdentifier: FirstDetailsCollectionViewCell.reuseIdentifier)
        collectionView.register(FirstDetailsCollectionReusableView.self, forSupplementaryViewOfKind: FirstDetailsCollectionReusableView.kind, withReuseIdentifier: FirstDetailsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(PopularPostsCollectionViewCell.self, forCellWithReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier)
        collectionView.register(PopularPostsCollectionReusableView.self, forSupplementaryViewOfKind: PopularPostsCollectionReusableView.kind, withReuseIdentifier: PopularPostsCollectionReusableView.reuseIdentifier)
        
        
        collectionView.register(ChartsCollectionViewCell.self, forCellWithReuseIdentifier: ChartsCollectionViewCell.reuseIdentifier)
        collectionView.register(ChartsCollectionReusableView.self, forSupplementaryViewOfKind: ChartsCollectionReusableView.kind, withReuseIdentifier: ChartsCollectionReusableView.reuseIdentifier)
        
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        print(influencerId)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
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
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                print("getting influnecer report is successful")
            }
        }
    }
    
    
}


extension ReportDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstDetailsCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstDetailsCollectionViewCell
            
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularPostsCollectionViewCell.reuseIdentifier, for: indexPath) as! PopularPostsCollectionViewCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartsCollectionViewCell.reuseIdentifier, for: indexPath) as! ChartsCollectionViewCell
            
            return cell
        }
        
//        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 5
        } else if section == 1 {
            return 10
        } else {
            return 4
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
        }
        
        return UICollectionReusableView()
    }
    
}

