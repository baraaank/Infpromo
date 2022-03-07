//
//  Extensions.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 16.02.2022.
//

import Foundation
import UIKit

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

extension UIColor {
    var infpromo: UIColor {
        return UIColor(red: 75/255, green: 70/255, blue: 189/255, alpha: 1.0)
    }
    var infpromoBorder: UIColor {
        return UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 0.8)
    }
}
