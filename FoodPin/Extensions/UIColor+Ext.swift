//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Divyansh Kaushik on 6/9/22.
//

import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        let redValue = red / 255.0
        let greenValue = green / 255.0
        let blueValue = blue / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
