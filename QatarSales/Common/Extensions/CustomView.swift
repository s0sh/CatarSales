//
//  CustomView.swift
//  QatarSales
//
//  Created by Usman  on 02/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }


    override func draw(_ rect: CGRect) {
        // Drawing code
    }
}
