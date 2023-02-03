//
//  Extensions.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import Foundation
import UIKit


extension UIView {
    
    
    func uiViewShadow() {
        self.layer.cornerRadius = 6
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
    }
    
    
}
