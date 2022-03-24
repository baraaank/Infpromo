//
//  WhatsInReportsViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.03.2022.
//

import UIKit


class WhatsInReportsViewController: UIViewController {

    private var sections = ["Influencerın profil özellikleri", "influencerın takipçi, ortalama beğeni (grafikler halinde),ortalama yorum sayıları, toplam etkileşimi ve etkileşim oranı.",
                            "Influencerın post özellikleri", "influencerın paylaştığı en çok etkileşim alan postları, son 8 post etkileşimi ve beğeni sayılarındaki artış azalış grafikler halinde. En çok kullandığı #hashtagler ve @mentionlar.",
                            "Influencerın takipçilerine göre kitle verileri", "influencerın fake takipçi oranları, takipçilerin (grafikler halinde) yaş aralıkları, cinsiyet oranları, marka yakınlıkları ve ilgi alanları.",
                            "Influencerın post beğenilerine göre kitle verileri", "influencerın postlarını beğenen kullanıcıların reel oranı, takipçi olmayan kullanıcılardan gelen beğeni oranı, beğenen kullanıcıların (grafikler halinde) lokasyon, cinsiyet ve yaş aralıkları."]
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let FAQTableView: UITableView  = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(FAQTableView)
        
        
        FAQTableView.delegate = self
        FAQTableView.dataSource = self
        
        FAQTableView.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        FAQTableView.frame = view.bounds    }
    
    
 
 

}

extension WhatsInReportsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        sections.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.accessoryType = .detailButton
       
        if indexPath.row % 2 == 0 {
            cell.textLabel?.text = sections[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            cell.textLabel?.numberOfLines = 0
            
        } else {
            cell.textLabel?.text = sections[indexPath.row]
            cell.textLabel?.numberOfLines = 0
        }
        
            


        cell.backgroundColor = .systemGray6
        return cell
        
    }
    
    

}
