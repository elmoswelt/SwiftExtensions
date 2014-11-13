//
//  NSColorExtensions.swift
//  SwiftExtensions
//
//  Created by Elmar Tampe on 13/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa

extension NSColor
{
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Color with Hexadecimal value
    // ------------------------------------------------------------------------------------------
	class func colorWitHexValue(hexValue: NSString) -> NSColor {
		
        return NSColor.colorWithHexValue(hexValue)
	}
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - String to Integer conversion
    // ------------------------------------------------------------------------------------------
    class func colorWithHexValue(hexValue: NSString) -> NSColor {
    
        var hexString = hexValue.stringByReplacingOccurrencesOfString("#", withString: "0x")

        var hexStringValueAsInt: uint = 0
        let scanner = NSScanner(string: hexString)
        
        var color: NSColor?
        if scanner.scanHexInt(&hexStringValueAsInt) {
        
            color = NSColor.colorWithIntegerHexValue(hexStringValueAsInt)
        }
        
        return color!
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - RGBA Color creation
    // ------------------------------------------------------------------------------------------
    class func colorWithIntegerHexValue(hexValueAsInt: uint) -> NSColor {
    
        let digitCount:NSInteger = NSInteger((log10(Double(hexValueAsInt)) + 1))
        
        let alpha = ((digitCount == 10) ? (((CGFloat)((hexValueAsInt & 0xFF000000) >> 24)) / 255.0) : 1.0)
        let red = ((CGFloat)((hexValueAsInt & 0xFF0000) >> 16)) / 255.0
        let green = ((CGFloat)((hexValueAsInt & 0xFF00) >> 8)) / 255.0
        let blue = ((CGFloat)(hexValueAsInt & 0xFF)) / 255.0
        
        return NSColor(calibratedRed: red, green: green, blue: blue, alpha: alpha)
    }
}
