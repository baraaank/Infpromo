////
////  InstagramSearchViewController.swift
////  Infpromo
////
////  Created by BaranK Kutlu on 28.02.2022.
////
//
//import UIKit
//
//class InstagramSearchViewController: UIViewController {
//
//    var headingsArray: [SearchHeadings] = [
//        SearchHeadings(heading: "Influencer Özellikleri", options: ["nil"], isCollapse: false),
//        SearchHeadings(heading: "Min Takipçi Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"], isCollapse: true),
//        SearchHeadings(heading: "Max Takipçi Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"], isCollapse: true),
//        SearchHeadings(heading: "Lokasyon", options: ["Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"], isCollapse: true),
//        SearchHeadings(heading: "Cinsiyet", options: ["Kadın", "Erkek"], isCollapse: true),
//        SearchHeadings(heading: "İlgi Alanları", options: ["Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"], isCollapse: true),
//        SearchHeadings(heading: "Dil", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
//        SearchHeadings(heading: "Etkileşim Oranı", options: ["\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %",], isCollapse: true),
//        SearchHeadings(heading: "Youtube Hesabı", options: ["Var", "Yok"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Özellikleri", options: ["nil"], isCollapse: false),
//        SearchHeadings(heading: "Takipçi Cinsiyet Yoğunluğu", options: ["Kadın", "Erkek"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Yaş Aralığı", options: ["18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi İlgi Alanları", options: ["Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Dili", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
//        SearchHeadings(heading: "", options: [""], isCollapse: true),
//        SearchHeadings(heading: "", options: [""], isCollapse: true),
//    ]
//
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(InstagramSearchTableViewCell.self, forCellReuseIdentifier: InstagramSearchTableViewCell.reuseIdentifier)
//
//        if #available(iOS 15.0, *) {
//            tableView.sectionHeaderTopPadding = 0
//        }
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        addSubviews()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//
//    }
//
//    func addSubviews() {
//        view.addSubview(tableView)
//    }
//
//    override func viewDidLayoutSubviews() {
//        tableView.frame = view.bounds
//    }
//
//
//
//
//}
//
////Table View
//extension InstagramSearchViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        headingsArray.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let isCollapse = !headingsArray[section].isCollapse
//        if isCollapse {
//            if section == 0 || section == 9 {
//                return 0
//            }
//            return headingsArray[section].options.count
//        } else {
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: InstagramSearchTableViewCell.reuseIdentifier, for: indexPath) as! InstagramSearchTableViewCell
//
//
//
//        cell.fillOptions(with: headingsArray[indexPath.section], index: indexPath.row)
//
////        cell.textLabel?.text = headingText
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        40
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.width, height: 40))
//        button.tag = section
//        let sectionTitle = headingsArray[section].heading
//
//        if section == 0 || section == 9 {
//            let attributedString = NSAttributedString(string: sectionTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.white])
//
//            button.setAttributedTitle(attributedString, for: .normal)
//            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
//            button.backgroundColor = UIColor().infpromo
//            button.isEnabled = false
//        } else if section == 14 || section == 15 || section == 16  {
//            button.isEnabled = false
//        } else {
//            let attributedString = NSAttributedString(string: sectionTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
//
//            button.setAttributedTitle(attributedString, for: .normal)
//
//
//            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
//            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//            button.setTitleColor(.black, for: .normal)
//            button.backgroundColor = .white
//
//
//
//            let buttonImage = UIImage(systemName: "chevron.down")
//
//            let buttonImageView = UIImageView(image: buttonImage)
//            buttonImageView.tintColor = UIColor().infpromo
//            buttonImageView.frame = CGRect(x: view.width - 50, y: 15, width: 30, height: 10)
//
//
//            buttonImageView.clipsToBounds = true
//            buttonImageView.contentMode = .scaleAspectFit
//
//
//            button.addSubview(buttonImageView)
//
//            UIView.animate(withDuration: 0.2) {
//                button.subviews.first?.transform = CGAffineTransform(rotationAngle: .pi * 2)
//            }
//
//        }
//
//
//
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//
//        return button
//    }
//
//    @objc func buttonTapped(button: UIButton) {
//        let section = button.tag
//        var indexPaths = [IndexPath]()
//
//
//
//        for row in headingsArray[section].options.indices {
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
//
//        let isCollapse = !headingsArray[section].isCollapse
//        headingsArray[section].isCollapse = isCollapse
//
//
//
//
//
//
//        let deletedRowsHeightCalculator = CGFloat(tableView.frame.size.height - CGFloat(indexPaths.count * 40))
//
//        let insertedRowsHeightCalculator = CGFloat(tableView.frame.size.height + CGFloat(indexPaths.count * 40))
//
//        if isCollapse {
//            tableView.deleteRows(at: indexPaths, with: .middle)
//            tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: deletedRowsHeightCalculator)
//
//
//            UIView.animate(withDuration: 0.2) {
//                button.subviews.first?.transform = CGAffineTransform(rotationAngle: .pi * 2)
//            }
//
//
//
//        } else {
//            tableView.insertRows(at: indexPaths, with: .middle)
//            tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: insertedRowsHeightCalculator)
//
//            UIView.animate(withDuration: 0.2) {
//                button.subviews.first?.transform = CGAffineTransform(rotationAngle: -.pi)
//            }
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        40
//
//    }
//
//
//
//
//}


import UIKit


var headingsArray: [SearchHeadings] = [
        SearchHeadings(heading: "Influencer Özellikleri", options: ["nil"], isCollapse: false),
        SearchHeadings(heading: "Min Takipçi Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"], isCollapse: true),
        SearchHeadings(heading: "Max Takipçi Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"], isCollapse: true),
        SearchHeadings(heading: "Lokasyon", options: ["Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"], isCollapse: true),
        SearchHeadings(heading: "Cinsiyet", options: ["Kadın", "Erkek"], isCollapse: true),
        SearchHeadings(heading: "İlgi Alanları", options: ["Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"], isCollapse: true),
        SearchHeadings(heading: "Dil", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
        SearchHeadings(heading: "Etkileşim Oranı", options: ["\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %",], isCollapse: true),
        SearchHeadings(heading: "Youtube Hesabı", options: ["Var", "Yok"], isCollapse: true),
        SearchHeadings(heading: "Takipçi Özellikleri", options: ["nil"], isCollapse: false),
        SearchHeadings(heading: "Takipçi Cinsiyet Yoğunluğu", options: ["Kadın", "Erkek"], isCollapse: true),
        SearchHeadings(heading: "Takipçi Yaş Aralığı", options: ["18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"], isCollapse: true),
        SearchHeadings(heading: "Takipçi İlgi Alanları", options: ["Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"], isCollapse: true),
        SearchHeadings(heading: "Takipçi Dili", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
        SearchHeadings(heading: "", options: [""], isCollapse: true),
        SearchHeadings(heading: "", options: [""], isCollapse: true),
    ]

class InstagramSearchViewController: UIViewController {
    
    
    //InfluencersProperties
    let influencerPropertiesHeadings = [
        "Min Takipçi Sayısı", "Max Takipçi Sayısı", "Lokasyon", "Cinsiyet", "İlgi Alanları", "Dil", "Etkileşim Oranı", "Youtube Hesabı"
    ]
    
    let arrayOneInfluencer = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
    ]
    
    let arrayTwoInfluencer = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"
    ]
    
    let arrayThreeInfluencer = [
        "Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"
    ]
    
    let arrayFourInfluencer = [
        "Kadın", "Erkek"
    ]
    
    let arrayFiveInfluencer = [
        "Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"
    ]
    
    let arraySixInfluencer = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    let arraySevenInfluencer = [
        "\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %"
    ]
    
    let arrayEightInfluencer = [
        "Var", "Yok"
    ]
    
    var populateInfluencer = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
    ]
    
    
    //FollowersProperties
    let followersPropertiesHeadings = [
        "Takipçi Cinsiyet Yoğunluğu", "Takipçi Yaş Aralığı", "Takipçi İlgi Alanları", "Takipçi Dili"
    ]
    
    let arrayOneFollowers = [
        "Kadın", "Erkek"
    ]
    
    let arrayTwoFollowers = [
        "18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"
    ]
    
    let arrayThreeFollowers = [
        "Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"
    ]
    
    let arrayFourFollowers = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    var populateFollowers = [
        "Kadın", "Erkek"
    ]
    
    private let influencerPropertiesHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerPropertiesHeadingsCell")
        return tableView
    }()
    
    private let influencerPropertiesOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerPropertiesOptionsCell")
        return tableView
    }()
    
    private let followersPropertiesHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersPropertiesHeadingsCell")
        return tableView
    }()
    
    private let followersPropertiesOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersPropertiesOptionsCell")
        return tableView
    }()
    
    
    
    var segmented: CustomSegmentedControl!
    
    private let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Kullanıcı Adı"
        //        searchController.searchBar.barTintColor = UIColor().infpromo
        //        searchController.searchBar.layer.borderWidth = 3
        //        searchController.searchBar.layer.borderColor = UIColor().infpromo.cgColor
        //        searchController.searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        
        return searchController
    }()
    
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Instagram"
        label.textAlignment = .center
        return label
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
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Arama", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        navigationItem.searchController = searchController
        segmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 20, width: view.width - 40, height: 40), buttonTitle: ["Influencer Özellikleri", "Takipçi Özellikleri"])
        segmented.delegate = self
        segmented.backgroundColor = .white
        view.addSubview(segmented)
        
        influencerPropertiesHeadingsTableView.delegate = self
        influencerPropertiesHeadingsTableView.dataSource = self
        
        influencerPropertiesOptionsTableView.delegate = self
        influencerPropertiesOptionsTableView.dataSource = self
        
        followersPropertiesHeadingsTableView.delegate = self
        followersPropertiesHeadingsTableView.dataSource = self
        
        followersPropertiesOptionsTableView.delegate = self
        followersPropertiesOptionsTableView.dataSource = self
        
        searchBar.isHidden = true
        
        followersPropertiesOptionsTableView.isHidden = true
        followersPropertiesHeadingsTableView.isHidden = true
        
    }
    
    
    func addSubviews() {
        
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(influencerPropertiesHeadingsTableView)
        view.addSubview(influencerPropertiesOptionsTableView)
        view.addSubview(followersPropertiesHeadingsTableView)
        view.addSubview(followersPropertiesOptionsTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchBar.frame = CGRect(x: 10, y: segmented.bottom + 20, width: view.width - 20, height: 40)
        searchButton.frame = CGRect(x: 20, y: view.height - 120 , width: view.width - 40, height: 50)
        influencerPropertiesHeadingsTableView.frame = CGRect(x: 0, y: segmented.bottom + 20, width: view.width / 3, height: view.height - label.height - searchButton.height - 70 - 100)
        influencerPropertiesOptionsTableView.frame = CGRect(x: influencerPropertiesHeadingsTableView.right, y: segmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: influencerPropertiesHeadingsTableView.height)
        followersPropertiesHeadingsTableView.frame = CGRect(x: 0, y: segmented.bottom + 20, width: view.width / 3, height: view.height - label.height - searchButton.height - 70 - 100)
        followersPropertiesOptionsTableView.frame = CGRect(x: followersPropertiesHeadingsTableView.right, y: segmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: followersPropertiesHeadingsTableView.height)
        
        
    }
    
    @objc func searchButtonTapped() {
        print("search button tapped")
    }

}


extension InstagramSearchViewController: CustomSegmentedControlDelegate {
    
    func changeToIndex(index: Int) {

        if index == 0 {
            
            searchBar.isHidden = true
            influencerPropertiesHeadingsTableView.isHidden = false
            influencerPropertiesOptionsTableView.isHidden = false
            followersPropertiesOptionsTableView.isHidden = true
            followersPropertiesHeadingsTableView.isHidden = true
        } else if index == 1 {
            searchBar.isHidden = true
            influencerPropertiesHeadingsTableView.isHidden = true
            influencerPropertiesOptionsTableView.isHidden = true
            followersPropertiesOptionsTableView.isHidden = false
            followersPropertiesHeadingsTableView.isHidden = false
            
        }
    }
    
    
}

extension InstagramSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case influencerPropertiesHeadingsTableView:
            return influencerPropertiesHeadings.count
        case influencerPropertiesOptionsTableView:
            return populateInfluencer.count
        case followersPropertiesHeadingsTableView:
            return followersPropertiesHeadings.count
        case followersPropertiesOptionsTableView:
            return populateFollowers.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case influencerPropertiesHeadingsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "influencerPropertiesHeadingsCell", for: indexPath)
            cell.textLabel?.text = influencerPropertiesHeadings[indexPath.row]
            return cell
        case influencerPropertiesOptionsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "influencerPropertiesOptionsCell", for: indexPath)
            cell.textLabel?.text = populateInfluencer[indexPath.row]
            return cell
        case followersPropertiesHeadingsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "followersPropertiesHeadingsCell", for: indexPath)
            cell.textLabel?.text = followersPropertiesHeadings[indexPath.row]
            return cell
        case followersPropertiesOptionsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "followersPropertiesOptionsCell", for: indexPath)
            cell.textLabel?.text = populateFollowers[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == influencerPropertiesHeadingsTableView {
            switch indexPath.row {
            case 0:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 1:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 2:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 3:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 4:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 5:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 6:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            case 7:
                populateInfluencerArray(sender: indexPath.row)
                influencerPropertiesOptionsTableView.reloadData()
            default:
                print("error")
            }
        }
        
        else if tableView == followersPropertiesHeadingsTableView {
            switch indexPath.row {
            case 0:
                populateFollowersArray(sender: indexPath.row)
                followersPropertiesOptionsTableView.reloadData()
            case 1:
                populateFollowersArray(sender: indexPath.row)
                followersPropertiesOptionsTableView.reloadData()
            case 2:
                populateFollowersArray(sender: indexPath.row)
                followersPropertiesOptionsTableView.reloadData()
            case 3:
                populateFollowersArray(sender: indexPath.row)
                followersPropertiesOptionsTableView.reloadData()
            default:
                print("error")
            }
        }
    }
    
    func populateInfluencerArray(sender: Int) {
        populateInfluencer.removeAll()
        switch sender {
        case 0:
            populateInfluencer = arrayOneInfluencer
        case 1:
            populateInfluencer = arrayTwoInfluencer
        case 2:
            populateInfluencer = arrayThreeInfluencer
        case 3:
            populateInfluencer = arrayFourInfluencer
        case 4:
            populateInfluencer = arrayFiveInfluencer
        case 5:
            populateInfluencer = arraySixInfluencer
        case 6:
            populateInfluencer = arraySevenInfluencer
        case 7:
            populateInfluencer = arrayEightInfluencer
        default:
            print("oooooerrrrrororoorororor")
        }
    }
    
    func populateFollowersArray(sender: Int) {
        populateFollowers.removeAll()
        switch sender {
        case 0:
            populateFollowers = arrayOneFollowers
        case 1:
            populateFollowers = arrayTwoFollowers
        case 2:
            populateFollowers = arrayThreeFollowers
        case 3:
            populateFollowers = arrayFourFollowers
        default:
            print("oooooerrrrrororoorororor")
        }
    }
    
    
}
