//
//  PastReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class PastReportViewController: UIViewController {
    
    var openCloseView: Bool = true
    let dateView = UIView()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
            
            let suppViewSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(20))
            let containerSuppAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0.3, y: -0.3))
            let suppView = NSCollectionLayoutSupplementaryItem(layoutSize: suppViewSize, elementKind: PastReportCollectionReusableView.kind, containerAnchor: containerSuppAnchor)
            
            //            let suppViewSize2 = NSCollectionLayoutSize(widthDimension: .absolute(60), heightDimension: .absolute(60))
            //
            //            let containerSuppAnchor2 = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0, y: 0))
            //            let suppView2 = NSCollectionLayoutSupplementaryItem(layoutSize: suppViewSize2, elementKind: PastReportDateCollectionReusableView.kind, containerAnchor: containerSuppAnchor2)
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [suppView, /*suppView2*/])
            
            
            
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            
            return section
        }))
        
        collectionView.register(PastReportCollectionViewCell.self, forCellWithReuseIdentifier: PastReportCollectionViewCell.reuseIdentifier)
        //        collectionView.register(PastReportCollectionReusableView.self, forSupplementaryViewOfKind: PastReportCollectionReusableView.kind, withReuseIdentifier: PastReportCollectionReusableView.reuseIdentifier)
        //        collectionView.register(PastReportDateCollectionReusableView.self, forSupplementaryViewOfKind: PastReportDateCollectionReusableView.kind, withReuseIdentifier: PastReportDateCollectionReusableView.reuseIdentifier)
        collectionView.register(PastReportCollectionReusableView.self, forSupplementaryViewOfKind: PastReportCollectionReusableView.kind, withReuseIdentifier: PastReportCollectionReusableView.reuseIdentifier)
        
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Reports"
        addSubviews()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        dateView.backgroundColor = .purple
        
        
        
        
        
        
        
        
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
        
        switch kind {
            //        case PastReportDateCollectionReusableView.kind :
            //            let bannerView2 = collectionView.dequeueReusableSupplementaryView(ofKind: PastReportDateCollectionReusableView.kind, withReuseIdentifier: PastReportDateCollectionReusableView.reuseIdentifier, for: indexPath) as! PastReportDateCollectionReusableView
            //
            //            return bannerView2
        case PastReportCollectionReusableView.kind :
            let bannerView = collectionView.dequeueReusableSupplementaryView(ofKind: PastReportCollectionReusableView.kind, withReuseIdentifier: PastReportCollectionReusableView.reuseIdentifier, for: indexPath) as! PastReportCollectionReusableView
            bannerView.delegate = self
            
            return bannerView
        default:
            fatalError("fatalerror")
        }
        
    }
    
    
    
    
    
    
}

extension PastReportViewController: PastReportCollectionReusableViewDelegate {
    
    func didChangeLayout() {
        if openCloseView {
            dateView.isHidden = false
            view.addSubview(dateView)
        } else {
            dateView.isHidden = true
            dateView.removeFromSuperview()
        }
        
        openCloseView = !openCloseView
    }
    
    
}
