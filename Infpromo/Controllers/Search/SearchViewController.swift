

import UIKit


class SearchViewController: UIViewController {
    
    
    
    
    // MARK: InstagramArrays
    //InfluencersProperties
    let influencerPropertiesHeadingsInstagram = [
        "Min Takipçi Sayısı", "Max Takipçi Sayısı", "Lokasyon", "Cinsiyet", "İlgi Alanları", "Dil", "Etkileşim Oranı", "Youtube Hesabı"
    ]
    
    let arrayOneInfluencerInstagram = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
    ]
    
    let arrayTwoInfluencerInstagram = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"
    ]
    
    let arrayThreeInfluencerInstagram = [
        "Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"
    ]
    
    let arrayFourInfluencerInstagram = [
        "Kadın", "Erkek"
    ]
    
    let arrayFiveInfluencerInstagram = [
        "Kıyafet, Ayakkabı, Çanta & Aksesuar", "Arkadaşlar, Aile & İlişkiler", "Kamera & Fotoğraf", "Restoran, Yiyecek & İçecek", "Gezi, Turizm & Havacılık", "Oyuncak, Çocuk & Bebek", "Güzellik & Kozmetik", "Müzik", "Televizyon & Sinema", "Elektronik & Bilgisayar", "Spor", "Sanat & Dizayn", "Araba & Motosiklet", "Fitness & Yoga", "Evcil hayvan", "Alışveriş & Parakende", "Kahve, Çay & İçecek", "Sağlıklı yaşam", "Spor giyim", "Lüks ürünler"
    ]
    
    let arraySixInfluencerInstagram = [
        "Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"
    ]
    
    let arraySevenInfluencerInstagram = [
        "\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %"
    ]
    
    let arrayEightInfluencerInstagram = [
        "Var", "Yok"
    ]
    
    var populateInfluencerInstagram = [
        "25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"
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
        influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        followersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        followersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        
        
    }
    
    @objc func searchButtonTapped() {
        APICaller.shared.searchByUsername(username: searchBar.text!) { response in
            switch response {
            case .success(let model):
                var directProfileResponse: [DirectProfileResponse] = []
                directProfileResponse.append(contentsOf: model.data.bodyNew.directs.map({
                    .init(engagementRate: $0.profile.engagementRate,
                          engagements: $0.profile.engagements,
                          followers: $0.profile.followers,
                          fullname: $0.profile.fullname,
                          picture: $0.profile.picture,
                          url: $0.profile.url,
                          username: $0.profile.username,
                          isPrivate: $0.profile.isPrivate)
                })
                )
                
                
                let dataDict: [String: [DirectProfileResponse]] = ["dataDict": directProfileResponse]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil, userInfo: dataDict)
                
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
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
                return populateInfluencerInstagram.count
            case followersHeadingsTableView:
                return followersPropertiesHeadingsInstagram.count
            case followersOptionsTableView:
                return populateFollowersInstagram.count
            default:
                print("numberOfRowsInSection switch error")
            }
        case 1:
            switch tableView {
            case influencerHeadingsTableView:
                return influencerPropertiesHeadingsYT.count
            case influencerOptionsTableView:
                return populateInfluencerYT.count
            case followersHeadingsTableView:
                return followersPropertiesHeadingsYT.count
            case followersOptionsTableView:
                return populateFollowersYT.count
            default:
                print("numberOfRowsInSection switch error")
            }
        case 2:
            switch tableView {
            case influencerHeadingsTableView:
                return influencerPropertiesHeadingsYT.count
            case influencerOptionsTableView:
                return populateInfluencerYT.count
            case followersHeadingsTableView:
                return followersPropertiesHeadingsYT.count
            case followersOptionsTableView:
                return populateFollowersYT.count
            default:
                print("numberOfRowsInSection switch error")
            }
        default:
            print("numberOfRowsInSection switch error")
            break
        }
        
        return 1
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
                let cellText = populateInfluencerInstagram[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
            case followersHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
                let cellText = followersPropertiesHeadingsInstagram[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                
                return cell
            case followersOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
                let cellText = populateFollowersInstagram[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
                
            default:
                print("cellforrowat error")
            }
            
            
            
            
        case 1:
            switch tableView {
            case influencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
                let cellText = influencerPropertiesHeadingsYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case influencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
                let cellText = populateInfluencerYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case followersHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
                let cellText = followersPropertiesHeadingsYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case followersOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
                let cellText = populateFollowersYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
                
            default:
                print("cellforrowat error")
                
                
            }
            
            
        case 2:
            switch tableView {
            case influencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
                let cellText = influencerPropertiesHeadingsYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case influencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
                let cellText = populateInfluencerYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case followersHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
                let cellText = followersPropertiesHeadingsYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
            case followersOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
                let cellText = populateFollowersYT[indexPath.row]
                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                return cell
                
            default:
                print("cellforrowat error")
            }
            
            
        default:
            print("")
        }
        return UITableViewCell()
    }
    
    
    //cell text attributtes
    func cellConfig(cell: UITableViewCell, cellText: String, tableView: UITableView, indexPath: IndexPath) {
        cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        cell.textLabel?.numberOfLines = 0
        
        
        if let selectedRows = tableView.indexPathsForSelectedRows, selectedRows.contains(indexPath) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
    }
    
    
    //cell checkmark handled
    func handleCheck(tableView: UITableView, indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let headIndex = indexPath.row
        
        handleCheck(tableView: influencerOptionsTableView, indexPath: indexPath)
        handleCheck(tableView: followersOptionsTableView, indexPath: indexPath)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            switch tableView {
            case influencerHeadingsTableView:
                
                populateInfluencerArray(sender: headIndex)
                influencerOptionsTableView.reloadData()
                
            case followersHeadingsTableView:
                
                populateFollowersArray(sender: headIndex)
                followersOptionsTableView.reloadData()
                
            case influencerOptionsTableView:
                print(populateInfluencerInstagram[indexPath.row])
            case followersOptionsTableView:
                print(populateFollowersInstagram[indexPath.row])
                
                
            default:
                print("????")
                
            }
            
        case 1:
            switch tableView {
            case influencerHeadingsTableView:
                
                populateInfluencerArray(sender: headIndex)
                influencerOptionsTableView.reloadData()
                
            case followersHeadingsTableView:
                
                populateFollowersArray(sender: headIndex)
                followersOptionsTableView.reloadData()
                
            default:
                print("default")
            }
        case 2:
            switch tableView {
            case influencerHeadingsTableView:
                
                populateInfluencerArray(sender: headIndex)
                influencerOptionsTableView.reloadData()
                
            case followersHeadingsTableView:
                
                populateFollowersArray(sender: headIndex)
                followersOptionsTableView.reloadData()
                
            default:
                print("default")
            }
        default:
            print("didselect switch error")
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .none
//    }
    
    
    func populateInfluencerArray(sender: Int) {
        populateInfluencerInstagram.removeAll()
        switch sender {
        case 0:
            populateInfluencerInstagram = arrayOneInfluencerInstagram
            populateInfluencerYT = arrayOneInfluencerYT
        case 1:
            populateInfluencerInstagram = arrayTwoInfluencerInstagram
            populateInfluencerYT = arrayTwoInfluencerYT
        case 2:
            populateInfluencerInstagram = arrayThreeInfluencerInstagram
            populateInfluencerYT = arrayThreeInfluencerYT
        case 3:
            populateInfluencerInstagram = arrayFourInfluencerInstagram
            populateInfluencerYT = arrayFourInfluencerYT
        case 4:
            populateInfluencerInstagram = arrayFiveInfluencerInstagram
            populateInfluencerYT = arrayFiveInfluencerYT
        case 5:
            populateInfluencerInstagram = arraySixInfluencerInstagram
            populateInfluencerYT = arraySixInfluencerYT
        case 6:
            populateInfluencerInstagram = arraySevenInfluencerInstagram
            populateInfluencerYT = arraySevenInfluencerYT
        case 7:
            populateInfluencerInstagram = arrayEightInfluencerInstagram
            populateInfluencerYT = arrayEightInfluencerYT
        default:
            print("oooooerrrrrororoorororor")
        }
    }
    
    func populateFollowersArray(sender: Int) {
        populateFollowersInstagram.removeAll()
        switch sender {
        case 0:
            populateFollowersInstagram = arrayOneFollowersInstagram
            populateFollowersYT = arrayOneFollowersYT
        case 1:
            populateFollowersInstagram = arrayTwoFollowersInstagram
            populateFollowersYT = arrayTwoFollowersYT
        case 2:
            populateFollowersInstagram = arrayThreeFollowersInstagram
            populateFollowersYT = arrayThreeFollowersYT
        case 3:
            populateFollowersInstagram = arrayFourFollowersInstagram
            
        default:
            print("oooooerrrrrororoorororor")
        }
    }
    
    
    
}



