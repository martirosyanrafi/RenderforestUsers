//
//  UIViewExtension.swift
//  Users
//
//  Created by Rafi Martirosyan on 28.01.21.
//

import UIKit

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
}
