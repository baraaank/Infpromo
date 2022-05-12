//
//  CustomSegmentedControl.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 16.03.2022.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func changeToIndex(index: Int)
}

class CustomSegmentedControl: UIView {

    private var _selectedIndex: Int = 0
    public var selectedIndex: Int {
        return _selectedIndex
    }
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = UIColor().infpromo
    var selectorTextColor: UIColor = UIColor().infpromo

    convenience init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
 
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
//            button.setTitle(buttonTitle, for: .normal)
            button.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)]), for: .normal)
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.numberOfLines = 0
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                delegate?.changeToIndex(index: buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    func setIndex(index: Int) {
        buttons.forEach({$0.setTitleColor(textColor, for: .normal)})
        let button = buttons[index]
        _selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    func setTitleAttributes(sender: UIButton, size: Int, title: String) {
        sender.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(size), weight: .regular)]), for: .normal)
        
    }
    
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }

}
