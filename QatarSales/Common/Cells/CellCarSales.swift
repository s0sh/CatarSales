//
//  CelCarSales.swift
//  QatarSales
//
//  Created by Usman  on 01/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CellCarSales: UICollectionViewCell {
    
    override func awakeFromNib() {
        
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
    }
    
}
