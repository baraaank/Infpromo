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
}

class ProfileInformationsViewController: UIViewController {
    
    var profileInfos: ProfileInformationsCellViewModel?
    var profileInfosArray: [String] = []

    var editingState = ProfileInformationCollectionReusableView()
    
    let optionsArray = [
        ProfileInformationOptions(icon: "envelope", header: "E-mail"),
        ProfileInformationOptions(icon: "textformat.alt", header: "Dil"),
        ProfileInformationOptions(icon: "globe", header: "Web Sitesi"),
        ProfileInformationOptions(icon: "gift", header: "Doğum Günü"),
        ProfileInformationOptions(icon: "location", header: "Lokasyon"),
        ProfileInformationOptions(icon: "phone", header: "Telefon")
    ]
    
    private let profileInformationsCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))

            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ProfileHeaderCollectionReusableView.kind, alignment: .top)
            
//            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.2))
//
//            let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: ProfileInformationCollectionReusableView.kind, alignment: .bottom)
//
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.14))
            let item = NSCollectionLayoutItem(layoutSize: itemSize/*, supplementaryItems: [headerView]*/)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.14))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            section.boundarySupplementaryItems = [headerView, /*footerView*/]
            return section
        }))
        collectionView.backgroundColor = .clear
        collectionView.register(ProfileHeaderCollectionReusableView.self, forSupplementaryViewOfKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier)
        collectionView.register(ProfileInformationsCollectionViewCell.self, forCellWithReuseIdentifier: ProfileInformationsCollectionViewCell.reuseIdentifier)
//        collectionView.register(ProfileInformationCollectionReusableView.self, forSupplementaryViewOfKind: ProfileInformationCollectionReusableView.kind, withReuseIdentifier: ProfileInformationCollectionReusableView.reuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemGray6
        addSubviews()
        
        profileInformationsCollectionView.delegate = self
        profileInformationsCollectionView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Güncelle", style: .plain, target: self, action: #selector(updateButtonTapped))
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshByEditedOnes), name: NSNotification.Name(rawValue: "reloadDatasFromEdited"), object: nil)
        
    }
    
    func addSubviews() {
        view.addSubview(profileInformationsCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        profileInformationsCollectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    
    @objc func updateButtonTapped() {
//        let vc = EditProfileViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = EditProfileViewController()
        
        vc.name = profileInfos?.name ?? ""
        vc.surname = profileInfos?.surName ?? ""
        vc.socialMedia = profileInfos?.socialMedia ?? ""
        vc.titleInfo = profileInfos?.title ?? ""
        vc.email = profileInfos?.email ?? ""
        vc.language = profileInfos?.language ?? ""
        vc.webSite = profileInfos?.website ?? ""
        vc.birthday = profileInfos?.birthday ?? ""
        vc.location = profileInfos?.city ?? ""
        vc.phone = profileInfos?.phone ?? ""
        
        vc.textModel.append(profileInfos?.name ?? "")
        vc.textModel.append(profileInfos?.surName ?? "")
        vc.textModel.append(profileInfos?.socialMedia ?? "")
        vc.textModel.append(profileInfos?.title ?? "")
        vc.textModel.append(profileInfos?.email ?? "")
        vc.textModel.append(profileInfos?.language ?? "")
        vc.textModel.append(profileInfos?.website ?? "")
        vc.textModel.append(profileInfos?.birthday ?? "")
        vc.textModel.append(profileInfos?.city ?? "")
        vc.textModel.append(profileInfos?.phone ?? "")
        
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
   

    @objc func refreshByEditedOnes(_ notification: NSNotification) {
        print("insidinggg")
        if let reload = notification.userInfo?["editedOnes"] as? ProfileInformationsCellViewModel {
            profileInfosArray.removeAll()
            profileInfos = nil
            print("reload \(reload)")
            DispatchQueue.main.async {
                self.profileInfos = reload
                self.profileInformationsCollectionView.reloadData()
            }
        }
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
        
        
        cell.fillInfos(with: optionsArray[indexPath.row])
        
        guard let profileInfo = profileInfos else {
            print("profile infos are empty")
            return UICollectionViewCell()
        }
        
        profileInfosArray.append(profileInfo.email ?? "henüz girilmemiş..")
        profileInfosArray.append(profileInfo.language ?? "henüz girilmemiş..")
        profileInfosArray.append(profileInfo.website ?? "henüz girilmemiş..")
        profileInfosArray.append(profileInfo.birthday ?? "henüz girilmemiş..")
        profileInfosArray.append(profileInfo.city ?? "henüz girilmemiş..")
        profileInfosArray.append(profileInfo.phone ?? "henüz girilmemiş..")
        
        
        cell.fillWithInfos(with: profileInfosArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == ProfileHeaderCollectionReusableView.kind {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier, for: indexPath) as! ProfileHeaderCollectionReusableView
            header.configureHeader(with: .init(name: profileInfos?.name,
                                               surName: profileInfos?.surName,
                                               socialMedia: profileInfos?.socialMedia,
                                               title: profileInfos?.title))
            return header
        }
        
//        else if kind == ProfileInformationCollectionReusableView.kind {
//            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: ProfileInformationCollectionReusableView.kind, withReuseIdentifier: ProfileInformationCollectionReusableView.reuseIdentifier, for: indexPath) as! ProfileInformationCollectionReusableView
//
//            footer.updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
//            return footer
//        } else {
//            fatalError()
//        }
        
        return UICollectionReusableView()
        
    }
    
    
}


