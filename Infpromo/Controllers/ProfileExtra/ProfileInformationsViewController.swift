//
//  ProfileInformationsViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 7.03.2022.
//

import UIKit

struct ProfileInformationOptions {
    let icon: String
    let header: String
    let infos: String
}

class ProfileInformationsViewController: UIViewController {
    
    

    var editingState = ProfileInformationCollectionReusableView()
    
    let optionsArray = [
        ProfileInformationOptions(icon: "envelope", header: "E-mail", infos: "brnktl@gmail.com"),
        ProfileInformationOptions(icon: "textformat.alt", header: "Dil", infos: "Türkçe"),
        ProfileInformationOptions(icon: "globe", header: "Web Sitesi", infos: "henüz girilmemiş.."),
        ProfileInformationOptions(icon: "gift", header: "Doğum Günü", infos: "henüz girilmemiş.."),
        ProfileInformationOptions(icon: "location", header: "Lokasyon", infos: "henüz girilmemiş.."),
        ProfileInformationOptions(icon: "phone", header: "Telefon", infos: "henüz girilmemiş..")
    ]
    
    private let profileInformationsCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))

            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ProfileHeaderCollectionReusableView.kind, alignment: .top)
            
            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.2))

            let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: ProfileInformationCollectionReusableView.kind, alignment: .bottom)
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.16))
            let item = NSCollectionLayoutItem(layoutSize: itemSize/*, supplementaryItems: [headerView]*/)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.32))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            section.boundarySupplementaryItems = [headerView, footerView]
            return section
        }))
        collectionView.backgroundColor = .clear
        collectionView.register(ProfileHeaderCollectionReusableView.self, forSupplementaryViewOfKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier)
        collectionView.register(ProfileInformationsCollectionViewCell.self, forCellWithReuseIdentifier: ProfileInformationsCollectionViewCell.reuseIdentifier)
        collectionView.register(ProfileInformationCollectionReusableView.self, forSupplementaryViewOfKind: ProfileInformationCollectionReusableView.kind, withReuseIdentifier: ProfileInformationCollectionReusableView.reuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubviews()
        
        profileInformationsCollectionView.delegate = self
        profileInformationsCollectionView.dataSource = self
    }
    
    func addSubviews() {
        view.addSubview(profileInformationsCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        profileInformationsCollectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    

   
 

}

//UICollection View
extension ProfileInformationsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        optionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileInformationsCollectionViewCell.reuseIdentifier, for: indexPath) as! ProfileInformationsCollectionViewCell
        
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor().infpromoBorder.cgColor
        cell.layer.borderWidth = 1
        
        
        cell.fillInfos(with: optionsArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == ProfileHeaderCollectionReusableView.kind {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier, for: indexPath)
            return header
        } else if kind == ProfileInformationCollectionReusableView.kind {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: ProfileInformationCollectionReusableView.kind, withReuseIdentifier: ProfileInformationCollectionReusableView.reuseIdentifier, for: indexPath) as! ProfileInformationCollectionReusableView
            
            
            return footer
        } else {
            fatalError()
        }
        
    }
    
    
}


