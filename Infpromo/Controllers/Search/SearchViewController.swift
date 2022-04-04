

import UIKit

class OptionsSelected {
    let option: String
    var isSelected: Bool
    var code: Any?
    
    init(option: String, isSelected: Bool, code: Any? = nil) {
        self.option = option
        self.isSelected = isSelected
        self.code = code
    }
}

class SearchViewController: UIViewController {
    
    
    var models: [String] = [
        "aaaaa",
        "bbbbbbbbbbbb",
        "cc",
        "dddddddd",
        "eeeeeeeee",
        "ffffff",
        "gggaAF",
    ]
    
    
    var minFollowers: Int?
    var maxFollowers: Int?
    var gender: String?
    var interests: [Int?] = []
    var language: String?
    var engagementRate: Double?
    var hasYoutube: Bool?
    
    
    
    // MARK: InstagramArrays
    //InfluencersProperties
    let influencerPropertiesHeadingsInstagram = [
        "Min Takipçi Sayısı", "Max Takipçi Sayısı", "Cinsiyet", "İlgi Alanları", "Dil", "Etkileşim Oranı", "Youtube Hesabı"
    ]
    
    let arrayOneInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 20000),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000)
    ]
    
    let arrayTwoInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000),
        OptionsSelected(option: "5.000.000", isSelected: false, code: 5000000),
        OptionsSelected(option: "5.000.000+", isSelected: false, code: nil)
    ]

    let arrayThreeInfluencerInstagram = [
        OptionsSelected(option: "Kadın", isSelected: false, code: "FEMALE"),
        OptionsSelected(option: "Erkek", isSelected: false, code: "MALE")
    ]
    
    let arrayFourInfluencerInstagram = [
        OptionsSelected(option: "Kıyafet, Ayakkabı, Çanta & Aksesuar", isSelected: false, code: 13),
        OptionsSelected(option: "Arkadaşlar, Aile & İlişkiler", isSelected: false, code: 1708),
        OptionsSelected(option: "Kamera & Fotoğraf", isSelected: false, code: 11),
        OptionsSelected(option: "Restoran, Yiyecek & İçecek", isSelected: false, code: 139),
        OptionsSelected(option: "Gezi, Turizm & Havacılık", isSelected: false, code: 43),
        OptionsSelected(option: "Oyuncak, Çocuk & Bebek", isSelected: false, code: 190),
        OptionsSelected(option: "Güzellik & Kozmetik", isSelected: false, code: 80),
        OptionsSelected(option: "Müzik", isSelected: false, code: 3),
        OptionsSelected(option: "Televizyon & Sinema", isSelected: false, code: 1),
        OptionsSelected(option: "Elektronik & Bilgisayar", isSelected: false, code: 25),
        OptionsSelected(option: "Spor", isSelected: false, code: 21),
        OptionsSelected(option: "Sanat & Dizayn", isSelected: false, code: 36),
        OptionsSelected(option: "Araba & Motosiklet", isSelected: false, code: 1826),
        OptionsSelected(option: "Fitness & Yoga", isSelected: false, code: 196),
        OptionsSelected(option: "Evcil hayvan", isSelected: false, code: 673),
        OptionsSelected(option: "Alışveriş & Parakende", isSelected: false, code: 7),
        OptionsSelected(option: "Kahve, Çay & İçecek", isSelected: false, code: 9),
        OptionsSelected(option: "Sağlıklı yaşam", isSelected: false, code: 798),
        OptionsSelected(option: "Spor giyim", isSelected: false, code: 33),
        OptionsSelected(option: "Lüks ürünler", isSelected: false, code: 1500)
    ]
    
    let arrayFiveInfluencerInstagram = [
        OptionsSelected(option: "Türkçe", isSelected: false, code: "tr"),
        OptionsSelected(option: "İngilizce", isSelected: false, code: "en"),
        OptionsSelected(option: "İspanyolca", isSelected: false, code: "es"),
        OptionsSelected(option: "Portekizce", isSelected: false, code: "pt"),
        OptionsSelected(option: "Rusça", isSelected: false, code: "ru"),
        OptionsSelected(option: "Fransızca", isSelected: false, code: "fr"),
        OptionsSelected(option: "Arapça", isSelected: false, code: "ar"),
        OptionsSelected(option: "İtalyanca", isSelected: false, code: "it"),
        OptionsSelected(option: "Almanca", isSelected: false, code: "de"),
        OptionsSelected(option: "Farsça", isSelected: false, code: "fa"),
        OptionsSelected(option: "İndonesian", isSelected: false, code: "id"),
        OptionsSelected(option: "Japonca", isSelected: false, code: "ja"),
        OptionsSelected(option: "Polakça", isSelected: false, code: "pl"),
        OptionsSelected(option: "Çince", isSelected: false, code: "zh"),
        OptionsSelected(option: "Thai", isSelected: false, code: "th"),
        OptionsSelected(option: "Hindi", isSelected: false, code: "hi"),
        OptionsSelected(option: "Korece", isSelected: false, code: "ko"),
        OptionsSelected(option: "Malay", isSelected: false, code: "ms"),
        OptionsSelected(option: "Flemenkçe", isSelected: false, code: "nl"),
    ]
    
    let arraySixInfluencerInstagram = [
        OptionsSelected(option: "\u{2265} 1%", isSelected: false, code: 0.01),
        OptionsSelected(option: "\u{2265} 2%", isSelected: false, code: 0.02),
        OptionsSelected(option: "\u{2265} 3%", isSelected: false, code: 0.03),
        OptionsSelected(option: "\u{2265} 4%", isSelected: false, code: 0.04),
        OptionsSelected(option: "\u{2265} 5%", isSelected: false, code: 0.05),
        OptionsSelected(option: "\u{2265} 6%", isSelected: false, code: 0.06),
        OptionsSelected(option: "\u{2265} 7%", isSelected: false, code: 0.07),
        OptionsSelected(option: "\u{2265} 8%", isSelected: false, code: 0.08),
        OptionsSelected(option: "\u{2265} 9%", isSelected: false, code: 0.09),
        OptionsSelected(option: "\u{2265} 10%", isSelected: false, code: 0.1),
        OptionsSelected(option: "\u{2265} 11%", isSelected: false, code: 0.11),
        OptionsSelected(option: "\u{2265} 12%", isSelected: false, code: 0.12),
        OptionsSelected(option: "\u{2265} 13%", isSelected: false, code: 0.13),
        OptionsSelected(option: "\u{2265} 14%", isSelected: false, code: 0.14),
        OptionsSelected(option: "\u{2265} 15%", isSelected: false, code: 0.15),
        OptionsSelected(option: "\u{2265} 16%", isSelected: false, code: 0.16),
        OptionsSelected(option: "\u{2265} 17%", isSelected: false, code: 0.17),
        OptionsSelected(option: "\u{2265} 18%", isSelected: false, code: 0.18),
        OptionsSelected(option: "\u{2265} 19%", isSelected: false, code: 0.19),
        OptionsSelected(option: "\u{2265} 20%", isSelected: false, code: 0.2)
    ]
    
    let arraySevenInfluencerInstagram = [
        OptionsSelected(option: "Var", isSelected: false, code: true),
        OptionsSelected(option: "Yok", isSelected: false, code: false)
    ]
    
  
    
    //FollowersProperties
    let followersPropertiesHeadingsInstagram = [
        "Takipçi Cinsiyet Yoğunluğu", "Takipçi Yaş Aralığı", "Takipçi İlgi Alanları", "Takipçi Dili"
    ]
    
    let arrayOneFollowersInstagram = [
        "Kadın", "Erkek"
    ]
    
    let arrayTwoFollowersInstagram = [
        "18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"
    ]
    
    let arrayThreeFollowersInstagram = [
        "Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"
    ]
    
    let arrayFourFollowersInstagram = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    var populateFollowersInstagram = [
        "Kadın", "Erkek"
    ]
    
    
    // MARK: YoutubeTiktokArrays
    // influencerProperties
    let influencerPropertiesHeadingsYT = [
        "Min Abone Sayısı", "Max Abone Sayısı", "Min Görüntülenme Sayısı", "Max Görüntülenme Sayısı", "Lokasyon", "Cinsiyet", "Dil", "Etkileşim Oranı"
    ]
    
    let arrayOneInfluencerYT = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
    ]
    
    let arrayTwoInfluencerYT = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"
    ]
    
    let arrayThreeInfluencerYT = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000"
    ]
    
    let arrayFourInfluencerYT = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.000.000+"
    ]
    
    let arrayFiveInfluencerYT = [
        "Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"
    ]
    
    let arraySixInfluencerYT = [
        "Kadın", "Erkek"
    ]
    
    let arraySevenInfluencerYT = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    let arrayEightInfluencerYT = [
        "\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %"
    ]
    
    var populateInfluencerYT = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
    ]
    
    // followesProperties
    
    let followersPropertiesHeadingsYT = [
        "Takipçi Cinsiyet Yoğunluğu", "Takipçi Yaş Aralığı", "Takipçi Dili"
    ]
    
    let arrayOneFollowersYT = [
        "Kadın", "Erkek"
    ]
    
    let arrayTwoFollowersYT = [
        "18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"
    ]
    
    let arrayThreeFollowersYT = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    var populateFollowersYT = [
        "Kadın", "Erkek"
    ]
    
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Influencer Filtrele"
        
        label.textAlignment = .center
        return label
    }()
    
    private let dismissViewButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark.square")
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(image, for: .normal)
        button.tintColor = UIColor().infpromo
        return button
    }()
    
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Instagram", "Youtube", "Tiktok"])
        
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor().infpromo
        } else {
            segmentedControl.tintColor = UIColor().infpromo
        }
        
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor().infpromo], for: .normal)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor().infpromo.cgColor
        segmentedControl.sizeToFit()
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private let searchBar: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.placeholder = "Influencer Ara"
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        customView.backgroundColor = .clear
        let customImageView = UIImageView()
        customImageView.frame = CGRect(x: 5, y: 20, width: 30, height: 20)
        let customImage = UIImage(systemName: "magnifyingglass")
        customImageView.tintColor = UIColor().infpromo
        customImageView.contentMode = .scaleAspectFit
        customImageView.image = customImage
        customImageView.backgroundColor = .clear
        customView.addSubview(customImageView)
        textField.leftView = customView
        //        textField.delegate = self
        
        textField.leftViewMode = .always
        return textField
    }()
    
    private let influencerHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerHeadingsTableView")
        return tableView
    }()
    
    private let influencerOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerOptionsTableView")
        return tableView
    }()
    
    private let followersHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersHeadingsTableView")
        return tableView
    }()
    
    private let followersOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersOptionsTableView")
        return tableView
    }()
    
    
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Arama", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        
        return button
    }()
    
    var customSegmented: CustomSegmentedControl!
    
    
    
    private let influencerFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))

            
            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "influencerFilterCollectionViewKind", alignment: .leading)
//            headerView.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 200)
//            headerView.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(140), bottom: .fixed(0))
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
//            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .fixed(1), trailing: .fixed(1), bottom: .fixed(1))
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .none, trailing: .fixed(2), bottom: .none)
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: UIScreen.main.bounds.width / 5, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [headerView]
            return section
        }))
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "influencerFilterCollectionViewKind", withReuseIdentifier: "influencerFilterCollectionViewReuseIdentifier")
        collectionView.register(InfluencerFilterCollectionViewCell.self, forCellWithReuseIdentifier: InfluencerFilterCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    private let followersFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))

            
            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "followersFilterCollectionViewKind", alignment: .leading)

            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .none, trailing: .fixed(2), bottom: .none)
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: UIScreen.main.bounds.width / 5, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [headerView]
            return section
        }))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "followersFilterCollectionViewKind", withReuseIdentifier: "followersFilterCollectionViewReuseIdentifier")
        collectionView.register(FollowersFilterCollectionViewCell.self, forCellWithReuseIdentifier: FollowersFilterCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        customSegmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 180, width: view.width - 40, height: 40), buttonTitle: ["Influencer Özellikleri", "Takipçi Özellikleri"])
        customSegmented.delegate = self
        view.addSubview(customSegmented)
        
        //        searchButton.addTarget(self, action: searchButtonTapped, for: .touchUpInside)
        
        addSubviews()
        
        influencerHeadingsTableView.delegate = self
        influencerHeadingsTableView.dataSource = self
        
        influencerOptionsTableView.delegate = self
        influencerOptionsTableView.dataSource = self
        
        followersHeadingsTableView.delegate = self
        followersHeadingsTableView.dataSource = self
        
        followersOptionsTableView.delegate = self
        followersOptionsTableView.dataSource = self
        
        followersHeadingsTableView.isHidden = true
        followersOptionsTableView.isHidden = true
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        dismissViewButton.addTarget(self, action: #selector(dismissViewButtonTapped), for: .touchUpInside)
        
        
        view.backgroundColor = .white
        
        
        searchBar.isHidden = true
        
        influencerFilterCollectionView.delegate = self
        influencerFilterCollectionView.dataSource = self
        
        followersFilterCollectionView.delegate = self
        followersFilterCollectionView.dataSource = self
    }
    
    func addSubviews() {
        
        view.addSubview(topLabel)
        view.addSubview(dismissViewButton)
        view.addSubview(segmentedControl)
        view.addSubview(influencerHeadingsTableView)
        view.addSubview(influencerOptionsTableView)
        view.addSubview(followersHeadingsTableView)
        view.addSubview(followersOptionsTableView)
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(influencerFilterCollectionView)
        view.addSubview(followersFilterCollectionView)
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLabel.frame = CGRect(x: 20, y: 20, width: view.width - 40, height: 30)
        dismissViewButton.frame = CGRect(x: view.width - 45, y: 20, width: 30, height: 30)
        segmentedControl.frame = CGRect(x: 30, y: topLabel.bottom + 20, width: view.width - 60, height: 30)
        searchBar.frame = CGRect(x: 10, y: segmentedControl.bottom + 20, width: view.width - 20, height: 40)
        searchButton.frame = CGRect(x: 20, y: view.height - 120 , width: view.width - 40, height: 50)
        influencerFilterCollectionView.frame = CGRect(x: 15, y: segmentedControl.bottom + 12, width: view.width - 30, height: 25)
        followersFilterCollectionView.frame = CGRect(x: 15, y: influencerFilterCollectionView.bottom + 12, width: view.width - 30, height: 25)
        
        if influencerHeadingsTableView.contentSize.height > view.height - 270 {
            influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        } else {
            influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: influencerHeadingsTableView.contentSize.height)
        }
        
        if influencerOptionsTableView.contentSize.height > view.height - 270 {
            influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        } else {
            influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: influencerOptionsTableView.contentSize.height)
        }
        
        
        followersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        followersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        
        
    }
    
    @objc func searchButtonTapped() {
       
//        APICaller.shared.searchByUsername(username: searchBar.text!) { response in
//            switch response {
//            case .success(let model):
//                var directProfileResponse: [DirectProfileResponse] = []
//                directProfileResponse.append(contentsOf: model.data.bodyNew.directs.map({
//                    .init(engagementRate: $0.profile.engagementRate,
//                          engagements: $0.profile.engagements,
//                          followers: $0.profile.followers,
//                          fullname: $0.profile.fullname,
//                          picture: $0.profile.picture,
//                          url: $0.profile.url,
//                          username: $0.profile.username,
//                          isPrivate: $0.profile.isPrivate)
//                })
//                )
//
//
//                let dataDict: [String: [DirectProfileResponse]] = ["dataDict": directProfileResponse]
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil, userInfo: dataDict)
//
//                DispatchQueue.main.async {
//                    self.dismiss(animated: true, completion: nil)
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//
//        }
        
        
        print("minFollowers\(minFollowers)")
        print("maxFollowers\(maxFollowers)")
        print("gender\(gender)")
        print("interests\(interests)")
        print("language\(language)")
        print("engagementRate\(engagementRate)")
        print("hasYoutube\(hasYoutube)" )
        
        APICaller.shared.filter(minFollowers: minFollowers, maxFollowers: maxFollowers, gender: gender, interests: interests, language: language, engagementRate: engagementRate, hasYoutube: hasYoutube) { response in
            
            
            switch response {
            case .success(let model):
                print("successsssfulllllyyyyyyy")
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
        
        
        
    }
    
    @objc func dismissViewButtonTapped() {
        dismiss(animated: true, completion: nil)
        
    }
    
    private func reloadTableViews() {
        influencerHeadingsTableView.reloadData()
        influencerOptionsTableView.reloadData()
        followersHeadingsTableView.reloadData()
        followersOptionsTableView.reloadData()
    }
    
    
    
    @objc func segmentedControlTapped(_ sender: UISegmentedControl) {
        reloadTableViews()
    }
    
}


extension SearchViewController: CustomSegmentedControlDelegate {
    
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            influencerHeadingsTableView.isHidden = false
            influencerOptionsTableView.isHidden = false
            followersHeadingsTableView.isHidden = true
            followersOptionsTableView.isHidden = true
        
            
            
            reloadTableViews()
            
        case 1:
            influencerHeadingsTableView.isHidden = true
            influencerOptionsTableView.isHidden = true
            followersHeadingsTableView.isHidden = false
            followersOptionsTableView.isHidden = false

            
            reloadTableViews()
            
        default:
            print("custom segmented switch default")
        }
        
    }
    
    
}



extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            switch tableView {
            case influencerHeadingsTableView:
                return influencerPropertiesHeadingsInstagram.count
            case influencerOptionsTableView:
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneInfluencerInstagram.count
                case [0,1]:
                    return arrayTwoInfluencerInstagram.count
                case [0,2]:
                    return arrayThreeInfluencerInstagram.count
                case [0,3]:
                    return arrayFourInfluencerInstagram.count
                case [0,4]:
                    return arrayFiveInfluencerInstagram.count
                case [0,5]:
                    return arraySixInfluencerInstagram.count
                case [0,6]:
                    return arraySevenInfluencerInstagram.count
                default:
                    print("default returned 10")
                    return 10
                    
                }
                
                

//
//
//            case followersHeadingsTableView:
//                return followersPropertiesHeadingsInstagram.count
//            case followersOptionsTableView:
//                return populateFollowersInstagram.count
            default:
                print("first numberOfRowsInSection switch error")
                influencerOptionsTableView.isHidden = true
            }
//        case 1:
//            switch tableView {
//            case influencerHeadingsTableView:
//                return influencerPropertiesHeadingsYT.count
//            case influencerOptionsTableView:
//                return populateInfluencerYT.count
//            case followersHeadingsTableView:
//                return followersPropertiesHeadingsYT.count
//            case followersOptionsTableView:
//                return populateFollowersYT.count
//            default:
//                print("numberOfRowsInSection switch error")
//            }
//        case 2:
//            switch tableView {
//            case influencerHeadingsTableView:
//                return influencerPropertiesHeadingsYT.count
//            case influencerOptionsTableView:
//                return populateInfluencerYT.count
//            case followersHeadingsTableView:
//                return followersPropertiesHeadingsYT.count
//            case followersOptionsTableView:
//                return populateFollowersYT.count
//            default:
//                print("numberOfRowsInSection switch error")
//            }
        default:
            print("numberOfRowsInSection switch error")
            break
        }
        
        return 1
    }
    
    
    //cell text attributtes
    func cellConfig(cell: UITableViewCell, cellText: String, tableView: UITableView, indexPath: IndexPath) {
        cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        cell.textLabel?.numberOfLines = 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            switch tableView {
            case influencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
                let cellText = influencerPropertiesHeadingsInstagram[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                
                return cell
            case influencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
                
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    let cellText = arrayOneInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayOneInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                   
                case [0,1]:
                    let cellText = arrayTwoInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayTwoInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                        
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                case [0,2]:
                    let cellText = arrayThreeInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayThreeInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                case [0,3]:
                    let cellText = arrayFourInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayFourInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                case [0,4]:
                    let cellText = arrayFiveInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayFiveInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                case [0,5]:
                    let cellText = arraySixInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arraySixInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                case [0,6]:
                    let cellText = arraySevenInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arraySevenInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                   
                default:
                    let cellText = arrayOneInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                    if arrayOneInfluencerInstagram[indexPath.row].isSelected == false {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                   
                }
                
                
                
                cell.selectionStyle = .none
                return cell
//            case followersHeadingsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
//                let cellText = followersPropertiesHeadingsInstagram[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//
//                return cell
//            case followersOptionsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
//                let cellText = populateFollowersInstagram[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                cell.selectionStyle = .none
//                return cell
//
            default:
                print("cellforrowat error")
                return UITableViewCell()
            }
            
            
            
            
//        case 1:
//            switch tableView {
//            case influencerHeadingsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
//                let cellText = influencerPropertiesHeadingsYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case influencerOptionsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
//                let cellText = populateInfluencerYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case followersHeadingsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
//                let cellText = followersPropertiesHeadingsYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case followersOptionsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
//                let cellText = populateFollowersYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//
//            default:
//                print("cellforrowat error")
//
//
//            }
//
//
//        case 2:
//            switch tableView {
//            case influencerHeadingsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
//                let cellText = influencerPropertiesHeadingsYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case influencerOptionsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
//                let cellText = populateInfluencerYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case followersHeadingsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
//                let cellText = followersPropertiesHeadingsYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//            case followersOptionsTableView:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
//                let cellText = populateFollowersYT[indexPath.row]
//                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
//                return cell
//
//            default:
//                print("cellforrowat error")
//            }
            
            
        default:
            print("")
        }
        return UITableViewCell()
    }
    
    

    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        
       
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            switch tableView {
            case influencerHeadingsTableView:
                
                influencerOptionsTableView.reloadData()
                

                
                influencerOptionsTableView.isHidden = false
    
            case influencerOptionsTableView:
                

                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    arrayOneInfluencerInstagram[indexPath.row].isSelected = !arrayOneInfluencerInstagram[indexPath.row].isSelected
                    if arrayOneInfluencerInstagram[indexPath.row].isSelected {
                        minFollowers = arrayOneInfluencerInstagram[indexPath.row].code as? Int
                    } else {
                        minFollowers = nil
                    }
                case [0,1]:
                    arrayTwoInfluencerInstagram[indexPath.row].isSelected = !arrayTwoInfluencerInstagram[indexPath.row].isSelected
                    if arrayTwoInfluencerInstagram[indexPath.row].isSelected {
                        maxFollowers = arrayTwoInfluencerInstagram[indexPath.row].code as? Int
                    } else {
                        maxFollowers = nil
                    }
                case [0,2]:
                    arrayThreeInfluencerInstagram[indexPath.row].isSelected = !arrayThreeInfluencerInstagram[indexPath.row].isSelected
                    if arrayThreeInfluencerInstagram[indexPath.row].isSelected {
                        gender = arrayThreeInfluencerInstagram[indexPath.row].code as? String
                    } else {
                        gender = nil
                    }
                case [0,3]:
                    arrayFourInfluencerInstagram[indexPath.row].isSelected = !arrayFourInfluencerInstagram[indexPath.row].isSelected
                    if arrayFourInfluencerInstagram[indexPath.row].isSelected {
                        interests.append(arrayFourInfluencerInstagram[indexPath.row].code as? Int)
                    } else {
                        if let interest = interests.firstIndex(where: { $0 == arrayFourInfluencerInstagram[indexPath.row].code as? Int }) {
                            interests.remove(at: interest)
                        }
                    }
                case [0,4]:
                    arrayFiveInfluencerInstagram[indexPath.row].isSelected = !arrayFiveInfluencerInstagram[indexPath.row].isSelected
                    if arrayFiveInfluencerInstagram[indexPath.row].isSelected {
                        language = arrayFiveInfluencerInstagram[indexPath.row].code as? String
                    } else {
                        language = nil
                    }
                case [0,5]:
                    arraySixInfluencerInstagram[indexPath.row].isSelected = !arraySixInfluencerInstagram[indexPath.row].isSelected
                    if arraySixInfluencerInstagram[indexPath.row].isSelected {
                        engagementRate = arraySixInfluencerInstagram[indexPath.row].code as? Double
                    } else {
                        engagementRate = nil
                    }
                case [0,6]:
                    arraySevenInfluencerInstagram[indexPath.row].isSelected = !arraySevenInfluencerInstagram[indexPath.row].isSelected
                    if arraySevenInfluencerInstagram[indexPath.row].isSelected {
                        hasYoutube = arraySevenInfluencerInstagram[indexPath.row].code as? Bool
                    } else {
                        hasYoutube = nil
                    }
                    
                default:

                    print("default is collapse")
                }
                
                influencerOptionsTableView.reloadData()
//
//
            default:
                print("????")
                
            }
            
//        case 1:
//            switch tableView {
//            case influencerHeadingsTableView:
//
//                populateInfluencerArray(sender: headIndex)
//                influencerOptionsTableView.reloadData()
//
//            case followersHeadingsTableView:
//
//                populateFollowersArray(sender: headIndex)
//                followersOptionsTableView.reloadData()
//
//            default:
//                print("default")
//            }
//        case 2:
//            switch tableView {
//            case influencerHeadingsTableView:
//
//                populateInfluencerArray(sender: headIndex)
//                influencerOptionsTableView.reloadData()
//
//            case followersHeadingsTableView:
//
//                populateFollowersArray(sender: headIndex)
//                followersOptionsTableView.reloadData()
//
//            default:
//                print("default")
//            }
        default:
            print("didselect switch error")
            
        }
    }
    

    
    

}

// CollectionView Delegate and DataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case influencerFilterCollectionView:
            return models.count
        case followersFilterCollectionView:
            return models.count
        default:
            print("filters number of items in section")
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case influencerFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfluencerFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! InfluencerFilterCollectionViewCell
            cell.configureCellLabel(with: models[indexPath.item])
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            
//            cell.ce = collectionView.center
            return cell
        case followersFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FollowersFilterCollectionViewCell
            cell.configureCellLabel(with: models[indexPath.item])
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            
//            cell.ce = collectionView.center
            return cell
            
        default:
            print("filters cell for item at")
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case "influencerFilterCollectionViewKind":
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "influencerFilterCollectionViewKind", withReuseIdentifier: "influencerFilterCollectionViewReuseIdentifier", for: indexPath)
//            header.backgroundColor = .gray
            header.frame = CGRect(x: 0, y: 0, width: collectionView.width / 5, height: 25)
            header.backgroundColor = .white
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize: 14)
            
//            title.adjustsFontSizeToFitWidth = true
            title.sizeToFit()
            title.textColor = UIColor().infpromo
            title.text = "influencer: "
            title.numberOfLines = 0
            title.frame = header.frame
            
            header.addSubview(title)
            
//            title.backgroundColor = .gray
            
            return header
        case "followersFilterCollectionViewKind":
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "followersFilterCollectionViewKind", withReuseIdentifier: "followersFilterCollectionViewReuseIdentifier", for: indexPath)
            header.frame = CGRect(x: 0, y: 0, width: collectionView.width / 5, height: 25)
            header.backgroundColor = .white
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize: 14)
            
//            title.adjustsFontSizeToFitWidth = true
            title.sizeToFit()
            title.textColor = UIColor().infpromo
            title.text = "takipçi: "
            title.numberOfLines = 0
            title.frame = header.frame
            
            header.addSubview(title)
            
//            title.backgroundColor = .gray
            
            return header
        default:
            print("collection view header error")
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: influencerFilterCollectionView.width / 5, height: 20)
    }
    
    
    
    
    
}
    
    
    




