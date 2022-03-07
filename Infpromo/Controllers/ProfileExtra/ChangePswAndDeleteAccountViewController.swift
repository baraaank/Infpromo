//
//  ChangePswAndDeleteAccountViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 7.03.2022.
//

import UIKit

class ChangePswAndDeleteAccountViewController: UIViewController {

    let explainlabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = NSAttributedString(string: "Mailinize gelen linke tıklayarak şifrenizi başarılı bir şekilde değiştirebilirsiniz.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 32, weight: .semibold)])
        return label
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setTitle("Mail Gönder", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .white
        
    }
    
    func addSubviews() {
        view.addSubview(explainlabel)
        view.addSubview(sendButton)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        explainlabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 140)
        sendButton.frame = CGRect(x: 80, y: explainlabel.bottom + 20, width: view.width - 160, height: 50)
    }

}
