//
//  EditProfileViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 14.05.2022.
//

import UIKit

class EditProfileViewController: UIViewController {

    //0.14
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "İsim"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.delegate = self
        textField.backgroundColor = .white
        textField.tag = 1
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Soyisim"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 2
        return textField
    }()
    
    private lazy var professionTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Meslek"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 3
        return textField
    }()
    
    private lazy var socialMediaTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Sosyal Medya"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 4
        return textField
    }()
    
    private lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Email"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 5
        return textField
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Doğum Günü"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 6
        return textField
    }()
    
    private lazy var languageTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Dil"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 7
        return textField
    }()
    
    private lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Lokasyon"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 8
        return textField
    }()
    
    private lazy var websiteTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Web Sitesi"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 9
        return textField
    }()
    
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "Telefon no"
        textField.leftView = customLeftView(systemName: "person")
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.delegate = self
        textField.tag = 10
        return textField
    }()
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        addSubviews()
        view.backgroundColor = .systemGray6
        title = "Profili Güncelle"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Vazgeç", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Kaydet", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func cancelButtonTapped() {
        let alertController = UIAlertController(title: "Vazgeç", message:
          "Yaptığınız değişiklikler silinecektir", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Devam", style: .default, handler: {action in
        }))
        alertController.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        //
    }
    
    var currentTextFieldTag = 0
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(surnameTextField)
        scrollView.addSubview(professionTextField)
        scrollView.addSubview(socialMediaTextField)
        scrollView.addSubview(mailTextField)
        scrollView.addSubview(birthdayTextField)
        scrollView.addSubview(languageTextField)
        scrollView.addSubview(locationTextField)
        scrollView.addSubview(websiteTextField)
        scrollView.addSubview(phoneNumberTextField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        nameTextField.frame = CGRect(x: 8, y: scrollView.top, width: view.width - 16, height: view.width * 0.13)
        surnameTextField.frame = CGRect(x: 8, y: nameTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        professionTextField.frame = CGRect(x: 8, y: surnameTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        socialMediaTextField.frame = CGRect(x: 8, y: professionTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        mailTextField.frame = CGRect(x: 8, y: socialMediaTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        birthdayTextField.frame = CGRect(x: 8, y: mailTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        languageTextField.frame = CGRect(x: 8, y: birthdayTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        locationTextField.frame = CGRect(x: 8, y: languageTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        websiteTextField.frame = CGRect(x: 8, y: locationTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        phoneNumberTextField.frame = CGRect(x: 8, y: websiteTextField.bottom + 8, width: view.width - 16, height: view.width * 0.13)
        scrollView.contentSize.height = nameTextField.height + surnameTextField.height + professionTextField.height + socialMediaTextField.height + mailTextField.height + birthdayTextField.height + languageTextField.height + locationTextField.height + websiteTextField.height + phoneNumberTextField.height + ( 8 * 10 )
    }
    

    func customLeftView(systemName: String) -> UIView {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        customView.backgroundColor = .clear
        let customImageView = UIImageView()
        customImageView.frame = CGRect(x: 5, y: 20, width: 30, height: 20)
        let customImage = UIImage(systemName: systemName, withConfiguration: UIImage.SymbolConfiguration.init(weight: .light))
        customImageView.tintColor = UIColor().infpromo
        customImageView.contentMode = .scaleAspectFit
        customImageView.image = customImage
        customImageView.backgroundColor = .clear
        customView.addSubview(customImageView)
        return customView
    }
   

}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextFieldTag = textField.tag
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
}



extension EditProfileViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                
                if currentTextFieldTag > 6 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
                
                
                
              
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y < 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
        
    }
}

extension EditProfileViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
    
    
}
