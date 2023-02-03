//
//  AppUtility.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//



import UIKit
import Foundation


class AppUtility:NSObject{
    
    static var sharedInstance = AppUtility()
    
    func makeBold(bold:String,regular:String) -> String{
        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 12.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 12.0)!
        ]
        let boldText = NSAttributedString(string: bold, attributes: boldAttribute)
        let regularText = NSAttributedString(string: regular, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        return "\(newString)"
    }
}
