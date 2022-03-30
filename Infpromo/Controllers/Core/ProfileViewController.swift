//
//  ProfileViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileSections = [
        "Profil Bilgilerim",
        "Parolamı Değiştir",
        "Raporlarım",
        "Hesabımı Sil",
        "Çıkış"
    ]
    
    var userResponse: ProfileHeaderReusableViewModel?

    
    private let profileCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))

            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ProfileHeaderCollectionReusableView.kind, alignment: .top)
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.16))
            let item = NSCollectionLayoutItem(layoutSize: itemSize/*, supplementaryItems: [headerView]*/)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.32))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.bottom = 8
            section.boundarySupplementaryItems = [headerView]
            return section
        }))
        collectionView.backgroundColor = .systemGray6
        collectionView.register(ProfileHeaderCollectionReusableView.self, forSupplementaryViewOfKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier)
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
//
//
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]

        navigationController?.navigationBar.tintColor = UIColor().infpromo

        view.backgroundColor = .white
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        addSubviews()
        
        loadViewElements()
    }
    
    func loadViewElements() {
        APICaller.shared.getUser { response in
            switch response {
            case .success(let model):
                self.userResponse = ProfileHeaderReusableViewModel(name: model.name, surName: model.surName)
                
                DispatchQueue.main.async {
                    self.profileCollectionView.reloadData()
                }
            case .failure(let error):
                print("failure \(error)")
            }
        }
    }
    

    func addSubviews() {
        view.addSubview(profileCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        profileCollectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }

}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profileSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
        
//        cell.backgroundColor = .white
//        cell.layer.borderColor = UIColor.tertiaryLabel.cgColor
//        cell.layer.borderWidth = 1
//
        cell.backgroundColor = .white
        cell.label.text = profileSections[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == ProfileHeaderCollectionReusableView.kind {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: ProfileHeaderCollectionReusableView.kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.reuseIdentifier, for: indexPath) as! ProfileHeaderCollectionReusableView
            header.configureHeader(with: ProfileHeaderReusableViewModel(name: userResponse?.name, surName: userResponse?.surName))
            
            return header
        } else {
            fatalError()
        }
        
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let vc = ProfileInformationsViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ChangePswAndDeleteAccountViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PastReportViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            print(indexPath.item)
            let vc = ChangePswAndDeleteAccountViewController()
            vc.explainlabel.text = "Hesabınızı silmeniz durumunda satın aldığını tüm raporlar da silinecektir."
            vc.sendButton.setTitle("Hesabımı Sil", for: .normal)
            vc.sendButton.backgroundColor = .systemRed
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            
            AuthManager.shared.signOut { [weak self] signedOut in
                if signedOut {
                    DispatchQueue.main.async {
                        let vc = LogInViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    }
                }
                else {
                    print("signed out error")
                }
            }
            
            
        default:
            print("error")
        }
    }
    
    
    
}
