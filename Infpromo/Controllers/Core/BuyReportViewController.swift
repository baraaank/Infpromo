//
//  BuyReportViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit
import SkeletonView

struct BuyingOptions {
    let reportNumber: String
    let reportPriceBeforeDisc: String
    let reportPrice: String
    let earningPercent: String
}



class BuyReportViewController: UIViewController {
    
    // find me an influencer tap
    
    private let influencerAmonutLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "İstenilen influencer sayısı:", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private lazy var influencerAmountTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        let text = "Lütfen istediğiniz influencer miktarını giriniz.."
        textField.attributedPlaceholder =  NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .numberPad
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.backgroundColor = .white
        return textField
    }()
    
    private let areaOfFocusLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Faaliyet alanınız:", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private lazy var areaOfFocusTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        let text = "Lütfen çalışmakta olduğunuz faaliyet alanını belirtiniz.."
        textField.attributedPlaceholder =  NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.backgroundColor = .white
        return textField
    }()
    
    private let sumOfPriceLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Ödenecek Toplam Fiyat:\n(Rapor sayısı + Hizmet Bedeli)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.numberOfLines = 0
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "0 TL", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .heavy), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        

        
        label.attributedText = NSAttributedString(string: "    Bu hizmeti satın aldıktan sonra ekibimiz sizinle iletişime geçip daha detaylı bilgiyi sizlerden temin edicektir. Hizmetinizi en geç 7 iş günü içerisinde Profil > Raporlarım kısmından görebilirsiniz. Dilerseniz +90 216 599 01 38 numaralı hattı arayarak ya da info@infpromo.com mail adresine mail atarak destek alabilirsiniz.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
       
        label.numberOfLines = 0
        return label
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Satın Al", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold)]), for: .normal)
        return button
    }()
    
    var customSegmented: CustomSegmentedControl!
    
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
        tableView.separatorStyle = .none
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
    
    private let toMailTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.lineFragmentPadding = 0.0
        textView.textContainerInset = .zero
        let text = "Daha fazla seçenek için bizimle iletişime geçebilirsiniz."
        let linkText = "bizimle"

        let linkRange = (text as NSString).range(of: linkText)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        
        let linkTextAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .link: "info@infpromo.com",
            .foregroundColor: UIColor().infpromo,
            .strokeColor: UIColor().infpromo,
        ]
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        attributedString.addAttributes(linkTextAttributes, range: linkRange)
        
        textView.attributedText = attributedString
        textView.backgroundColor = .systemGray6
        textView.textAlignment = .center
        return textView
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
        
        title = "Satın Al"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor().infpromo]
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor().infpromo]
        
        
        view.addSubview(scrollView)
        customSegmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 0, width: view.width - 40, height: 30), buttonTitle: ["Rapor Satın Al", "Bana Influencer Bul"])
        customSegmented.delegate = self
        
        scrollView.addSubview(customSegmented)
        addSubviews()
        
        scrollView.delegate = self

        FAQTableView.delegate = self
        FAQTableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
          
        view.backgroundColor = .systemGray6
        populateCells()
        
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        navigationController?.navigationBar.barTintColor = .systemGray6
        
        customSegmented.delegate?.changeToIndex(index: 0)
        
        influencerAmountTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        toMailTextView.delegate = self
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
        
        scrollView.addSubview(toMailTextView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(FAQTitleTextLabel)
        scrollView.addSubview(FAQTableView)
        
        scrollView.addSubview(influencerAmonutLabel)
        scrollView.addSubview(influencerAmountTextField)
        scrollView.addSubview(areaOfFocusLabel)
        scrollView.addSubview(areaOfFocusTextField)
        scrollView.addSubview(sumOfPriceLabel)
        scrollView.addSubview(totalPriceLabel)
        scrollView.addSubview(informationLabel)
        scrollView.addSubview(purchaseButton)
        
    }
    
    func arrangeSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        collectionView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width, height: view.width * 20 / 16)
        toMailTextView.frame = CGRect(x: 0, y: collectionView.bottom, width: view.width, height: 40)
        FAQTableView.frame = CGRect(x: 0, y: toMailTextView.bottom + 10, width: view.width, height: 100)
        scrollView.contentSize = CGSize(width: view.width, height: collectionView.height + toMailTextView.height + FAQTableView.height)
        
        influencerAmonutLabel.frame = CGRect(x: 10, y: customSegmented.bottom + 20, width: view.width - 20, height: 20)
        influencerAmountTextField.frame = CGRect(x: 10, y: influencerAmonutLabel.bottom + 10, width: view.width - 20, height: 40)
        areaOfFocusLabel.frame = CGRect(x: 10, y: influencerAmountTextField.bottom + 10, width: view.width - 20, height: 20)
        areaOfFocusTextField.frame = CGRect(x: 10, y: areaOfFocusLabel.bottom + 10, width: view.width - 20, height: 40)
        sumOfPriceLabel.frame = CGRect(x: 10, y: areaOfFocusTextField.bottom + 10, width: view.width - 20, height: 40)
        totalPriceLabel.frame = CGRect(x: 10, y: sumOfPriceLabel.bottom + 10, width: view.width - 20, height: 20)
        informationLabel.frame = CGRect(x: 10, y: totalPriceLabel.bottom + 10, width: view.width - 20, height: 120)
        purchaseButton.frame = CGRect(x: 80, y: informationLabel.bottom + 10, width: view.width - 160, height: 40)
        
        scrollView.contentSize.height = collectionView.height + toMailTextView.height + FAQTableView.height + 40
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrangeSubviews()
    }
    
//    override func viewWillLayoutSubviews() {
//        customSegmented.delegate?.changeToIndex(index: 0)
//    }
    
}

//UICollectionView
extension BuyReportViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if planResponseArray.isEmpty {
            return 4
        } else {
            return planResponseArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyingOptionsCollectionViewCell.reuseIdentifier, for: indexPath) as! BuyingOptionsCollectionViewCell
        
        
        if planResponseArray.count == 0 {
            cell.isSkeletonable = true
            cell.showAnimatedGradientSkeleton()
        }
        
         else {
            let planResponse = planResponseArray[indexPath.row]

            cell.configureCell(with: .init(name: planResponse.name,
                                           oldPrice: planResponse.oldPrice,
                                           newPrice: planResponse.newPrice,
                                           credit: planResponse.credit,
                                           profit: planResponse.profit))
            cell.contentView.isHidden = false
            cell.hideSkeleton()
        }
        
        
        return cell
    }
}


//UITableView
extension BuyReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
    
    

}

extension BuyReportViewController: CustomSegmentedControlDelegate {
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            
            influencerAmonutLabel.isHidden = true
            influencerAmountTextField.isHidden = true
            areaOfFocusLabel.isHidden = true
            areaOfFocusTextField.isHidden = true
            sumOfPriceLabel.isHidden = true
            totalPriceLabel.isHidden = true
            informationLabel.isHidden = true
            purchaseButton.isHidden = true
            collectionView.isHidden = false
            toMailTextView.isHidden = false
            FAQTableView.isHidden = false
        case 1:
            influencerAmonutLabel.isHidden = false
            influencerAmountTextField.isHidden = false
            areaOfFocusLabel.isHidden = false
            areaOfFocusTextField.isHidden = false
            sumOfPriceLabel.isHidden = false
            totalPriceLabel.isHidden = false
            informationLabel.isHidden = false
            purchaseButton.isHidden = false
            collectionView.isHidden = true
            toMailTextView.isHidden = true
            FAQTableView.isHidden = true
        default:
            print("segmented switch is not working")
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            if text.count < 6 {
                let intText = Int(text) ?? 0
                let fifteenIntText = intText * 13
                let sumIntText = Int(Double(fifteenIntText) * 1.85)
                DispatchQueue.main.async {
                    self.totalPriceLabel.text = "\(sumIntText) TL"
                }
            } else {
                DispatchQueue.main.async {
                    self.totalPriceLabel.text = "0 TL"
                }
            }
        }
    }
}


extension BuyReportViewController: UITextFieldDelegate {
   
}


extension BuyReportViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if purchaseButton.frame.maxY > keyboardSize.minY {
                informationLabel.alpha = 0
                purchaseButton.frame = CGRect(x: 80, y: totalPriceLabel.bottom + 10, width: view.width - 160, height: 40)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        arrangeSubviews()
        informationLabel.alpha = 1.0
    }
}


extension BuyReportViewController: UITextViewDelegate {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

    // Handle the user tapping the link however you like here
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        //(string: "mailto:\(email)")
        
        let email = "info@infpromo.com"
        if let url = Foundation.URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
        
        
        return false
    }
}
