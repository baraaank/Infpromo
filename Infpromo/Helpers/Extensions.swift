//
//  Extensions.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 16.02.2022.
//

import Foundation
import UIKit


//uncertain json objects
enum QuantumValue: Decodable {
    
    case float(Float), string(String)
    
    init(from decoder: Decoder) throws {
        if let float = try? decoder.singleValueContainer().decode(Float.self) {
            self = .float(float)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw QuantumError.missingValue
    }
    
    enum QuantumError:Error {
        case missingValue
    }
}

extension QuantumValue {
    
    var floatValue: Float? {
        switch self {
        case .float(let value): return value
        case .string(let value): return Float(value)
        }
    }
}

//declare frames easy
extension UIView {
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
}

//infpromo colors
extension UIColor {
    var infpromo: UIColor {
        return UIColor(red: 75/255, green: 70/255, blue: 189/255, alpha: 1.0)
    }
    var infpromoBorder: UIColor {
        return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.8)
    }
}

//truncate exponentials
extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self) / pow(10.0, Double(places)))
    }
}

extension Formatter {
    static let dotSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.dotSeparator.string(for: self) ?? "" }
}

//custom button for filter
class CustomFilterButton: UIButton {
    var section: Int = 0
    var row : Int = 0
}

class CustomImageView: UIImageView {
    var section: Int = 0
    var row: Int = 0
}

class CustomTapGesture: UITapGestureRecognizer {
    var section: Int = 0
    var row: Int = 0
}



extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}


extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}


//text field password eye
extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye.slash", withConfiguration: UIImage.SymbolConfiguration.init(weight: .light)), for: .normal)
            button.tintColor = UIColor().infpromoBorder
        } else {
            button.setImage(UIImage(systemName: "eye", withConfiguration: UIImage.SymbolConfiguration.init(weight: .light)), for: .normal)
            button.tintColor = UIColor().infpromo
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
