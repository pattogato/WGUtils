//
//  WGUIElentUtils.swift
//  WGUtils
//
//  Created by Bence Pattogato on 18/02/16.
//  Copyright © 2016 Wintergarden. All rights reserved.
//

import UIKit


// MARK: - UIFont Extensions

extension UIFont {
    
    /// Prints out the installed fonts to the console
    class func installedFonts() {
        for family in UIFont.familyNames() {
            print("\(family)")
            let fam: String = family
            for name in UIFont.fontNamesForFamilyName(fam)
            {
                print("\t\(name)")
            }
        }
    }
    
}

// MARK: - UIColor Extension

extension UIColor {
    
    
    /// Init the UIColor with int numbers between 0 and 255
    convenience init(red: Int, green: Int, blue: Int, andAlpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: andAlpha)
    }
    
    /// Init the UIColor with hexa numbers like 0xABC123
    convenience init(netHex:Int, alpha: CGFloat = 1.0) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, andAlpha: alpha)
    }
    
}

// MARK: - UIImage Extension

extension UIImage {
    
    convenience init?(var multiSizeImageNamed named: String) {
        
        if Device.IS_4_INCHES() {
            named += "_i5"
        } else if Device.IS_4_7_INCHES() {
            named += "_i6"
        } else if Device.IS_5_5_INCHES() {
            named += "_i6" //TODO: _i6P images
        } else if Device.isPad() {
            named += "_iPad"
        }
        
        self.init(named: named)
    }
    
}

// MARK: - UIBarButtonItem Extension

extension UIBarButtonItem {
    
    /// Returns a back button
    class func backButton(target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "iconBack"), style: UIBarButtonItemStyle.Plain, target: target, action: action)
        
        return backButton
    }
    
}

// MARK: - UILabel extension

extension UILabel {
    
    /// Returns the name of the used font
    var fontName: String {
        get {
            return self.font.fontName
        }
        set {
            self.font = UIFont(name: newValue, size: self.font.pointSize)
        }
    }
    
    /// Property to set the size of the font on 4 inches or smaller screen
    var fontSmallSize: NSNumber? {
        get {
            return NSNumber(float: Float(self.font.pointSize))
        }
        set {
            if let size = newValue where Device.IS_4_INCHES_OR_SMALLER() {
                self.font = UIFont(name: self.font.fontName, size: CGFloat(size.floatValue))
            }
        }
    }
    
    /// Strucks the attributed string through
    func struckThrough(struck: Bool) {
        if struck == true {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.darkGrayColor(), range: NSMakeRange(0, attributedString.length))
            self.attributedText = attributedString
        } else {
            self.attributedText = NSAttributedString(string: self.text!)
        }
    }
    
    
}

// MARK: - UIButton extension

extension UIButton {
    
    /// Returns the name of the used font
    var fontName: String? {
        get {
            return self.titleLabel!.font.fontName
        }
        set {
            if let name = newValue {
                self.titleLabel!.font = UIFont(name: name, size: self.titleLabel!.font.pointSize)
            }
        }
    }
    
    /// Property to set the size of the font on 4 inches or smaller screen
    var fontSmallSize: NSNumber? {
        get {
            return NSNumber(float: Float(self.titleLabel!.font.pointSize))
        }
        set {
            if let size = newValue where Device.IS_4_INCHES_OR_SMALLER() {
                self.titleLabel!.font = UIFont(name: self.titleLabel!.font.fontName, size: CGFloat(size.floatValue))
            }
        }
    }
    
    /// Sets the title for all states
    var titleForAllState: String? {
        get {
            return self.titleLabel?.text
        }
        set {
            self.setTitle(titleForAllState, forState: .Normal)
            self.setTitle(titleForAllState, forState: .Highlighted)
            self.setTitle(titleForAllState, forState: .Selected)
            self.setTitle(titleForAllState, forState: .Disabled)
            self.setTitle(titleForAllState, forState: .Reserved)
            self.setTitle(titleForAllState, forState: .Application)
        }
    }
    
}

// MARK: - UITextField extension

extension UITextField {
    
    /// Property for the placeholder text's color
    @IBInspectable var placeholderColor: UIColor {
        get {
            return UIColor.whiteColor()
        }
        set {
            if let placeholder = placeholder {
                attributedPlaceholder = NSAttributedString(
                    string: placeholder,
                    attributes: [NSForegroundColorAttributeName: newValue]
                )
            }
        }
    }
    
}

// MARK: - UIView extension

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            guard let borderc = layer.borderColor else {
                return UIColor()
            }
            return UIColor(CGColor: borderc)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
}