//
//  WGStringUtils.swift
//  WGUtils
//
//  Created by Bence Pattogato on 18/02/16.
//  Copyright © 2016 Wintergarden. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    
    /**
     Parses a string containing a double numerical value into an optional double if the string is a well formed number.
     :returns: A double parsed from the string or nil if it cannot be parsed.
     */
    func toDouble() -> Double? {
        
        let scanner = NSScanner(string: self)
        var double: Double = 0
        
        if scanner.scanDouble(&double) {
            return double
        }
        
        return nil
        
    }
    
    /**
     Parses a string containing a float numerical value into an optional float if the string is a well formed number.
     :returns: A float parsed from the string or nil if it cannot be parsed.
     */
    func toFloat() -> Float? {
        
        let scanner = NSScanner(string: self)
        var float: Float = 0
        
        if scanner.scanFloat(&float) {
            return float
        }
        
        return nil
        
    }
    
}