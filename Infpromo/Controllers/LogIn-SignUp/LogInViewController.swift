//
//  LogInViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 7.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logIn")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
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
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Parolanı mı Unuttun?", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Giriş", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let dontYouHaveAnAccountLabel: UILabel = {
       let label = UILabel()
        label.text = "Hesabın Yok Mu?"
        return label
    }()
    
    private let createAnAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ücretsiz Dene!", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(createAnAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        arrangeLayouts()
        
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(logInButton)
        view.addSubview(dontYouHaveAnAccountLabel)
        view.addSubview(createAnAccountButton)
    }

  
    func arrangeLayouts() {
        logoImageView.frame = CGRect(x: 10, y: view.height / 10, width: view.width - 20, height: 60)
        usernameTextField.frame = CGRect(x: 20, y: logoImageView.bottom + view.height / 10, width: view.width - 40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: usernameTextField.bottom + 10, width: view.width - 40, height: 50)
        forgotPasswordButton.frame = CGRect(x: view.width / 2, y: passwordTextField.bottom + 20, width: view.width / 2 - 20, height: 20)
        logInButton.frame = CGRect(x: 20, y: forgotPasswordButton.bottom + 20, width: view.width - 40, height: 50)
        dontYouHaveAnAccountLabel.frame = CGRect(x: 20, y: logInButton.bottom + 20, width: view.width / 2 - 40, height: 20)
        createAnAccountButton.frame = CGRect(x: view.width / 2, y: logInButton.bottom + 20, width: view.width / 2 - 20, height: 20)
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
    
    @objc func createAnAccountButtonTapped() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func logInButtonTapped() {
        
        APICaller.shared.logInUser(email: usernameTextField.text!, password: passwordTextField.text!) { response in
            switch response {
            case .success(let model):
                print(model.token)
            case .failure(let error):
                print(error)
            }
        }
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

extension LogInViewController: UITextFieldDelegate {
    
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


//keyboard layout changes
extension LogInViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                
                if logInButton.frame.maxY > keyboardSize.minY {
//                    self.view.frame.origin.y -= keyboardSize.height
                    logoImageView.frame = CGRect(x: 10, y: 40, width: view.width - 20, height: 60)
                    usernameTextField.frame = CGRect(x: 20, y: logoImageView.bottom + 40, width: view.width - 40, height: 50)
                    passwordTextField.frame = CGRect(x: 20, y: usernameTextField.bottom + 10, width: view.width - 40, height: 50)
                    logInButton.frame = CGRect(x: 20, y: passwordTextField.bottom + 10, width: view.width - 40, height: 50)
                    forgotPasswordButton.isHidden = true
                    dontYouHaveAnAccountLabel.isHidden = true
                    createAnAccountButton.isHidden = true
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        
        arrangeLayouts()
        forgotPasswordButton.isHidden = false
        dontYouHaveAnAccountLabel.isHidden = false
        createAnAccountButton.isHidden = false
//        if view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//            }
        
    }
}
