

import UIKit


class OptionsSelected {
    let option: String
    var isSelected: Bool
    var code: Any?
    var id: Int
    
    init(option: String, isSelected: Bool, code: Any? = nil, id: Int) {
        self.option = option
        self.isSelected = isSelected
        self.code = code
        self.id = id
    }
}

struct SelectedFilter {
    let filterName: String
    let id: Int
    
}

class HeadingsSelected {
    let title: String
    var isSelected: Bool
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}




class SearchViewController: UIViewController {
    
    var models = [
        "aaaa",
        "aaaa",
        "aaaa",
        "aaaa",
        "aaaa",
        "aaaa",
    ]
    
    
    var minFollowers: Int?
    var maxFollowers: Int?
    var gender: String?
    var interests: [Int?] = []
    var language: String?
    var engagementRate: Double?
    var hasYoutube: Bool?
    
    
    var selectedFilterArray: [SelectedFilter] = []
    
    var filterIndexCount: Int = 0
    
    // MARK: InstagramArrays
    //InfluencersProperties
    let influencerPropertiesHeadingsInstagram: [HeadingsSelected] = [
        HeadingsSelected(title: "Min Takipçi Sayısı", isSelected: false),
        HeadingsSelected(title: "Max Takipçi Sayısı", isSelected: false),
        HeadingsSelected(title: "Cinsiyet", isSelected: false),
        HeadingsSelected(title: "İlgi Alanları", isSelected: false),
        HeadingsSelected(title: "Dil", isSelected: false),
        HeadingsSelected(title: "Etkileşim Oranı", isSelected: false),
        HeadingsSelected(title: "Youtube Hesabı", isSelected: false),
    ]
    
    
    
    
    //    var arrayInfluencerMinFollowers: [OptionsSelected] = []
    //    var arrayInfluencerMaxFollowers: [OptionsSelected] = []
    //
    //    func createFilterWithId(array: [OptionsSelected], array2: [OptionsSelected]) {
    //        var random = Int.random(in: 0..<100)
    //        for i in 0..<array.count {
    //
    //            if array[i].id == nil {
    //                array2.insert(.init(option: "as", isSelected: true, code: 2000, id: random), at: i)
    //            } else {
    //                array2.insert(.init(option: "as", isSelected: true, code: 2000, id: array[i].id), at: i)
    //            }
    //        }
    //    }
    
    
    
    let arrayOneInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 1),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 2),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 3),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 4),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 5),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 6),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 7),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 8),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 9),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 10),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 11),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 12),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 13),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 14)
    ]
    
    let arrayTwoInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 15),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 16),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 17),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 18),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 19),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 20),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 21),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 22),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 23),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 24),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 25),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 26),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 27),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 28),
        OptionsSelected(option: "5.000.000", isSelected: false, code: 5000000, id: 29),
        OptionsSelected(option: "5.000.000+", isSelected: false, code: nil, id: 30)
    ]
    
    let arrayThreeInfluencerInstagram = [
        OptionsSelected(option: "Kadın", isSelected: false, code: "FEMALE", id: 31),
        OptionsSelected(option: "Erkek", isSelected: false, code: "MALE", id: 32)
    ]
    
    let arrayFourInfluencerInstagram = [
        OptionsSelected(option: "Kıyafet, Ayakkabı, Çanta & Aksesuar", isSelected: false, code: 13, id: 33),
        OptionsSelected(option: "Arkadaşlar, Aile & İlişkiler", isSelected: false, code: 1708, id: 34),
        OptionsSelected(option: "Kamera & Fotoğraf", isSelected: false, code: 11, id: 35),
        OptionsSelected(option: "Restoran, Yiyecek & İçecek", isSelected: false, code: 139, id: 36),
        OptionsSelected(option: "Gezi, Turizm & Havacılık", isSelected: false, code: 43, id: 37),
        OptionsSelected(option: "Oyuncak, Çocuk & Bebek", isSelected: false, code: 190, id: 38),
        OptionsSelected(option: "Güzellik & Kozmetik", isSelected: false, code: 80, id: 39),
        OptionsSelected(option: "Müzik", isSelected: false, code: 3, id: 40),
        OptionsSelected(option: "Televizyon & Sinema", isSelected: false, code: 1, id: 41),
        OptionsSelected(option: "Elektronik & Bilgisayar", isSelected: false, code: 25, id: 42),
        OptionsSelected(option: "Spor", isSelected: false, code: 21, id: 43),
        OptionsSelected(option: "Sanat & Dizayn", isSelected: false, code: 36, id: 44),
        OptionsSelected(option: "Araba & Motosiklet", isSelected: false, code: 1826, id: 45),
        OptionsSelected(option: "Fitness & Yoga", isSelected: false, code: 196, id: 46),
        OptionsSelected(option: "Evcil hayvan", isSelected: false, code: 673, id: 47),
        OptionsSelected(option: "Alışveriş & Parakende", isSelected: false, code: 7, id: 48),
        OptionsSelected(option: "Kahve, Çay & İçecek", isSelected: false, code: 9, id: 49),
        OptionsSelected(option: "Sağlıklı yaşam", isSelected: false, code: 798, id: 50),
        OptionsSelected(option: "Spor giyim", isSelected: false, code: 33, id: 51),
        OptionsSelected(option: "Lüks ürünler", isSelected: false, code: 1500, id: 52)
    ]
    
    let arrayFiveInfluencerInstagram = [
        OptionsSelected(option: "Türkçe", isSelected: false, code: "tr", id: 53),
        OptionsSelected(option: "İngilizce", isSelected: false, code: "en", id: 54),
        OptionsSelected(option: "İspanyolca", isSelected: false, code: "es", id: 55),
        OptionsSelected(option: "Portekizce", isSelected: false, code: "pt", id: 56),
        OptionsSelected(option: "Rusça", isSelected: false, code: "ru", id: 57),
        OptionsSelected(option: "Fransızca", isSelected: false, code: "fr", id: 58),
        OptionsSelected(option: "Arapça", isSelected: false, code: "ar", id: 59),
        OptionsSelected(option: "İtalyanca", isSelected: false, code: "it", id: 60),
        OptionsSelected(option: "Almanca", isSelected: false, code: "de", id: 61),
        OptionsSelected(option: "Farsça", isSelected: false, code: "fa", id: 62),
        OptionsSelected(option: "İndonesian", isSelected: false, code: "id", id: 63),
        OptionsSelected(option: "Japonca", isSelected: false, code: "ja", id: 64),
        OptionsSelected(option: "Polakça", isSelected: false, code: "pl", id: 65),
        OptionsSelected(option: "Çince", isSelected: false, code: "zh", id: 66),
        OptionsSelected(option: "Thai", isSelected: false, code: "th", id: 67),
        OptionsSelected(option: "Hindi", isSelected: false, code: "hi", id: 68),
        OptionsSelected(option: "Korece", isSelected: false, code: "ko", id: 69),
        OptionsSelected(option: "Malay", isSelected: false, code: "ms", id: 70),
        OptionsSelected(option: "Flemenkçe", isSelected: false, code: "nl", id: 71),
    ]
    
    let arraySixInfluencerInstagram = [
        OptionsSelected(option: "\u{2265} 1%", isSelected: false, code: 0.01, id: 72),
        OptionsSelected(option: "\u{2265} 2%", isSelected: false, code: 0.02, id: 73),
        OptionsSelected(option: "\u{2265} 3%", isSelected: false, code: 0.03, id: 74),
        OptionsSelected(option: "\u{2265} 4%", isSelected: false, code: 0.04, id: 75),
        OptionsSelected(option: "\u{2265} 5%", isSelected: false, code: 0.05, id: 76),
        OptionsSelected(option: "\u{2265} 6%", isSelected: false, code: 0.06, id: 77),
        OptionsSelected(option: "\u{2265} 7%", isSelected: false, code: 0.07, id: 78),
        OptionsSelected(option: "\u{2265} 8%", isSelected: false, code: 0.08, id: 79),
        OptionsSelected(option: "\u{2265} 9%", isSelected: false, code: 0.09, id: 80),
        OptionsSelected(option: "\u{2265} 10%", isSelected: false, code: 0.1, id: 81),
        OptionsSelected(option: "\u{2265} 11%", isSelected: false, code: 0.11, id: 82),
        OptionsSelected(option: "\u{2265} 12%", isSelected: false, code: 0.12, id: 83),
        OptionsSelected(option: "\u{2265} 13%", isSelected: false, code: 0.13, id: 84),
        OptionsSelected(option: "\u{2265} 14%", isSelected: false, code: 0.14, id: 85),
        OptionsSelected(option: "\u{2265} 15%", isSelected: false, code: 0.15, id: 86),
        OptionsSelected(option: "\u{2265} 16%", isSelected: false, code: 0.16, id: 87),
        OptionsSelected(option: "\u{2265} 17%", isSelected: false, code: 0.17, id: 88),
        OptionsSelected(option: "\u{2265} 18%", isSelected: false, code: 0.18, id: 89),
        OptionsSelected(option: "\u{2265} 19%", isSelected: false, code: 0.19, id: 90),
        OptionsSelected(option: "\u{2265} 20%", isSelected: false, code: 0.2, id: 91)
    ]
    
    let arraySevenInfluencerInstagram = [
        OptionsSelected(option: "Var", isSelected: false, code: true, id: 92),
        OptionsSelected(option: "Yok", isSelected: false, code: false, id: 93)
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
        label.attributedText = NSAttributedString(string: "Influencer Filtrele", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        return label
    }()
    
    private let dismissViewButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "xmark.square")
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(image, for: .normal)
        button.tintColor = UIColor().infpromo
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Temizle", for: .normal)
        button.setTitleColor(UIColor().infpromo, for: .normal)
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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        customView.layer.cornerRadius = 8
        customView.backgroundColor = UIColor().infpromo
        customView.clipsToBounds = true
        paddingView.addSubview(customView)
        let customSymbolLabel = UILabel()
        customSymbolLabel.frame = customView.bounds
        customSymbolLabel.textAlignment = .center
        customSymbolLabel.attributedText = NSAttributedString(string: "@", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold)])
        customView.addSubview(customSymbolLabel)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.returnKeyType = .search
        return textField
    }()
    
    private let influencerHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerHeadingsTableView")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        
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
        let button = UIButton(type: .system)
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
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "influencerFilterCollectionViewKind", withReuseIdentifier: "influencerFilterCollectionViewReuseIdentifier")
        collectionView.register(InfluencerFilterCollectionViewCell.self, forCellWithReuseIdentifier: InfluencerFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
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
    
    
    var selectedIndex = IndexPath(row: -1, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSegmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 178, width: view.width - 40, height: 30), buttonTitle: ["Influencer Özellikleri", "Takipçi Özellikleri"])
        customSegmented.delegate = self
        view.addSubview(customSegmented)
        
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
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        
        view.backgroundColor = .white
        
        
        
        influencerFilterCollectionView.isHidden = true
        followersFilterCollectionView.isHidden = true
        
        influencerFilterCollectionView.delegate = self
        influencerFilterCollectionView.dataSource = self
        
        followersFilterCollectionView.delegate = self
        followersFilterCollectionView.dataSource = self
        
        
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
        
        searchBar.delegate = self
    }
    
    @objc func hideKeyboard() {
        searchBar.endEditing(true)
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
        view.addSubview(clearButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.influencerHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.influencerHeadingsTableView.delegate?.tableView?(self.influencerHeadingsTableView, didSelectRowAt: indexPath)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLabel.frame = CGRect(x: 80, y: 20, width: view.width - 160, height: 30)
        dismissViewButton.frame = CGRect(x: view.width - 45, y: 22, width: 26, height: 26)
        clearButton.frame = CGRect(x: 10, y: topLabel.top, width: 60, height: 30)
        segmentedControl.frame = CGRect(x: 40, y: topLabel.bottom + 20, width: view.width - 80, height: 28)
        searchBar.frame = CGRect(x: 10, y: segmentedControl.bottom + 20, width: view.width - 20, height: 40) //158
        searchButton.frame = CGRect(x: 20, y: view.height - 120 , width: view.width - 40, height: 50)
        influencerFilterCollectionView.frame = CGRect(x: 15, y: segmentedControl.bottom + 12, width: view.width - 30, height: 25)
        followersFilterCollectionView.frame = CGRect(x: 15, y: influencerFilterCollectionView.bottom + 12, width: view.width - 30, height: 25)
        influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        followersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        followersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        
    }
    
    func clearFilters(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = selectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayOneInfluencerInstagram[deSelectOne].isSelected = !arrayOneInfluencerInstagram[deSelectOne].isSelected
            minFollowers = nil
        }
        
        if let deSelectTwo = arrayTwoInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayTwoInfluencerInstagram[deSelectTwo].isSelected = !arrayTwoInfluencerInstagram[deSelectTwo].isSelected
            maxFollowers = nil
        }
        
        if let deSelectThree = arrayThreeInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayThreeInfluencerInstagram[deSelectThree].isSelected = !arrayThreeInfluencerInstagram[deSelectThree].isSelected
            gender = nil
        }
        
        if let deSelectFour = arrayFourInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayFourInfluencerInstagram[deSelectFour].isSelected = !arrayFourInfluencerInstagram[deSelectFour].isSelected
            if let interest = interests.firstIndex(where: { $0 == arrayFourInfluencerInstagram[deSelectFour].code as? Int }) {
                interests.remove(at: interest)
            }
        }
        
        
        if let deSelectFive = arrayFiveInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayFiveInfluencerInstagram[deSelectFive].isSelected = !arrayFiveInfluencerInstagram[deSelectFive].isSelected
            
            language = nil
        }
        
        if let deSelectSix = arraySixInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arraySixInfluencerInstagram[deSelectSix].isSelected = !arraySixInfluencerInstagram[deSelectSix].isSelected
            
            engagementRate = nil
        }
        
        if let deSelectSeven = arraySevenInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arraySevenInfluencerInstagram[deSelectSeven].isSelected = !arraySevenInfluencerInstagram[deSelectSeven].isSelected
            hasYoutube = nil
        }
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.influencerOptionsTableView.reloadData()
        }
    }
    
    @objc func clearButtonTapped() {
        let countFilter = selectedFilterArray.count
        
        for i in 0..<countFilter {
            clearFilters(row: i, section: 0)
        }
        selectedFilterArray.removeAll()
        hideSearchBar()
    }
    
    @objc func filterDismissButtonTapped(sender: CustomFilterButton) {
        clearFilters(row: sender.row, section: sender.section)
        selectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    func hideSearchBar() {
        if selectedFilterArray.count == 0 {
            searchBar.isHidden = false
            influencerFilterCollectionView.isHidden = true
            followersFilterCollectionView.isHidden = true
        } else {
            searchBar.isHidden = true
            influencerFilterCollectionView.isHidden = false
            followersFilterCollectionView.isHidden = false
        }
    }
    
    func searchButtonClicked() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        
        let deleteComponents: [String: Any] = ["maxPage": -1,
                                               "initialPage": 0]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "deleteComponents"), object: nil, userInfo: deleteComponents)
        
        var searchBarText = ""
        if searchBar.text?.contains("@") == true {
            searchBarText = searchBar.text!
        } else {
            searchBarText = "@\(searchBar.text!)"
        }
        
        if !searchBar.isHidden {
            APICaller.shared.searchByUsername(username: searchBarText) { response in
                switch response {
                case .success(let model):
                    var directProfileResponse: [SearchWithFilterCellViewModel] = []
                    directProfileResponse.append(contentsOf: model.data.bodyNew.directs.map({
                        .init(engagementRate: $0.profile.engagementRate,
                              engagements: $0.profile.engagements,
                              followers: $0.profile.followers,
                              fullname: $0.profile.fullname,
                              picture: $0.profile.picture,
                              url: $0.profile.url,
                              username: $0.profile.username,
                              isPrivate: $0.profile.isPrivate,
                              influencerId: $0.userId)
                    })
                    )
                    
                    
                    let dataDict: [String: [SearchWithFilterCellViewModel]] = ["dataDict": directProfileResponse]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil, userInfo: dataDict)
                    
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    let errorString = "Aradığınız öğe bulunamadı."
                    let usernameErrorDict: [String: String] = ["searcByUsernameUnsuccessful": errorString]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "usernameErrorDict"), object: nil, userInfo: usernameErrorDict)
                    
                }
                
                
            }
        } else {
            //            print("minFollowers \(minFollowers)")
            //            print("maxFollowers \(maxFollowers)")
            //            print("gender \(gender)")
            //            print("interests \(interests)")
            //            print("language \(language)")
            //            print("engagementRate \(engagementRate)")
            //            print("hasYoutube \(hasYoutube)" )
            
            APICaller.shared.filter(page: 0,minFollowers: minFollowers, maxFollowers: maxFollowers, gender: gender, interests: interests, language: language, engagementRate: engagementRate, hasYoutube: hasYoutube) { response in
                
                
                switch response {
                case .success(let model):
                    var filterResultArray: [SearchWithFilterCellViewModel] = []
                    filterResultArray.append(contentsOf: model.data.bodyNew.lookalikes.map({
                        .init(engagementRate: $0.profile.engagementRate,
                              engagements: $0.profile.engagements,
                              followers: $0.profile.followers,
                              fullname: $0.profile.fullname,
                              picture: $0.profile.picture,
                              url: nil,
                              username: $0.profile.username,
                              isPrivate: nil,
                              influencerId: $0.userId)
                    }))
                    
                    
                    
                    let filterBasedDict: [String: Any] = ["total": model.data.bodyNew.total,
                                                          "minFollowers": self.minFollowers as Any,
                                                          "maxFollowers": self.maxFollowers as Any,
                                                          "gender": self.gender as Any,
                                                          "interests": self.interests,
                                                          "engagementRate": self.engagementRate as Any,
                                                          "hasYoutube": self.hasYoutube as Any
                    ]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterBasedDict"), object: nil, userInfo: filterBasedDict)
                    
                    
                    
                    let filterResultDict: [String: [SearchWithFilterCellViewModel]] = ["filterResultDict": filterResultArray]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newFilterResultDict"), object: nil, userInfo: filterResultDict)
                    
                    
                    
                    
                case .failure(let error):
                    print(error)
                    
                    let filterString = "Aradığınız öğe bulunamadı."
                    let filterErrorDict: [String: String] = ["searcByFilterUnsuccessful": filterString]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterErrorDict"), object: nil, userInfo: filterErrorDict)
                }
            }
        }
    }
    
    @objc func searchButtonTapped() {
        searchButtonClicked()
        
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
                //                influencerOptionsTableView.isHidden = true
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
    func cellConfig(cell: UITableViewCell, cellText: String, optionArray: [OptionsSelected], indexPath: IndexPath) {
        cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        cell.textLabel?.numberOfLines = 0
        
        
        
        if optionArray[indexPath.row].isSelected == false {
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            
            
        } else {
            
            cell.backgroundColor = UIColor().infpromo
            cell.textLabel?.textColor = .white
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            switch tableView {
            case influencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
                let cellText = influencerPropertiesHeadingsInstagram[indexPath.row].title
                cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
                cell.textLabel?.numberOfLines = 0
                cell.backgroundColor = .systemGray6
                
                cell.selectionStyle = .none
                
                return cell
            case influencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
                
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    let cellText = arrayOneInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayOneInfluencerInstagram, indexPath: indexPath)
                    
                    
                case [0,1]:
                    let cellText = arrayTwoInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayTwoInfluencerInstagram, indexPath: indexPath)
                    
                case [0,2]:
                    let cellText = arrayThreeInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayThreeInfluencerInstagram, indexPath: indexPath)
                    
                case [0,3]:
                    let cellText = arrayFourInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayFourInfluencerInstagram, indexPath: indexPath)
                    
                case [0,4]:
                    let cellText = arrayFiveInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayFiveInfluencerInstagram, indexPath: indexPath)
                    
                case [0,5]:
                    let cellText = arraySixInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arraySixInfluencerInstagram, indexPath: indexPath)
                    
                case [0,6]:
                    let cellText = arraySevenInfluencerInstagram[indexPath.row].option
                    cellConfig(cell: cell, cellText: cellText, optionArray: arraySevenInfluencerInstagram, indexPath: indexPath)
                    
                default:
                    //                    let cellText = arrayOneInfluencerInstagram[indexPath.row].option
                    //                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayOneInfluencerInstagram, indexPath: indexPath)
                    print("whaaaaaaattttttt")
                    
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
    
    
    
    
    func handleIsSelected(optionsArray: [OptionsSelected], filteredArray: inout [SelectedFilter], indexPath: IndexPath) {
        let selectedRow = optionsArray[indexPath.row]
        optionsArray.map({ $0.isSelected = false })
        
        let ids = optionsArray.map({ $0.id })
        
        for x in ids {
            if let first = filteredArray.firstIndex(where: { $0.id == x}) {
                filteredArray.remove(at: first)
            }
        }
        
        filteredArray.insert(.init(filterName: selectedRow.option, id: selectedRow.id), at: 0)
        selectedRow.isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            switch tableView {
            case influencerHeadingsTableView:
                
                selectedIndex = indexPath
                
                let selectedRow = influencerPropertiesHeadingsInstagram[indexPath.row]
                selectedRow.isSelected = !selectedRow.isSelected
                
                let deSelectedCellsCount = (influencerHeadingsTableView.numberOfRows(inSection: 0))
                for x in 0..<deSelectedCellsCount {
                    let selectedCells = influencerHeadingsTableView.cellForRow(at: IndexPath(row: x, section: 0))
                    selectedCells?.textLabel?.textColor = UIColor.black
                    selectedCells?.textLabel?.attributedText = NSAttributedString(string: influencerPropertiesHeadingsInstagram[x].title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
                    selectedCells?.backgroundColor = .systemGray6
                    
                }
                
                if selectedRow.isSelected {
                    
                    let _ = influencerPropertiesHeadingsInstagram.map({ $0.isSelected = false })
                    print(selectedRow)
                    let selectedCell = influencerHeadingsTableView.cellForRow(at: indexPath)
                    //                    selectedCell?.textLabel?.textColor = UIColor().infpromo
                    selectedCell?.textLabel?.attributedText = NSAttributedString(string: selectedRow.title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
                    selectedCell?.backgroundColor = .systemGray5
                }
                
            case influencerOptionsTableView:
                print("inside baby")
                
                filterIndexCount += 1
                
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    let selectedRowOne = arrayOneInfluencerInstagram[indexPath.row]
                    selectedRowOne.isSelected = !selectedRowOne.isSelected
                    
                    if selectedRowOne.isSelected {
                        handleIsSelected(optionsArray: arrayOneInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        minFollowers = selectedRowOne.code as? Int
                    } else {
                        minFollowers = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowOne.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                    
                case [0,1]:
                    let selectedRowTwo = arrayTwoInfluencerInstagram[indexPath.row]
                    selectedRowTwo.isSelected = !selectedRowTwo.isSelected
                    if selectedRowTwo.isSelected {
                        handleIsSelected(optionsArray: arrayTwoInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        maxFollowers = selectedRowTwo.code as? Int
                    } else {
                        maxFollowers = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowTwo.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                case [0,2]:
                    let selectedRowThree = arrayThreeInfluencerInstagram[indexPath.row]
                    selectedRowThree.isSelected = !selectedRowThree.isSelected
                    if selectedRowThree.isSelected {
                        handleIsSelected(optionsArray: arrayThreeInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        gender = selectedRowThree.code as? String
                    } else {
                        gender = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowThree.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                case [0,3]:
                    let selectedRowFour = arrayFourInfluencerInstagram[indexPath.row]
                    selectedRowFour.isSelected = !selectedRowFour.isSelected
                    if selectedRowFour.isSelected {
                        interests.append(selectedRowFour.code as? Int)
                        selectedFilterArray.insert(.init(filterName: selectedRowFour.option, id: selectedRowFour.id), at: 0)
                    }  else {
                        if let interest = interests.firstIndex(where: { $0 == arrayFourInfluencerInstagram[indexPath.row].code as? Int }) {
                            interests.remove(at: interest)
                        }
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowFour.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                case [0,4]:
                    let selectedRowFive = arrayFiveInfluencerInstagram[indexPath.row]
                    selectedRowFive.isSelected = !selectedRowFive.isSelected
                    if selectedRowFive.isSelected {
                        handleIsSelected(optionsArray: arrayFiveInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        language = selectedRowFive.code as? String
                        
                    } else {
                        language = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowFive.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                case [0,5]:
                    let selectedRowSix = arraySixInfluencerInstagram[indexPath.row]
                    selectedRowSix.isSelected = !selectedRowSix.isSelected
                    if selectedRowSix.isSelected {
                        handleIsSelected(optionsArray: arraySixInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        engagementRate = selectedRowSix.code as? Double
                    } else {
                        engagementRate = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowSix.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                case [0,6]:
                    let selectedRowSeven = arraySevenInfluencerInstagram[indexPath.row]
                    selectedRowSeven.isSelected = !selectedRowSeven.isSelected
                    if selectedRowSeven.isSelected {
                        handleIsSelected(optionsArray: arraySevenInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath)
                        hasYoutube = selectedRowSeven.code as? Bool
                    } else {
                        hasYoutube = nil
                        if let first = selectedFilterArray.firstIndex(where: { $0.id == selectedRowSeven.id}) {
                            selectedFilterArray.remove(at: first)
                        }
                    }
                    
                default:
                    print("default is collapse")
                }
                //                influencerOptionsTableView.reloadData()
                
                //                influencerOptionsTableView.reloadData()
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
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
        }
        
        influencerOptionsTableView.reloadData()
        
        self.influencerFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCount, section: 0), at: .right, animated: true)
        hideSearchBar()
        
    }
}

// CollectionView Delegate and DataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case influencerFilterCollectionView:
            return selectedFilterArray.count
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
            cell.configureCellLabel(with: selectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(filterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            print(selectedFilterArray)
            return cell
        case followersFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FollowersFilterCollectionViewCell
            cell.configureCellLabel(with: models[indexPath.item])
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
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
            header.frame = CGRect(x: 0, y: 0, width: collectionView.width / 5, height: 25)
            header.backgroundColor = .white
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize: 12)
            title.sizeToFit()
            title.textColor = UIColor().infpromo
            title.text = "influencer: "
            title.numberOfLines = 0
            title.frame = header.frame
            
            header.addSubview(title)
            return header
        case "followersFilterCollectionViewKind":
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "followersFilterCollectionViewKind", withReuseIdentifier: "followersFilterCollectionViewReuseIdentifier", for: indexPath)
            header.frame = CGRect(x: 0, y: 0, width: collectionView.width / 5, height: 25)
            header.backgroundColor = .white
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize: 12)
            title.sizeToFit()
            title.textColor = UIColor().infpromo
            title.text = "takipçi: "
            title.numberOfLines = 0
            title.frame = header.frame
            
            header.addSubview(title)
            
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

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  //if desired
        searchButtonClicked()
        return true
    }
}
