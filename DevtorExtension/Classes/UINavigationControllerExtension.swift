//
//  UINavigationControllerExtension.swift
//  DevtorExtension
//
//  Created by Supakorn Thitivarangkool on 5/8/2562 BE.
//

import Foundation

extension UINavigationController {
    
    public func removeHairLine() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    public func setupNavigationBar(color: UIColor, hairlineRemoved: Bool = true) {
        self.navigationBar.barTintColor = color
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.isHidden = false
        self.view.backgroundColor = .clear
        self.navigationBar.isTranslucent = false
        if hairlineRemoved {
            self.removeHairLine()
        }
    }
    
    public func addImageToNavigationBar(titleImage: UIImage) {
        
        let imageView = UIImageView.init(image: titleImage)
        
        let bannerWidth = self.navigationBar.frame.size.width
        let bannerHeight = self.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - (titleImage.size.width) / 2
        let bannerY = bannerHeight / 2 - (titleImage.size.height) / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
}


