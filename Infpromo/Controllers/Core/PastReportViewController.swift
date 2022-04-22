//
//  PastReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit
import SkeletonView

class PastReportViewController: UIViewController {
    
   
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
 
            let topLeftAnchor = NSCollectionLayoutAnchor(edges: [.top, .leading], fractionalOffset: CGPoint(x: 0, y: -1))
            let topLeftView = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalWidth(0.08)), elementKind: MyReportsDateCollectionReusableView.kind, containerAnchor: topLeftAnchor)
            
            let topRightAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0, y: -1))
            let topRightView = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalWidth(0.08)), elementKind: MyReportsPlatformCollectionReusableView.kind, containerAnchor: topRightAnchor)

            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [topLeftView, topRightView])
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            group.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8

            
            return section
        }))
        
        collectionView.register(PastReportCollectionViewCell.self, forCellWithReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier)
        collectionView.register(MyReportsDateCollectionReusableView.self, forSupplementaryViewOfKind: MyReportsDateCollectionReusableView.kind, withReuseIdentifier: MyReportsDateCollectionReusableView.reuseIdentifier)
        collectionView.register(MyReportsPlatformCollectionReusableView.self, forSupplementaryViewOfKind: MyReportsPlatformCollectionReusableView.kind, withReuseIdentifier: MyReportsPlatformCollectionReusableView.reuseIdentifier)
        
        collectionView.backgroundColor = .systemGray6


        
        
        return collectionView
    }()
    
    
    var logDates: [String] = []
    
    var profileResponseArray: [MyReportsCollectionViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Raporlarım"
        view.backgroundColor = .systemGray6
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        addSubviews()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadViewElements()
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        navigationController?.navigationBar.barTintColor = .systemGray6
    }
//
    func loadViewElements() {
        APICaller.shared.getUserReports { response in
            switch response {
            case .success(let model):
                var responseArray: [MyReportsCollectionViewCellViewModel] = []
                responseArray.append(contentsOf: model.data.reports.map({
                    .init(fullname: $0.data.profile.fullname,
                          username: $0.data.profile.username,
                          url: $0.data.profile.url,
                          picture: $0.data.profile.picture,
                          followers: $0.data.profile.followers,
                          engagementRate: $0.data.profile.engagementRate,
                          engagements: $0.data.profile.engagements,
                          date: $0.userCreatedDate,
                          network: $0.network,
                          influencerId: $0.data.userId)
                }))
                
               
                
                print(self.logDates)
                
                
                self.profileResponseArray = responseArray
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
    
    @objc func usernameButtonTapped(sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        
        
        if let id = profileResponseArray[indexPath.row].username {
            if let url = URL(string: "http://www.instagram.com/\(id)/") {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
    @objc func goToDetailButtonTapped(sender: CustomFilterButton) {
        
        let indexPath = IndexPath(row: sender.row, section: sender.section)

        
        if let influencerId = profileResponseArray[indexPath.row].influencerId {
            let vc = ReportDetailViewController()
            vc.influencerId = influencerId
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
        
    }
    
}

//UICollectionView
extension PastReportViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if profileResponseArray.count == 0 {
            return 10
        } else {
            return profileResponseArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier, for: indexPath) as! PastReportCollectionViewCell
        cell.backgroundColor = .white
        
        cell.usernameButton.row = indexPath.row
        cell.usernameButton.section = indexPath.section
        cell.usernameButton.addTarget(self, action: #selector(usernameButtonTapped), for: .touchUpInside)
        
        cell.goToDetailButton.row = indexPath.row
        cell.goToDetailButton.section = indexPath.section
        cell.goToDetailButton.addTarget(self, action: #selector(goToDetailButtonTapped), for: .touchUpInside)
        
//        cell.layer.borderColor = UIColor.tertiaryLabel.cgColor
//        cell.layer.borderWidth = 1
        if profileResponseArray.count == 0{
            //do skeleton view
//            cell.contentView.backgroundColor = .white
            cell.isSkeletonable = true
            cell.showAnimatedGradientSkeleton()
        } else {
            let profileResponse = profileResponseArray[indexPath.row]
            cell.configureCellData(with: MyReportsCollectionViewCellViewModel(fullname: profileResponse.fullname,
                                                                              username: profileResponse.username,
                                                                              url: profileResponse.url,
                                                                              picture: profileResponse.picture,
                                                                              followers: profileResponse.followers,
                                                                              engagementRate: profileResponse.engagementRate,
                                                                              engagements: profileResponse.engagements,
                                                                              date: profileResponse.date,
                                                                              network: nil,
                                                                              influencerId: profileResponse.influencerId))
            cell.contentView.backgroundColor = .clear
            cell.contentView.isHidden = false
            cell.hideSkeleton()
            //configure cell with model
        }
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        
        switch kind {
        case MyReportsDateCollectionReusableView.kind:
            let dateLabel = collectionView.dequeueReusableSupplementaryView(ofKind: MyReportsDateCollectionReusableView.kind, withReuseIdentifier: MyReportsDateCollectionReusableView.reuseIdentifier, for: indexPath) as! MyReportsDateCollectionReusableView
            dateLabel.layer.cornerRadius = 2
            
            
            
            if profileResponseArray.isEmpty {
//                dateLabel.isSkeletonable = true
//                dateLabel.showAnimatedGradientSkeleton()
            } else {
                
                dateLabel.configureCell(with: profileResponseArray[indexPath.row].date!)
                
                dateLabel.hideSkeleton()
                dateLabel.isHidden = false
                
            }
            
            return dateLabel
        case MyReportsPlatformCollectionReusableView.kind:
            let platformLabel = collectionView.dequeueReusableSupplementaryView(ofKind: MyReportsPlatformCollectionReusableView.kind, withReuseIdentifier: MyReportsPlatformCollectionReusableView.reuseIdentifier, for: indexPath) as! MyReportsPlatformCollectionReusableView
            platformLabel.layer.cornerRadius = 2
            
            if profileResponseArray.isEmpty {
//                platformLabel.isSkeletonable = true
//                platformLabel.showAnimatedGradientSkeleton()
            } else {
                platformLabel.configureCell(with: profileResponseArray[indexPath.row].network!)
                platformLabel.hideSkeleton()
            }
            
            
            return platformLabel
        default:
            print("default error")
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
    
    
    
}

