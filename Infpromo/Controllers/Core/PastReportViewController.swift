//
//  PastReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class PastReportViewController: UIViewController {
    
   
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
 
            let topLeftAnchor = NSCollectionLayoutAnchor(edges: [.top, .leading], fractionalOffset: CGPoint(x: 0.03, y: -0.6))
            let topLeftView = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.08)), elementKind: MyReportsDateCollectionReusableView.kind, containerAnchor: topLeftAnchor)
            
            let topRightAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: -0.04, y: -0.45))
            let topRightView = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.08), heightDimension: .fractionalWidth(0.08)), elementKind: MyReportsPlatformCollectionReusableView.kind, containerAnchor: topRightAnchor)

            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [topLeftView, topRightView])
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.34))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
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
    
    
    
    var profileResponseArray: [ProfResResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Reports"
        view.backgroundColor = .systemGray6
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        addSubviews()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadViewElements()
        
    }
//
    func loadViewElements() {
        APICaller.shared.getUserReports { response in
            switch response {
            case .success(let model):
                var responseArray: [ProfResResponse] = []
                
                responseArray.append(contentsOf: model.map({
                    .init(fullname: $0.fullname,
                          username: $0.username,
                          url: $0.url,
                          picture: $0.picture,
                          followers: $0.followers,
                          engagementRate: $0.engagementRate,
                          engagements: $0.engagements)
                }))
                
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
//        cell.layer.borderColor = UIColor.tertiaryLabel.cgColor
//        cell.layer.borderWidth = 1
        if profileResponseArray.count == 0{
            //do skeleton view
            cell.contentView.backgroundColor = .white
        } else {
            let profileResponse = profileResponseArray[indexPath.row]
            cell.configureCellData(with: MyReportsCollectionViewCellViewModel(fullname: profileResponse.fullname,
                                                                              username: profileResponse.username,
                                                                              url: profileResponse.url,
                                                                              picture: profileResponse.picture,
                                                                              followers: profileResponse.followers,
                                                                              engagementRate: profileResponse.engagementRate,
                                                                              engagements: profileResponse.engagements))
            cell.contentView.backgroundColor = .clear
            //configure cell with model
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        
        switch kind {
        case MyReportsDateCollectionReusableView.kind:
            let dateLabel = collectionView.dequeueReusableSupplementaryView(ofKind: MyReportsDateCollectionReusableView.kind, withReuseIdentifier: MyReportsDateCollectionReusableView.reuseIdentifier, for: indexPath) as! MyReportsDateCollectionReusableView
            dateLabel.layer.cornerRadius = 2
            
            return dateLabel
        case MyReportsPlatformCollectionReusableView.kind:
            let platformLabel = collectionView.dequeueReusableSupplementaryView(ofKind: MyReportsPlatformCollectionReusableView.kind, withReuseIdentifier: MyReportsPlatformCollectionReusableView.reuseIdentifier, for: indexPath) as! MyReportsPlatformCollectionReusableView
            platformLabel.layer.cornerRadius = 2
            
            return platformLabel
        default:
            print("default error")
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
    
    
    
}

