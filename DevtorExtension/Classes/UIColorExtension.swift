//
//  UIColorExtension.swift
//  DevtorExtension
//
//  Created by Supakorn Thitivarangkool on 2/8/2562 BE.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    public static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    public func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    public func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    
    public func averageColor(image: UIImage) -> UIColor? {
        guard let inputImage = image.ciImage ?? CIImage(image: image) else { return nil }
        guard let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: CIVector(cgRect: inputImage.extent)])
            else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [kCIContextWorkingColorSpace : kCFNull])
        let outputImageRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: outputImageRect, format: kCIFormatRGBA8, colorSpace: nil)
        
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}


extension UIColor {
    
    public struct Kerry {
        public struct Orange {
            public static let primary       = UIColor(netHex: 0xff7000)
            public static let lighten       = UIColor(netHex: 0xffa140)
            public static let darken        = UIColor(netHex: 0xc43f00)
        }
        public struct Gray {
            public static let primary       = UIColor(netHex: 0x58595b)
            public static let lighten       = UIColor(netHex: 0x858688)
            public static let darken        = UIColor(netHex: 0x2f3032)
        }
    }
    
    public struct Material {
        public struct Red {
            public static let primary       = UIColor(netHex: 0xf44336)
            public static let lighten       = UIColor(netHex: 0xe57373)
            public static let darken        = UIColor(netHex: 0xb71c1c)
        }
        public struct Pink {
            public static let primary       = UIColor(netHex: 0xE91E63)
            public static let lighten       = UIColor(netHex: 0xF06292)
            public static let darken        = UIColor(netHex: 0x880E4F)
        }
        public struct Purple {
            public static let primary       = UIColor(netHex: 0x9C27B0)
            public static let lighten       = UIColor(netHex: 0xBA68C8)
            public static let darken        = UIColor(netHex: 0x4A148C)
        }
        public struct Indigo {
            public static let primary       = UIColor(netHex: 0x3F51B5)
            public static let lighten       = UIColor(netHex: 0x7986CB)
            public static let darken        = UIColor(netHex: 0x1A237E)
        }
        public struct Blue {
            public static let primary       = UIColor(netHex: 0x2196F3)
            public static let lighten       = UIColor(netHex: 0x64B5F6)
            public static let darken        = UIColor(netHex: 0x0D47A1)
        }
        public struct Cyan {
            public static let primary       = UIColor(netHex: 0x00BCD4)
            public static let lighten       = UIColor(netHex: 0x4DD0E1)
            public static let darken        = UIColor(netHex: 0x006064)
        }
        public struct Teal {
            public static let primary       = UIColor(netHex: 0x009688)
            public static let lighten       = UIColor(netHex: 0x4DB6AC)
            public static let darken        = UIColor(netHex: 0x004D40)
        }
        public struct Green {
            public static let primary       = UIColor(netHex: 0x4CAF50)
            public static let lighten       = UIColor(netHex: 0x81C784)
            public static let darken        = UIColor(netHex: 0x1B5E20)
        }
        public struct Yellow {
            public static let primary       = UIColor(netHex: 0xFFEB3B)
            public static let lighten       = UIColor(netHex: 0xFFF176)
            public static let darken        = UIColor(netHex: 0xF57F17)
        }
        public struct Amber {
            public static let primary       = UIColor(netHex: 0xFFC107)
            public static let lighten       = UIColor(netHex: 0xFFD54F)
            public static let darken        = UIColor(netHex: 0xFF6F00)
        }
        public struct Orange {
            public static let primary       = UIColor(netHex: 0xFF9800)
            public static let lighten       = UIColor(netHex: 0xFFB74D)
            public static let darken        = UIColor(netHex: 0xE65100)
        }
        public struct Gray {
            public static let primary       = UIColor(netHex: 0x9E9E9E)
            public static let lighten       = UIColor(netHex: 0xE0E0E0)
            public static let darken        = UIColor(netHex: 0x212121)
        }
        public struct BlueGray {
            public static let primary       = UIColor(netHex: 0x607D8B)
            public static let lighten       = UIColor(netHex: 0x90A4AE)
            public static let darken        = UIColor(netHex: 0x263238)
        }
    }
    
    public struct Social {
        public static let Facebook          = UIColor(netHex: 0x3b5999)
        public static let Messenger         = UIColor(netHex: 0x0084ff)
        public static let Twitter           = UIColor(netHex: 0x55acee)
        public static let LinkedIn          = UIColor(netHex: 0x0077B5)
        public static let Skype             = UIColor(netHex: 0x00AFF0)
        public static let Dropbox           = UIColor(netHex: 0x007ee5)
        public static let WhatsApp          = UIColor(netHex: 0x25D366)
        public static let WeChat            = UIColor(netHex: 0x09b83e)
        public static let Line              = UIColor(netHex: 0x00c300)
        public static let Pinterest         = UIColor(netHex: 0xbd081c)
        public static let Youtube           = UIColor(netHex: 0xcd201f)
    }
    
    public struct Metro {
        public static let Lime              = UIColor(netHex: 0xa4c400)
        public static let Green             = UIColor(netHex: 0x60a917)
        public static let Emerald           = UIColor(netHex: 0x008a00)
        public static let Teal              = UIColor(netHex: 0x00aba9)
        public static let Cyan              = UIColor(netHex: 0x1ba1e2)
        public static let Cobalt            = UIColor(netHex: 0x0050ef)
        public static let Indigo            = UIColor(netHex: 0x6a00ff)
        public static let Violet            = UIColor(netHex: 0xaa00ff)
        public static let Pink              = UIColor(netHex: 0xf472d0)
        public static let Magenta           = UIColor(netHex: 0xd80073)
        public static let Crimson           = UIColor(netHex: 0xa20025)
        public static let Red               = UIColor(netHex: 0xe51400)
        public static let Orange            = UIColor(netHex: 0xfa6800)
        public static let Amber             = UIColor(netHex: 0xf0a30a)
        public static let Yellow            = UIColor(netHex: 0xe3c800)
        public static let Brown             = UIColor(netHex: 0x825a2c)
        public static let Olive             = UIColor(netHex: 0x6d8764)
        public static let Steel             = UIColor(netHex: 0x647687)
        public static let Mauve             = UIColor(netHex: 0x76608a)
        public static let Sienna            = UIColor(netHex: 0xa0522d)
    }
    
    public struct Flat {
        public static let Turquoise         = UIColor(netHex: 0x1abc9c)
        public static let Greensea          = UIColor(netHex: 0x16a085)
        public static let Emerland          = UIColor(netHex: 0x2ecc71)
        public static let Nephritis         = UIColor(netHex: 0x27ae60)
        public static let Peterriver        = UIColor(netHex: 0x3498db)
        public static let Belizehole        = UIColor(netHex: 0x2980b9)
        public static let Amethyst          = UIColor(netHex: 0x9b59b6)
        public static let Wisteria          = UIColor(netHex: 0x8e44ad)
        public static let Wetasphalt        = UIColor(netHex: 0x34495e)
        public static let Midnightblue      = UIColor(netHex: 0x2c3e50)
        public static let Sunflower         = UIColor(netHex: 0xf1c40f)
        public static let Orange            = UIColor(netHex: 0xf39c12)
        public static let Carrot            = UIColor(netHex: 0xe67e22)
        public static let Pumpkin           = UIColor(netHex: 0xd35400)
        public static let Alizarin          = UIColor(netHex: 0xe74c3c)
        public static let Pomegranate       = UIColor(netHex: 0xc0392b)
        public static let Clouds            = UIColor(netHex: 0xecf0f1)
        public static let Silver            = UIColor(netHex: 0xbdc3c7)
        public static let Concrete          = UIColor(netHex: 0x95a5a6)
        public static let Asbestos          = UIColor(netHex: 0x7f8c8d)
    }
}
