//
//  ChangePswAndDeleteAccountViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 7.03.2022.
//

import UIKit

class ChangePswAndDeleteAccountViewController: UIViewController {

    private let outsideView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true

        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = false
        
        view.layer.shadowRadius = 4.0

        // The color of the drop shadow
        view.layer.shadowColor = UIColor.lightGray.cgColor

        // How transparent the drop shadow is
        view.layer.shadowOpacity = 0.4

        // How far the shadow is offset from the UICollectionViewCell’s frame
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        view.backgroundColor = .white
        view.layer.borderColor = UIColor().infpromoBorder.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
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
        view.addSubview(outsideView)
        outsideView.addSubview(explainlabel)
        outsideView.addSubview(sendButton)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        outsideView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 20, width: view.width - 20, height: view.width)
        explainlabel.frame = CGRect(x: 20, y: 20, width: view.width - 40, height: outsideView.height / 1.5)
        sendButton.frame = CGRect(x: 80, y: explainlabel.bottom + 20, width: view.width - 160, height: 50)
    }

}
