//
//  LogInSignUpViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 23.05.2022.
//

import UIKit

class LogInSignUpViewController: UIViewController {

    var commentModel: [LogInSignUpViewModel] = [
        .init(username: "godentofficial", image: "godent", commentText: "Infpromo sayesinde influencer marketing bütçemizde 35% ' lik bir tasarruf sağladık. Teşekkürler infpromo.com", name: "- Godent clinic"),
        .init(username: "hairexpertnet", image: "hairExpert", commentText: "Türkiye operasyonlarımız için kullandığımız bir ürün ve her seferinde bize doğru yolu gösterebilmesi muhteşem!!", name: "- Hair Expert Clinic"),
        .init(username: "kali.hena", image: "kaliHena", commentText: "Influencer marketing alanında bilgili ekip ve doğru sonuç sayesinde reklamlarıma en uygun influencerları kolayca buldum.", name: "- Kali Hena Astrolog")
    ]
    
    var timer = Timer()
    var counter = 0
    
    var pageControl = UIPageControl()
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logIn")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private let sliderCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
            
            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets.leading = 8
            section.orthogonalScrollingBehavior = .paging
            return section
        }))
        
        collectionView.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: SliderCollectionViewCell.reuseIdentifier)
        
        collectionView.backgroundColor = .systemGray6
        
        return collectionView
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Giriş Yap", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Kayıt Ol", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        view.backgroundColor = .white
        
        addSubviews()
        
        pageControl.numberOfPages = commentModel.count
        pageControl.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(self.timerDidChange), userInfo: nil, repeats: true)
        }
    }
    
    func addSubviews() {
        view.addSubview(sliderCollectionView)
        view.addSubview(logoImageView)
        view.addSubview(pageControl)
        view.addSubview(logInButton)
        view.addSubview(signUpButton)
    }
    
    @objc func timerDidChange() {
        if counter < commentModel.count {
            let index = IndexPath(item: counter, section: 0)
            sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath(item: counter, section: 0)
            sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter = 1
        }
        
        
    }
    
    @objc func logInButtonTapped() {
        let vc = LogInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @objc func signUpButtonTapped() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.frame = CGRect(x: 10, y: view.height / 10, width: view.width - 20, height: 60)
        sliderCollectionView.frame = CGRect(x: 0, y: logoImageView.bottom + 40, width: view.width, height: view.height / 2.8)
        pageControl.frame = CGRect(x: 40, y: sliderCollectionView.bottom + 20, width: view.width - 80, height: 40)
        logInButton.frame = CGRect(x: 10, y: view.bottom - 150, width: (view.width / 2) - 20, height: 50)
        signUpButton.frame = CGRect(x: (view.width / 2) + 10, y: view.bottom - 150, width: (view.width / 2) - 20, height: 50)
    }
  

    @objc func usernameButtonClicked(_ sender: CustomFilterButton) {
        let indexPath = IndexPath(row: sender.row, section: sender.section)
        let usernameIndex = commentModel[indexPath.row]
        if let urlString = URL(string: "https://www.instagram.com/\(usernameIndex.username)") {
            UIApplication.shared.open(urlString)
        }
    }
    
}

extension LogInSignUpViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        commentModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.reuseIdentifier, for: indexPath) as! SliderCollectionViewCell
        let indexModel = commentModel[indexPath.row]
        cell.handleCellDatas(with: .init(username: indexModel.username,
                                         image: indexModel.image,
                                         commentText: indexModel.commentText,
                                         name: indexModel.name))
        cell.usernameButton.row = indexPath.row
        cell.usernameButton.section = indexPath.section
        cell.usernameButton.addTarget(self, action: #selector(usernameButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    
}
