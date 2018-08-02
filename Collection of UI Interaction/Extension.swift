//
//  Extension.swift
//  Collection of UI Interaction
//
//  Created by edaotech on 2018/7/31.
//  Copyright © 2018年 moekyo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var randomColor: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
