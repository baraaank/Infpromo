//
//  EditProfileViewController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 14.05.2022.
//

import UIKit



class EditProfileViewController: UIViewController {

    //0.14
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Güncelle", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Kaydet", for: .normal)
        button.setTitleColor(UIColor().infpromo, for: .normal)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Vazgeç", for: .normal)
        button.setTitleColor(UIColor().infpromo, for: .normal)
        return button
    }()
    
    enum TextFieldData: Int {
        case name = 0
        case surname
        case socialMedia
        case titleInfo
        case email
        case language
        case webSite
        case birthday
        case location
        case phone
    }
    
    var name = ""
    var surname = ""
    var socialMedia = ""
    var titleInfo = ""
    var email = ""
    var language = ""
    var webSite = ""
    var birthday = ""
    var location = ""
    var phone = ""
    
    let infoModel: [String] = [
        "İsim",
        "Soyisim",
        "Sosyal Medya",
        "Title",
        "Email",
        "Dil",
        "Web Sitesi",
        "Doğum Günü",
        "Lokasyon",
        "Telefon",
    ]
    
  
    
    var textModel: [String] = []
 
 
    private let editableTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(EditableTableViewCell.self, forCellReuseIdentifier: EditableTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        editableTableView.delegate = self
        editableTableView.dataSource = self
        view.backgroundColor = .systemGray6
        title = "Profili Güncelle"
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        
        
    }
    
    @objc func saveButtonTapped() {
        view.endEditing(true)
        print(name)
        print(surname)
        print(socialMedia)
        print(titleInfo)
        print(email)
        print(language)
        print(webSite)
        print(birthday)
        print(location)
        print(phone)
        
        APICaller.shared.updateUser(name: name, surName: surname, socialMedia: socialMedia, title: titleInfo, email: email, language: language, website: webSite, birthday: birthday, city: location, phone: phone) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let model):
                if model.success == true {
                    print("succees babby")
                    
                    let success = ["success": "success"]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadDatas"), object: nil, userInfo: success)
                    
                    var editedModelFrom: ProfileInformationsCellViewModel?
                    if let userPub = model.data?.userPublic {
                        
                            editedModelFrom = .init(name: userPub.name ?? "henüz girilmemiş..",
                                                    surName: userPub.surName ?? "henüz girilmemiş..",
                                                    email: userPub.email ?? "henüz girilmemiş..",
                                                    birthday: userPub.birthday ?? "henüz girilmemiş..",
                                                    city: userPub.city ?? "henüz girilmemiş..",
                                                    language: userPub.language ?? "henüz girilmemiş..",
                                                    phone: userPub.phone ?? "henüz girilmemiş..",
                                                    socialMedia: userPub.socialMedia ?? "henüz girilmemiş..",
                                                    title: userPub.title ?? "henüz girilmemiş..",
                                                    website: userPub.website ?? "henüz girilmemiş..")
                        
                    }
                    
                    let editedOnes: [String: Any] = ["editedOnes": editedModelFrom]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadDatasFromEdited"), object: nil, userInfo: editedOnes)
                    
                    DispatchQueue.main.async {
                        self.view.endEditing(true)
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                    
                }
            }
        }
    }
    
    @objc func cancelButtonTapped() {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
//    let alertController = UIAlertController(title: "Vazgeç", message:
//      "Yaptığınız değişiklikler silinecektir", preferredStyle: .alert)
//    alertController.addAction(UIAlertAction(title: "Devam", style: .default, handler: {action in
//    }))
//    alertController.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: {action in
//        self.navigationController?.popViewController(animated: true)
//    }))
//    self.present(alertController, animated: true, completion: nil)
//

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    func addSubviews() {
        view.addSubview(editableTableView)
        view.addSubview(topLabel)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLabel.frame = CGRect(x: 80, y: 20, width: view.width - 160, height: 30)
        cancelButton.frame = CGRect(x: 10, y: topLabel.top, width: 60, height: 30)
        saveButton.frame = CGRect(x: view.width - 70, y: topLabel.top, width: 60, height: 30)
        editableTableView.frame = CGRect(x: 0, y: topLabel.bottom + 10, width: view.width, height: editableTableView.contentSize.height)
    }
    
    @objc func valueChanged(_ textField: UITextField) {
        if textModel.count == 10 {
            switch textField.tag {
            case TextFieldData.name.rawValue:
                name = textField.text ?? textModel[0]
            case TextFieldData.surname.rawValue:
                surname = textField.text ?? textModel[1]
            case TextFieldData.socialMedia.rawValue:
                socialMedia = textField.text ?? textModel[2]
            case TextFieldData.titleInfo.rawValue:
                titleInfo = textField.text ?? textModel[3]
            case TextFieldData.email.rawValue:
                email = textField.text ?? textModel[4]
            case TextFieldData.language.rawValue:
                language = textField.text ?? textModel[5]
            case TextFieldData.webSite.rawValue:
                webSite = textField.text ?? textModel[6]
            case TextFieldData.birthday.rawValue:
                birthday = textField.text ?? textModel[7]
            case TextFieldData.location.rawValue:
                location = textField.text ?? textModel[8]
            case TextFieldData.phone.rawValue:
                phone = textField.text ?? textModel[9]
            default:
                break
            }
        }
        
    }
   
}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
 
    
    
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EditableTableViewCell.reuseIdentifier, for: indexPath) as! EditableTableViewCell
        
        let modelIndex = infoModel[indexPath.row]
        let textIndex = textModel[indexPath.row]
        cell.configureLabel(modelIndex)
        cell.configureTextField(textIndex)
        
        cell.infoTextField.tag = indexPath.row
        cell.infoTextField.delegate = self
        cell.infoTextField.addTarget(self, action: #selector(valueChanged), for: .editingDidEnd)
        
        return cell
    }
    
    
}



extension EditProfileViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            editableTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            editableTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
