//
//  ViewController.swift
//  DevtorExtension
//
//  Created by ifeemily@gmail.com on 08/02/2019.
//  Copyright (c) 2019 ifeemily@gmail.com. All rights reserved.
//

import UIKit
import DevtorExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.Kerry.Orange.primary
        self.view.backgroundColor = color
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.view.backgroundColor = color.lighter(by: 30) // returns lighter color by 30%
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.view.backgroundColor = color.darker(by: 30) // returns darker color by 30%
        }
        
        
    }

}

