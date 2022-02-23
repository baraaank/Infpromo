//
//  PastReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class PastReportViewController: UIViewController {
    
    static let bedge = "bedge"
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
            
            let suppViewSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(20))
            let containerSuppAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0.3, y: -0.3))
            let suppView = NSCollectionLayoutSupplementaryItem(layoutSize: suppViewSize, elementKind: PastReportViewController.bedge, containerAnchor: containerSuppAnchor)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [suppView])
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            
            
            
            
            return section
        }))
        
        collectionView.register(PastReportCollectionViewCell.self, forCellWithReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier)
        collectionView.register(PastReportCollectionReusableView.self, forSupplementaryViewOfKind: PastReportCollectionReusableView.kind, withReuseIdentifier: PastReportCollectionReusableView.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Reports"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    
}


extension PastReportViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let bannerView = collectionView.dequeueReusableSupplementaryView(ofKind: PastReportCollectionReusableView.kind, withReuseIdentifier: PastReportCollectionReusableView.reuseIdentifier, for: indexPath) as! PastReportCollectionReusableView
        bannerView.backgroundColor = .purple
        return bannerView
    }
    
    
    
    
    
}
