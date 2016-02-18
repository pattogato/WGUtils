//
//  Extensions.swift
//  EPG
//
//  Created by Daniel Tombor on 04/07/2015.
//  Copyright (c) 2015 Telekom. All rights reserved.
//

import Foundation

// MARK: - String Extension

extension String {
    
    /// Returns the localized string from the localizable.strings file
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    /// Returns the height of the string with the given width and UIFont
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    /// Returns the ASCII encoded string
    var asciiEncodedString: String {
        return NSString(data: dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)!, encoding: NSASCIIStringEncoding) as! String
    }
    
}


// MARK: - UIFont Extension

enum FontType: String {
    
    case ExtraLight = "-ExtraLight"
    case Light = "-Light"
    case Regular = "-Regular"
    case Medium = "-Medium"
    case DemiBold = "-DemiBold"
    case Book = "-Book"
    case Bold = "-Bold"
    case Heavy = "-Heavy"
    
    case Italic = "-Italic"
}


// MARK: - Array extension

extension Array {
    
    /// Removes the object (that conforms to Equatable protocol) from the array
    mutating func removeObject<U: Equatable>(object: U) -> Bool {
        for (idx, objectToCompare) in self.enumerate() {  //in old swift use enumerate(self)
            if let to = objectToCompare as? U {
                if object == to {
                    self.removeAtIndex(idx)
                    return true
                }
            }
        }
        return false
    }
}

// MARK: - NSObject extension

extension NSObject {
    
    func printToConsoleName() -> String {
        return ""
    }
    
    func printToConsole(text: String) {
        print("[\(self.printToConsoleName())] \(text)")
    }
    
}

// MARK: - String extension

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
           let retval = try NSAttributedString(data: dataUsingEncoding(NSUTF8StringEncoding)!, options:[NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding], documentAttributes: nil)
            return retval
        } catch {
            return nil
        }
    }
}

// MARK: - NSLayoutContraint extension

extension NSLayoutConstraint {
    
    @IBInspectable
    var isHalfConstraint: Bool {
        get {
            return false
        }
        set {
            constant = constant / 2.0
        }
    }
    
}






