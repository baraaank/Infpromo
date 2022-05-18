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
    var profileInfos: ProfileInformationsCellViewModel?
    
    private let profileCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))

            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ProfileHeaderCollectionReusableView.kind, alignment: .top)
            
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.14))
            let item = NSCollectionLayoutItem(layoutSize: itemSize/*, supplementaryItems: [headerView]*/)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.14))
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
    
    
    //loading gifs
    var gif: LoadingGif!
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffectView = UIVisualEffectView()
        let style = UIBlurEffect.Style.light
        let effect = UIBlurEffect(style: style)
        blurEffectView.effect = effect
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profilim"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]
        
        gif = LoadingGif.init(imageName: "infpromoLoadingGif", frame: CGRect(x: (view.frame.size.width / 2) - 40, y: (view.frame.size.height / 2) - 40, width: 80, height: 80), duration: 0.8, repeatCount: 0)
        blurEffectView.frame = view.bounds
//
//
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().infpromo]

        navigationController?.navigationBar.tintColor = UIColor().infpromo

        view.backgroundColor = .white
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        addSubviews()
        
        loadViewElements()
        
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        navigationController?.navigationBar.barTintColor = .systemGray6
        startBlur()
        
        APIisNotWorking()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshByEdit), name: NSNotification.Name(rawValue: "reloadDatas"), object: nil)
    }
    
    func APIisNotWorking() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.stopBlur()
                    self.showAlert(title: "Ooops!", message: "İnternet bağlantınızı kontrol edin!")
                }
        
    }
    
    
    func startBlur() {
        view.addSubview(blurEffectView)
        view.addSubview(gif)
        gif.startAnimation()

    }
    
    func stopBlur() {
        gif.stopAnimation()
        gif.removeFromSuperview()
        blurEffectView.removeFromSuperview()

    }
    
    @objc func refreshByEdit(_ notification: NSNotification) {
        if let reload = notification.userInfo?["success"] as? String {
            DispatchQueue.main.async {
                self.loadViewElements()
            }
        }
    }
    
    func loadViewElements() {
        APICaller.shared.getUser { response in
            switch response {
            case .success(let model):
                self.userResponse = ProfileHeaderReusableViewModel(name: model.data.userPublic.name,
                                                                   surName: model.data.userPublic.surName,
                                                                   socialMedia: model.data.userPublic.socialMedia,
                                                                   title: model.data.userPublic.title)

                let infos = model.data.userPublic
                self.profileInfos = ProfileInformationsCellViewModel(name: infos.name,
                                                                     surName: infos.surName,
                                                                     email: infos.email,
                                                                     birthday: infos.birthday,
                                                                     city: infos.city,
                                                                     language: infos.language,
                                                                     phone: infos.phone,
                                                                     socialMedia: infos.socialMedia,
                                                                     title: infos.title,
                                                                     website: infos.website)
                
                
                
                DispatchQueue.main.async {
                    self.profileCollectionView.reloadData()
                    self.stopBlur()
                }
            case .failure(let error):
                print("failure \(error)")
                print("profile informations are not loading")
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
            header.isSkeletonable = true
            header.configureHeader(with: ProfileHeaderReusableViewModel(name: userResponse?.name,
                                                                        surName: userResponse?.surName,
                                                                        socialMedia: userResponse?.socialMedia,
                                                                        title: userResponse?.title))
            
            return header
        } else {
            fatalError()
        }
        
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let vc = ProfileInformationsViewController()
            vc.profileInfos = profileInfos
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ChangePswAndDeleteAccountViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PastReportViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            print(indexPath.item)
//            let vc = ChangePswAndDeleteAccountViewController()
//            vc.explainlabel.text = "Hesabınızı silmeniz durumunda satın aldığını tüm raporlar da silinecektir."
//            vc.sendButton.setTitle("Hesabımı Sil", for: .normal)
//            vc.sendButton.backgroundColor = .systemRed
//            navigationController?.pushViewController(vc, animated: true)
            
            let alert = UIAlertController(title: "Hesabını silmek üzeresin!", message: "Eğer hesabını silersen tüm raporların da silinecektir.", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Hesabımı Sil", style: .destructive , handler:{ (_) in
                AuthManager.shared.deleteUser {  result in
                    if result != true {
                        print("user can not delete himself")
                    } else {
                        print("user deleted succesfully")
                        
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Tebrikler", message: "Hesabın başarı ile silindi.", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Tamam", style: .default) { _ in
                                DispatchQueue.main.async {
                                    let vc = LogInViewController()
                                    vc.modalPresentationStyle = .fullScreen
                                    self.present(vc, animated: true)
                                }
                            }
                            alert.addAction(action)
                            self.present(alert, animated: true)
                        }
                    }
                        
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler:{ (_) in
                print("User click Dismiss button")
            }))
            present(alert, animated: true) {
                print("completion")
            }
        case 4:
            
            let alert = UIAlertController(title: "Çıkış yapmak üzeresin!", message: "Çıkış yapmak istediğindeen emin misin?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Çıkış", style: .destructive, handler: { _ in
                //handlee log out func
                
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
                
            }))
            alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: { _ in
                print("user dismiss from logout")
            }))
            present(alert, animated: true) {
                print("log out completion")
            }
            
            
            
            
        default:
            print("error")
        }
    }
    
    
    
}


//alerts
extension ProfileViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
                                                    message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
