//
//  SİgnUpViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 7.03.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    var isCheckBoxSelected: Bool = false
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logIn")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Name"
        textField.leftView = customLeftView(systemName: "person")
        textField.delegate = self
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Surname"
        textField.leftView = customLeftView(systemName: "person")
        textField.delegate = self
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Email"
        textField.leftView = customLeftView(systemName: "envelope")
        textField.delegate = self
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Password"
        textField.leftView = customLeftView(systemName: "lock")
        textField.delegate = self
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passwordAgainTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Password Again"
        textField.leftView = customLeftView(systemName: "lock")
        textField.delegate = self
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.imageView?.tintColor = UIColor().infpromo
        button.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let userAgreementButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gizlilik ve kullanıcı sözleşmesini okudum ve onaylıyorum.", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.addTarget(self, action: #selector(userAgreementButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Kayıt Ol", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let youHaveAnAccountLabel: UILabel = {
       let label = UILabel()
        label.text = "Hesabın Var Mı?"
        return label
    }()
    
    private let backToLogInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Giriş Yap!", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(backToLogInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubViews()
        arrangeLayouts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAgainTextField)
        view.addSubview(checkBoxButton)
        view.addSubview(userAgreementButton)
        view.addSubview(signUpButton)
        view.addSubview(youHaveAnAccountLabel)
        view.addSubview(backToLogInButton)
    }
    
    func arrangeLayouts() {
        
        logoImageView.frame = CGRect(x: 10, y: view.height / 10, width: view.width - 20, height: 60)
        nameTextField.frame = CGRect(x: 20, y: logoImageView.bottom + view.height / 10, width: view.width - 40, height: 50)
        surnameTextField.frame = CGRect(x: 20, y: nameTextField.bottom + 10, width: view.width - 40, height: 50)
        emailTextField.frame = CGRect(x: 20, y: surnameTextField.bottom + 10, width: view.width - 40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10, width: view.width - 40, height: 50)
        passwordAgainTextField.frame = CGRect(x: 20, y: passwordTextField.bottom + 10, width: view.width - 40, height: 50)
        checkBoxButton.frame = CGRect(x: 20, y: passwordAgainTextField.bottom + 30, width: 20, height: 20)
        userAgreementButton.frame = CGRect(x: checkBoxButton.right + 10, y: passwordAgainTextField.bottom + 20, width: view.width - 100, height: 30)
        signUpButton.frame = CGRect(x: 20, y: userAgreementButton.bottom + 20, width: view.width - 40, height: 50)
        youHaveAnAccountLabel.frame = CGRect(x: 20, y: signUpButton.bottom + 20, width: view.width / 2 - 40, height: 20)
        backToLogInButton.frame = CGRect(x: view.width / 2, y: signUpButton.bottom + 20, width: view.width / 2 - 20, height: 20)
        
    }
    

  
    
    func customLeftView(systemName: String) -> UIView {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        customView.backgroundColor = .clear
        let customImageView = UIImageView()
        customImageView.frame = CGRect(x: 5, y: 20, width: 30, height: 20)
        let customImage = UIImage(systemName: systemName)
        customImageView.tintColor = .black
        customImageView.contentMode = .scaleAspectFit
        customImageView.image = customImage
        customImageView.backgroundColor = .clear
        customView.addSubview(customImageView)
        
        return customView
    }
    
    @objc func backToLogInButtonTapped() {
        let vc = LogInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func checkBoxSelect() {
        if isCheckBoxSelected == false {
            checkBoxButton.setImage(UIImage(systemName: "square.inset.filled"), for: .normal)
        } else {
            checkBoxButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
        isCheckBoxSelected = !isCheckBoxSelected
    }
    
    @objc func checkBoxButtonTapped() {
        checkBoxSelect()
    }
    
    @objc func userAgreementButtonTapped() {
        checkBoxSelect()
    }
    
    @objc func signUpButtonTapped() {
        if checkBoxButton.imageView?.image == UIImage(systemName: "square") {
            let alert = UIAlertController(title: "Sözleşme !!!", message: "Gizlilik ve kullanıcı sözleşmesini onaylamadan kayıt işlemi gerçekleştiremezsiniz.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            let vc = LogInViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }

}


extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            UIView.animate(withDuration: 0.5, delay: 0, options: []) {
                textField.leftView?.subviews.first?.tintColor = UIColor.black
                textField.layer.borderColor = UIColor().infpromoBorder.cgColor
            } completion: { _ in
                
            }
        } else {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: []) {
                textField.leftView?.subviews.first?.tintColor = .red
                textField.layer.borderColor = UIColor.red.cgColor
            } completion: { _ in
                
            }
            
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, options: []) {
            textField.leftView?.subviews.first?.tintColor = UIColor().infpromo
            textField.layer.borderColor = UIColor().infpromo.cgColor
        } completion: { _ in
            
        }
        
    }
    
    
}

extension SignUpViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                
                if signUpButton.frame.maxY > keyboardSize.minY {
                    logoImageView.isHidden = true
                    nameTextField.frame = CGRect(x: 20, y: 40, width: view.width - 40, height: 50)
                    surnameTextField.frame = CGRect(x: 20, y: nameTextField.bottom + 10, width: view.width - 40, height: 50)
                    emailTextField.frame = CGRect(x: 20, y: surnameTextField.bottom + 10, width: view.width - 40, height: 50)
                    passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10, width: view.width - 40, height: 50)
                    passwordAgainTextField.frame = CGRect(x: 20, y: passwordTextField.bottom + 10, width: view.width - 40, height: 50)
                    signUpButton.frame = CGRect(x: 20, y: passwordAgainTextField.bottom + 10, width: view.width - 40, height: 50)
                    checkBoxButton.isHidden = true
                    userAgreementButton.isHidden = true
                    youHaveAnAccountLabel.isHidden = true
                    backToLogInButton.isHidden = true
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        
        arrangeLayouts()
        logoImageView.isHidden = false
        checkBoxButton.isHidden = false
        userAgreementButton.isHidden = false
        youHaveAnAccountLabel.isHidden = false
        backToLogInButton.isHidden = false
        
//        if view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//            }
        
    }
}

