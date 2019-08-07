//
//  StringExtension.swift
//  DevtorExtension
//
//  Created by Supakorn Thitivarangkool on 5/8/2562 BE.
//

import Foundation

// String format checker
extension String {
    
    public func verifyCitizenID() -> Bool {
        
        if self.count != 13 { return false }
        
        var isProtected: Bool = false
        
        var sum: Int = 0
        
        for i in 0...11 {
            
            let index = self.index (self.startIndex, offsetBy: i)
            if let charAtIndex = Int(String(self[index])) {
                sum += charAtIndex*(13-i)
            } else {
                if (String(self[index]) == "X" || String(self[index]) == "x") && isProtected == false {
                    isProtected = true
                }
            }
        }
        
        let lastIndex = self.index (self.startIndex, offsetBy: 12)
        if let lastChar = Int(String(self[lastIndex])) {
            if (11-sum%11)%10 != lastChar && isProtected == false{
                return false
            }
        }
        
        return true
    }
    
    public func verifyMobileNumber() -> (isValid: Bool, isMobile: Bool) {
        
        if self.count == 10 {
            if self.hasPrefix("06") || self.hasPrefix("08") || self.hasPrefix("09"){
                return (true, true)
            }else{
                return (false, false)
            }
        }else if self.count == 9 {
            if self.hasPrefix("02")
                || self.hasPrefix("03")
                || self.hasPrefix("04")
                || self.hasPrefix("05")
                || self.hasPrefix("07") {
                return (true, false)
            }else{
                return (false, false)
            }
        } else {
          return (false, false)
        }
    }
    
    public var isAlphanumeric: Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    public var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil && self != ""
    }
    
}

// Convert string to format while editing the data
extension String {
    
    public func toCitizenIDFormatWhileEditing() -> String {
        // x-xxxx-xxxxx-xx-x
        var mString = self
        if mString.count == 0{
            mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 2{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 1))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 7{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 6))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 13{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 12))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 16{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 15))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        return mString
    }
    
    public func toMobileNumberFormatWhileEditing() -> String {
        //xxx-xxx-xxxx
        var mString = self
        
        if mString.count == 0{
            mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 4{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 3))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 8{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 7))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        return mString
    }
}

// Convert string to format
extension String {
    
    public func toCitizenIDFormat() -> String {
        //x-xxxx-xxxxx-xx-x
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 13{
            
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 1))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 6))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 12))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 15))
            
        }
        
        return mString
    }
    
    public func toMobileNumberFormat(character: Character="-") -> String {
        //xxx-xxx-xxxx
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 10{
            
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 3))
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 7))
            
        }
        
        return mString
    }
    
    // This function support only Paperang printer.
    public func toPaperangMacAddressFormat() -> String {
        // XX:XX:XX:XX:XX:XX
        var mString = self
        
        if mString.count == 12{
            
            mString.insert(":", at: mString.index(mString.startIndex, offsetBy: 2))
            mString.insert(":", at: mString.index(mString.startIndex, offsetBy: 5))
            mString.insert(":", at: mString.index(mString.startIndex, offsetBy: 8))
            mString.insert(":", at: mString.index(mString.startIndex, offsetBy: 11))
            mString.insert(":", at: mString.index(mString.startIndex, offsetBy: 14))
        }
        
        return mString
    }
    
    public func hideCitizenID(character: Character = "-") -> String {
        //y-yyyy-xxxxx-xx-y
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 13{
            
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 1))
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 6))
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 12))
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 15))
            
            var result = String()
            var i = 0
            for char in mString {
                if i == 7 || i == 8 || i == 9 || i == 10 || i == 11 || i == 13 || i == 14{
                    let temp: Character = "x"
                    result.append(temp)
                } else {
                    result.append(char)
                }
                i+=1
            }
            return result
        }
        
        return ""
        
    }
    
    public func hidePassport() -> String {
        //yy-xxxxxxx - 10
        //yx-xxxxxx - 9
        //yx-xxxxx - 8
        //xx-xxxx - 7
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count >= 6 && mString.count <= 9{
            
            var result = String()
            var i = 0
            for char in mString {
                switch mString.count {
                case 6:
                    if i == 0 || i == 1 || i == 2 || i == 3{
                        let temp: Character = "x"
                        result.append(temp)
                    } else {
                        result.append(char)
                    }
                    i+=1
                case 7:
                    if i == 0 || i == 1 || i == 2 || i == 3 || i == 4{
                        let temp: Character = "x"
                        result.append(temp)
                    } else {
                        result.append(char)
                    }
                    i+=1
                case 8:
                    if i == 0 || i == 1 || i == 2 || i == 3 || i == 4 || i == 5{
                        let temp: Character = "x"
                        result.append(temp)
                    } else {
                        result.append(char)
                    }
                    i+=1
                case 9:
                    if i == 0 || i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 6{
                        let temp: Character = "x"
                        result.append(temp)
                    } else {
                        result.append(char)
                    }
                    i+=1
                default: break
                }
                
            }
            return result
        }
        
        return ""
        
    }
    
    public func hideMobileNumber(character: Character = "-") -> String {
        //yyy yyy yyxx
        var mString = self
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 10{
            
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 3))
            mString.insert(character, at: mString.index(mString.startIndex, offsetBy: 7))
            
            var result = String()
            var i = 0
            for char in mString {
                if  i == 4 ||
                    i == 5 ||
                    i == 6 ||
                    i == 8 ||
                    i == 9 {
                    let temp: Character = "x"
                    result.append(temp)
                } else {
                    result.append(char)
                }
                i+=1
            }
            
            return result
            
        }
        
        return ""
    }
}

extension String {
    
    public struct Symbology {
        public static let code128 = "CICode128BarcodeGenerator"
        public static let pdf417 = "CIPDF417BarcodeGenerator"
        public static let aztec = "CIAztecCodeGenerator"
        public static let qr = "CIQRCodeGenerator"
    }
    
    public func toQRCode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: Symbology.qr) {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("M", forKey: "inputCorrectionLevel")
            let transform = CGAffineTransform(scaleX: 200, y: 200)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    public func toBarcode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: Symbology.code128) {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
