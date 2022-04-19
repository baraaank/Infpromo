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
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Name"
        textField.leftView = customLeftView(systemName: "person")
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        
        
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Surname"
        textField.leftView = customLeftView(systemName: "person")
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        
        //        textField.leftViewRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 30))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
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
        textField.leftViewMode = .always
        textField.enablePasswordToggle()
        return textField
    }()
    
    private lazy var passwordAgainTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor().infpromoBorder.cgColor
        textField.placeholder = "Password Again"
        textField.leftView = customLeftView(systemName: "lock")
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.enablePasswordToggle()
        return textField
    }()
    
    private let checkBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.imageView?.tintColor = UIColor().infpromo
        button.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let userAgreementButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setAttributedTitle(NSAttributedString(string: "Gizlilik ve kullanıcı sözleşmesini okudum ve onaylıyorum.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]), for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.addTarget(self, action: #selector(userAgreementButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Kayıt Ol", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let youHaveAnAccountLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Hesabın var mı?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        return label
    }()
    
    private let backToLogInButton: UIButton = {
        let button = UIButton()
   
        button.setAttributedTitle(NSAttributedString(string: "Giriş yap!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(backToLogInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    //loading gif and blur
    var gif: LoadingGif!

    let blurEffectView: UIVisualEffectView = {
       let blurEffectView = UIVisualEffectView()
        let style = UIBlurEffect.Style.dark
        let effect = UIBlurEffect(style: style)
        blurEffectView.effect = effect
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubViews()
        arrangeLayouts()
        
        gif = LoadingGif.init(imageName: "infpromoLoadingGif", frame: CGRect(x: (view.frame.size.width / 2) - 40, y: (view.frame.size.height / 2) - 40, width: 80, height: 80), duration: 0.8, repeatCount: 0)
        blurEffectView.frame = view.bounds
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       
       
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
        let customImage = UIImage(systemName: systemName, withConfiguration: UIImage.SymbolConfiguration.init(weight: .light))
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
        present(vc, animated: false)
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
        view.endEditing(true)
        
        guard let name = nameTextField.text, let surname = surnameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let passwordAgain = passwordAgainTextField.text, !email.isEmpty, !name.isEmpty, !surname.isEmpty, !password.isEmpty, !passwordAgain.isEmpty else {
            print("lütfen alanları doldurunuz")
            DispatchQueue.main.async {
                self.showAlert(title: "Hata!", message: "Lütfen tüm boşlukları doldurunuz.")
            }
            return
        }
        
        guard passwordTextField.text == passwordAgainTextField.text else {
            DispatchQueue.main.async {
                self.showAlert(title: "Hata!", message: "Parolalar farklı lütfen tekrar deneyiniz.")
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
        
        AuthManager.shared.createUser(name: name, surName: surname, password: password, email: email) { result in
            switch result {
            case .success(let model):
                if model.code == 200 {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Tebrikler", message:
                          "Kullanıcı oluşturuldu, lütfen giriş yapınız.", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Giriş yap", style: .default, handler: {action in
                            let vc = LogInViewController()
                                                    vc.modalPresentationStyle = .fullScreen
                                                    self.present(vc, animated: true)
                        }))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                }
                
                else if model.code == 400 {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Hata!", message: "Email adresi zaten var!")
                    }
                }
                
                else {
                    print("\(model) modeellllllll")
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self.showAlert(title: "Hata!", message: "Email adresi zaten var!")
                }
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
                    logoImageView.alpha = 0.0
                    nameTextField.frame = CGRect(x: 20, y: 40, width: view.width - 40, height: 50)
                    surnameTextField.frame = CGRect(x: 20, y: nameTextField.bottom + 10, width: view.width - 40, height: 50)
                    emailTextField.frame = CGRect(x: 20, y: surnameTextField.bottom + 10, width: view.width - 40, height: 50)
                    passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10, width: view.width - 40, height: 50)
                    passwordAgainTextField.frame = CGRect(x: 20, y: passwordTextField.bottom + 10, width: view.width - 40, height: 50)
                    signUpButton.frame = CGRect(x: 20, y: passwordAgainTextField.bottom + 10, width: view.width - 40, height: 50)
                    checkBoxButton.isHidden = true
                    checkBoxButton.alpha = 0.0
                    userAgreementButton.isHidden = true
                    userAgreementButton.alpha = 0.0
                    youHaveAnAccountLabel.isHidden = true
                    youHaveAnAccountLabel.alpha = 0.0
                    backToLogInButton.isHidden = true
                    backToLogInButton.alpha = 0.0
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.arrangeLayouts()
                self.logoImageView.isHidden = false
                self.checkBoxButton.isHidden = false
                self.userAgreementButton.isHidden = false
                self.youHaveAnAccountLabel.isHidden = false
                self.backToLogInButton.isHidden = false
                self.logoImageView.alpha = 0.8
                self.checkBoxButton.alpha = 1.0
                self.userAgreementButton.alpha = 1.0
                self.youHaveAnAccountLabel.alpha = 1.0
                self.backToLogInButton.alpha = 1.0
            } completion: { _ in
                self.logoImageView.alpha = 1.0
            }
        }
    }
}



//alerts
extension SignUpViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
    
    
}

extension SignUpViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
