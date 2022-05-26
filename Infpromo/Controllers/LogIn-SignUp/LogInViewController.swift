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
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Email"
        textField.leftView = customLeftView(systemName: "envelope")
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        textField.returnKeyType = .next
//        textField.backgroundColor = .systemGray6
        textField.tag = 1
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Password"
        textField.leftView = customLeftView(systemName: "lock")
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        textField.tag = 2
        textField.returnKeyType = .continue
        textField.enablePasswordToggle()
        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(string: "Parolanı mı unuttun?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Giriş", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let dontYouHaveAnAccountLabel: UILabel = {
       let label = UILabel()
        
        label.attributedText = NSAttributedString(string: "Hesabın yok mu?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        return label
    }()
    
    private let createAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "Ücretsiz hesap oluştur!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(createAnAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //loading gif and blur
    var gif: LoadingGif!

    let blurEffectView: UIVisualEffectView = {
       let blurEffectView = UIVisualEffectView()
        let style = UIBlurEffect.Style.light
        let effect = UIBlurEffect(style: style)
        blurEffectView.effect = effect
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        arrangeLayouts()
        
        view.backgroundColor = .white
        
        
        
        gif = LoadingGif.init(imageName: "infpromoLoadingGif", frame: CGRect(x: (view.frame.size.width / 2) - 40, y: (view.frame.size.height / 2) - 40, width: 80, height: 80), duration: 0.8, repeatCount: 0)
        blurEffectView.frame = view.bounds
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        forgotPasswordButton.addTarget(self, action: #selector(forgetPasswordButtonTapped), for: .touchUpInside)
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
        let customImage = UIImage(systemName: systemName, withConfiguration: UIImage.SymbolConfiguration.init(weight: .light))
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
        present(vc, animated: false)
    }
    
    @objc func forgetPasswordButtonTapped() {
        let vc = ForgetPasswordViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @objc func logInButtonTapped() {
        
        view.endEditing(true)
        
        guard let email = usernameTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            DispatchQueue.main.async {
                self.showAlert(title: "Hata!", message: "Lütfen tüm boşlukları doldurunuz.")
            }
            return
        }
        
        guard isValidEmail(email) == true else {
            DispatchQueue.main.async {
                self.showAlert(title: "Hata", message: "Lütfen geçerli bir email adresi giriniz.")
            }
            return
        }
        
        guard password.count > 5 else {
            DispatchQueue.main.async {
                self.showAlert(title: "Hata!", message: "Parola en az 6 karakter olmalıdır.")
            }
            return
        }
        
        DispatchQueue.main.async {
            self.startBlur()
        }
        
        
        AuthManager.shared.logInUser(email: email, password: password) { response in
            switch response {
            case .success(let model):
                print(model.decode.exp)
                DispatchQueue.main.async {
                    let vc = TabBarController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false)
                }
               
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Hata!", message: "\(error.message), lütfen tekrar deneyiniz.")
                }
                
                print("log in unsuccessful \(error)")
                
            }
            DispatchQueue.main.async {
                self.stopBlur()
            }
        }
    }
    
    func startBlur() {
        view.addSubview(blurEffectView)
        view.addSubview(gif)
        gif.startAnimation()
    }
    
    func stopBlur() {
        gif.stopAnimation()
        gif.removeFromSuperview()
        blurEffectView.removeFromSuperview()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.logInButtonTapped()
        }
        
        return true
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
                    forgotPasswordButton.alpha = 0.0
                    dontYouHaveAnAccountLabel.alpha = 0.0
                    createAnAccountButton.alpha = 0.0
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        arrangeLayouts()
        forgotPasswordButton.isHidden = false
        dontYouHaveAnAccountLabel.isHidden = false
        createAnAccountButton.isHidden = false
        
        forgotPasswordButton.alpha = 1.0
        dontYouHaveAnAccountLabel.alpha = 1.0
        createAnAccountButton.alpha = 1.0
//        if view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//            }
        
    }
}

//alerts
extension LogInViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
    
    
}

extension LogInViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
