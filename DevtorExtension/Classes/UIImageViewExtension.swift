//
//  UIImageViewExtension.swift
//  DevtorExtension
//
//  Created by Supakorn Thitivarangkool on 6/8/2562 BE.
//

import Foundation

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    public func downloaded(from link: String,
                           contentMode mode: UIViewContentMode = .scaleAspectFit,
                           cache: Bool = false)
    {
        if cache {
            image = nil
            if let imageFromCache = imageCache.object(forKey: link as AnyObject) as? UIImage {
                self.image = imageFromCache
                return
            }
        }
        
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    func downloaded(from url: URL,
                    contentMode mode: UIViewContentMode = .scaleAspectFit)
    {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            UIView.transition(with: self,
                              duration: 0.7,
                              options: .transitionCrossDissolve,
                              animations: { self.image = image },
                              completion: nil)
            
            }.resume()
        
    }
    
}

extension UIImageView {
    
    public func circleImageView(borderColor: UIColor, borderWidth: CGFloat = 0) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    public func imageFromBase64(base64:String) {
        let data = Data(base64Encoded: base64)
        self.image = UIImage(data: data!)!
    }
    
}
