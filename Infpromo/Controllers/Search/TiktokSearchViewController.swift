////
////  TiktokSearchViewController.swift
////  Infpromo
////
////  Created by BaranK Kutlu on 28.02.2022.
////
//
//import UIKit
//
//import UIKit
//
//class TiktokSearchViewController: UIViewController {
//
//
//
//    var headingsArray: [SearchHeadings] = [
//        SearchHeadings(heading: "Influencer Özellikleri", options: ["nil"], isCollapse: false),
//        SearchHeadings(heading: "Min Abone Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000"], isCollapse: true),
//        SearchHeadings(heading: "Max Abone Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000", "3.000.000", "4.000.000", "5.000.000", "5.000.000+"], isCollapse: true),
//        SearchHeadings(heading: "Min Görüntülenme Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000"], isCollapse: true),
//        SearchHeadings(heading: "Max Görüntülenme Sayısı", options: ["25.000", "50.000", "75.000", "100.000", "150.000", "200.000", "300.000", "500.000", "1.000.000", "1.000.000+"], isCollapse: true),
//        SearchHeadings(heading: "Lokasyon", options: ["Turkey", "France", "United States", "Brazil", "Italy", "Germany", "India", "Russia", "Canada", "Mexico City", "Australia", "United Kingdom", "Iran", "Greece", "Spain", "Japan", "Poland", "Argentina", "New York City", "Mexico"], isCollapse: true),
//        SearchHeadings(heading: "Cinsiyet", options: ["Kadın", "Erkek"], isCollapse: true),
//        SearchHeadings(heading: "Dil", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
//        SearchHeadings(heading: "Etkileşim Oranı", options: ["\u{2265}1 %", "\u{2265}2 %", "\u{2265}3 %", "\u{2265}4 %", "\u{2265}5 %", "\u{2265}6 %", "\u{2265}7 %", "\u{2265}8 %", "\u{2265}9 %", "\u{2265}10 %", "\u{2265}11 %", "\u{2265}12 %", "\u{2265}13 %", "\u{2265}14 %", "\u{2265}15 %", "\u{2265}16 %", "\u{2265}17 %", "\u{2265}18 %", "\u{2265}19 %", "\u{2265}20 %",], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Özellikleri", options: ["nil"], isCollapse: false),
//        SearchHeadings(heading: "Takipçi Cinsiyet Yoğunluğu", options: ["Kadın", "Erkek"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Yaş Aralığı", options: ["18 - 24", "25 - 34", "35 - 44", "45 - 65", "65+"], isCollapse: true),
//        SearchHeadings(heading: "Takipçi Dili", options: ["Türkçe", "İngilizce", "İspanyolca", "Portekizce", "Rusça", "Fransızca", "Arapça", "İtalyanca", "Almanca", "Farsça", "Indonesian", "Japonca", "Polakça", "Çince", "Thai", "Hindi", "Korece", "Malay", "Flemenkçe"], isCollapse: true),
//        SearchHeadings(heading: "", options: [""], isCollapse: true),
//        SearchHeadings(heading: "", options: [""], isCollapse: true)
//    ]
//
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(TiktokSearchTableViewCell.self, forCellReuseIdentifier: TiktokSearchTableViewCell.reuseIdentifier)
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
//extension TiktokSearchViewController: UITableViewDelegate, UITableViewDataSource {
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: TiktokSearchTableViewCell.reuseIdentifier, for: indexPath) as! TiktokSearchTableViewCell
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
//        } else if section == 13 || section == 14 || section == 15  {
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
//
//}


import UIKit

class TiktokSearchViewController: UIViewController {
    
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
        label.text = "Tiktok"
        label.textAlignment = .center
        return label
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tiktok"
        view.backgroundColor = .white
        addSubviews()
        navigationItem.searchController = searchController
        let segmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 20, width: view.width - 40, height: 50), buttonTitle: ["Kullanıcı adı", "Influencer özellikleri", "Takipçi özellikleri"])
        segmented.backgroundColor = .white
        
        view.addSubview(segmented)
    }
    
    @objc func segmentedTapped() {
        print("segmented tapped")
    }
    
    func addSubviews() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}
