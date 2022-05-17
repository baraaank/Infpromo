//
//  ForgetPasswordViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 17.05.2022.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logIn")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
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
        textField.returnKeyType = .next
//        textField.backgroundColor = .systemGray6
        textField.tag = 1
        return textField
    }()
    
    private let forgetButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Devam Et", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        button.addTarget(self, action: #selector(forgetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let goToLogInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "Giriş Yap!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(UIColor().infpromo, for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(goToLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
        view.backgroundColor = .white
        addSubViews()
        
        gif = LoadingGif.init(imageName: "infpromoLoadingGif", frame: CGRect(x: (view.frame.size.width / 2) - 40, y: (view.frame.size.height / 2) - 40, width: 80, height: 80), duration: 0.8, repeatCount: 0)
        blurEffectView.frame = view.bounds
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.frame = CGRect(x: 10, y: view.height / 10, width: view.width - 20, height: 60)
        emailTextField.frame = CGRect(x: 20, y: logoImageView.bottom + view.height / 10, width: view.width - 40, height: 50)
        forgetButton.frame = CGRect(x: 20, y: emailTextField.bottom + 20, width: view.width - 40, height: 50)
        goToLogInButton.frame = CGRect(x: view.width / 2, y: forgetButton.bottom + 20, width: view.width / 2 - 20, height: 20)
    }
    
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(forgetButton)
        view.addSubview(goToLogInButton)
    }

    @objc func forgetButtonTapped() {
        
        view.endEditing(true)
        
        guard let email = emailTextField.text, !email.isEmpty else {
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
        
        DispatchQueue.main.async {
            self.startBlur()
        }
        
        AuthManager.shared.forgetPassword(email: email) { result in
            switch result {
            case .failure(let error):
                print("forgeett password error: \(error)")
            case .success(let model):
                if model.success == true {

                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Başarılı", message:
                          "Lütfen email adresinize gelen linke tıklayarak şifrenizi değiştirin.", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
                            let vc = LogInViewController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true)
                        }))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Hata", message: "Bu email adresi bulunamadı.")
                    }
                    
                }
            }
            
            DispatchQueue.main.async {
                self.stopBlur()
            }
           
        }
        
        
       
    }
    
    @objc func goToLoginButtonTapped() {
        let vc = LogInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}

extension ForgetPasswordViewController: UITextFieldDelegate {
    
}


extension ForgetPasswordViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
}

extension ForgetPasswordViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
