//
//  AppData.swift
//  SunilPracticalAvdevs
//
//  Created by satish prajapati on 09/04/25.
//

import Foundation
import UIKit



final class AppData: NSObject {
    
    static let shared = AppData()
    
    //set multiple Color in one label
    class func setLabelMultipleColor(firstText: String, secondText: String,firstColor:UIColor,secondColor:UIColor) -> NSAttributedString{
        let string = firstText + secondText as NSString
        let result = NSMutableAttributedString(string: string as String)
        
        let attributesForFirstWord = [NSAttributedString.Key.foregroundColor:firstColor as UIColor]
        let attributesForSecondWord = [NSAttributedString.Key.foregroundColor:secondColor as UIColor]
        result.setAttributes(attributesForFirstWord,
                             range: string.range(of: firstText))
        result.setAttributes(attributesForSecondWord,
                             range: string.range(of: secondText))
        return NSAttributedString(attributedString: result)
    }
}
