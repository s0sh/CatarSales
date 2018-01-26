//
//  UIImage.swift
//  QatarSales
//
//  Created by Usman  on 04/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func getImageFrom(Color color: UIColor, AndSize size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
