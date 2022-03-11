//
//  BuyReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

struct BuyingOptions {
    let reportNumber: String
    let reportPriceBeforeDisc: String
    let reportPrice: String
    let earningPercent: String
}

class Section {
    let title: String
    let description: String
    var isOpened: Bool = false
    
    init(title: String, description: String, isOpened: Bool = false) {
        self.title = title
        self.description = description
        self.isOpened = isOpened
    }
}

class BuyReportViewController: UIViewController {
    
    private var sections = [Section]()
    
    var buyingOptionsArray = [
        BuyingOptions(reportNumber: "2 Rapor", reportPriceBeforeDisc: "", reportPrice: "16 TL", earningPercent: ""),
        BuyingOptions(reportNumber: "10 Rapor", reportPriceBeforeDisc: "80 TL", reportPrice: "70 TL", earningPercent: "(%12,5 Kazanç)"),
        BuyingOptions(reportNumber: "25 Rapor", reportPriceBeforeDisc: "200 TL", reportPrice: "160 TL", earningPercent: "(%20 Kazanç)"),
        BuyingOptions(reportNumber: "50 Rapor", reportPriceBeforeDisc: "400 TL", reportPrice: "300 TL", earningPercent: "(%25 Kazanç)"),
    ]
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let FAQTableView: UITableView  = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { (section, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(10.0/16.0))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            group.interItemSpacing = .fixed(0)
            section.orthogonalScrollingBehavior = .none
            return section
        }) )
        
        collectionView.register(BuyingOptionsCollectionViewCell.self, forCellWithReuseIdentifier: BuyingOptionsCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let mailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Daha fazla seçenek için bizimle iletişime geçin", for: .normal)
        
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    private let FAQTitleTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Raporda neler var ?"
        label.attributedText = NSAttributedString(string: "Raporda neler var ?", attributes: [NSAttributedString.Key.foregroundColor : UIColor().infpromo, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .bold)])
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Purchase"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor().infpromo]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor().infpromo]
        
        addSubviews()
        addSections()
        
        scrollView.delegate = self

        FAQTableView.delegate = self
        FAQTableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
          
        
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mailButton)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(FAQTitleTextLabel)
        scrollView.addSubview(FAQTableView)
        
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        collectionView.frame = CGRect(x: 0, y: scrollView.top, width: view.width, height: view.width * 20 / 16)
        mailButton.frame = CGRect(x: 0, y: collectionView.bottom, width: view.width, height: 40)
        FAQTitleTextLabel.frame = CGRect(x: 20, y: mailButton.bottom + 20, width: view.width - 60, height: 60)
        FAQTableView.frame = CGRect(x: 0, y: FAQTitleTextLabel.bottom + 20, width: view.width, height: FAQTableView.contentSize.height + 20)
        scrollView.contentSize = CGSize(width: view.width, height: collectionView.height + mailButton.height + FAQTableView.height + FAQTitleTextLabel.height + 60)
        
    }
    
    
    
    func addSections() {
        sections = [
            Section(title: "Influencerın profil özellikleri", description: "influencerın takipçi, ortalama beğeni (grafikler halinde),ortalama yorum sayıları, toplam etkileşimi ve etkileşim oranı."),
            Section(title: "Influencerın post özellikleri", description: "influencerın paylaştığı en çok etkileşim alan postları, son 8 post etkileşimi ve beğeni sayılarındaki artış azalış grafikler halinde. En çok kullandığı #hashtagler ve @mentionlar."),
            Section(title: "Influencerın takipçilerine göre kitle verileri", description: "influencerın fake takipçi oranları, takipçilerin (grafikler halinde) yaş aralıkları, cinsiyet oranları, marka yakınlıkları ve ilgi alanları."),
            Section(title: "Influencerın post beğenilerine göre kitle verileri", description: "influencerın postlarını beğenen kullanıcıların reel oranı, takipçi olmayan kullanıcılardan gelen beğeni oranı, beğenen kullanıcıların (grafikler halinde) lokasyon, cinsiyet ve yaş aralıkları.")
        ]
    }
    
    
}

//UICollectionView
extension BuyReportViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyingOptionsCollectionViewCell.reuseIdentifier, for: indexPath) as! BuyingOptionsCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor().infpromoBorder.cgColor
        cell.layer.borderWidth = 1
        cell.configureCellContent(with: buyingOptionsArray[indexPath.row])
        return cell
    }
}


//UITableView
extension BuyReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return 2
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.accessoryType = .detailButton
        if indexPath.row == 0 {
            cell.textLabel?.numberOfLines = 0
            let cellString = sections[indexPath.section].title
            cell.textLabel?.attributedText = NSAttributedString(string: cellString, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        } else {
            cell.accessoryType = .none
            cell.textLabel?.numberOfLines = 0
            let cellString = sections[indexPath.section].description
            cell.textLabel?.attributedText = NSAttributedString(string: cellString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
            
        }

        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
        
        tableView.reloadSections([indexPath.section], with: .none)
        
       
        UIView.animate(withDuration: 0.6) {
            if self.sections[indexPath.section].isOpened {
                tableView.beginUpdates()
                
                self.FAQTableView.frame = CGRect(x: 0, y: self.FAQTitleTextLabel.bottom + 20, width: self.view.width, height: self.FAQTableView.contentSize.height)
                self.scrollView.contentSize = CGSize(width: self.view.width, height: self.collectionView.height + self.mailButton.height + self.FAQTableView.height + self.FAQTitleTextLabel.height + 60)
                self.FAQTableView.reloadData()
                tableView.endUpdates()
            } else {
                tableView.beginUpdates()
                self.FAQTableView.frame = CGRect(x: 0, y: self.FAQTitleTextLabel.bottom + 20, width: self.view.width, height: self.FAQTableView.contentSize.height)
                self.scrollView.contentSize = CGSize(width: self.view.width, height: self.collectionView.height + self.mailButton.height + self.FAQTableView.height + self.FAQTitleTextLabel.height + 60)
                self.FAQTableView.reloadData()
                tableView.endUpdates()
                
            }
        }
        
    
    }
}
