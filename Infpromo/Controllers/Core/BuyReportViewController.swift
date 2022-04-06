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



class BuyReportViewController: UIViewController {
    
    
    
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
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    private let FAQTableView: UITableView  = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.isScrollEnabled = false
        
        tableView.backgroundColor = .systemGray6
        
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
        collectionView.backgroundColor = .systemGray6
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
        label.attributedText = NSAttributedString(string: "Raporda neler var ?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .regular)])
        return label
    }()
    
    var planResponseArray: [PlanCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Purchase"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor().infpromo]
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor().infpromo]
        
        addSubviews()
        
        
        scrollView.delegate = self

        FAQTableView.delegate = self
        FAQTableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
          
        view.backgroundColor = .systemGray6
        populateCells()
        
    }
    
    func populateCells() {
        APICaller.shared.getPlanList { response in
            switch response {
            case .success(let model):
                var responseArray: [PlanCellViewModel] = []
                responseArray.append(contentsOf: model.data.map({
                    .init(name: $0.name,
                          oldPrice: $0.oldPrice,
                          newPrice: $0.newPrice,
                          credit: $0.credit,
                          profit: $0.profit)
                }))
                self.planResponseArray = responseArray
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
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
        FAQTableView.frame = CGRect(x: 0, y: mailButton.bottom + 20, width: view.width, height: FAQTableView.contentSize.height + 100)
        scrollView.contentSize = CGSize(width: view.width, height: collectionView.height + mailButton.height + FAQTableView.height)
        
    }
    
    
    
   
    
}

//UICollectionView
extension BuyReportViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planResponseArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyingOptionsCollectionViewCell.reuseIdentifier, for: indexPath) as! BuyingOptionsCollectionViewCell
        cell.backgroundColor = .white

        let planResponse = planResponseArray[indexPath.row]

        cell.configureCell(with: .init(name: planResponse.name,
                                       oldPrice: planResponse.oldPrice,
                                       newPrice: planResponse.newPrice,
                                       credit: planResponse.credit,
                                       profit: planResponse.profit))
        return cell
    }
}


//UITableView
extension BuyReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Raporda Neler Var?"
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = WhatsInReportsViewController()
//        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
//
//        tableView.reloadSections([indexPath.section], with: .none)
//
//
//        UIView.animate(withDuration: 0.6) {
//            if self.sections[indexPath.section].isOpened {
//                tableView.beginUpdates()
//
//                self.FAQTableView.frame = CGRect(x: 0, y: self.FAQTitleTextLabel.bottom + 20, width: self.view.width, height: self.FAQTableView.contentSize.height)
//                self.scrollView.contentSize = CGSize(width: self.view.width, height: self.collectionView.height + self.mailButton.height + self.FAQTableView.height + self.FAQTitleTextLabel.height + 60)
//                self.FAQTableView.reloadData()
//                tableView.endUpdates()
//            } else {
//                tableView.beginUpdates()
//                self.FAQTableView.frame = CGRect(x: 0, y: self.FAQTitleTextLabel.bottom + 20, width: self.view.width, height: self.FAQTableView.contentSize.height)
//                self.scrollView.contentSize = CGSize(width: self.view.width, height: self.collectionView.height + self.mailButton.height + self.FAQTableView.height + self.FAQTitleTextLabel.height + 60)
//                self.FAQTableView.reloadData()
//                tableView.endUpdates()
//
//            }
//        }
//
//
//    }
}
