//
//  CellHome.swift
//  QatarSales
//
//  Created by Usman  on 28/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CellHome: UICollectionViewCell {
    
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setBorder()
    }
    
    func setBorder() {
        
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
        
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOpacity = 1.0
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func set(Data model : HomeDataModel) {
        
        lblHeading.text = model.heading
        
        switch model.state {
        case .normal:
            
            lblHeading.textColor = UIColor.black
            imageview.image = UIImage(named: model.imageName!)
            self.backgroundColor = model.bgColor
            break
        default:
            
            lblHeading.textColor = UIColor.white
            imageview.image = UIImage(named: model.selectedImageName!)
            self.backgroundColor = model.bgSelectedColor
            break
        }
    }
    
    func setSelected(Data model : HomeDataModel) {
        
        lblHeading.textColor = UIColor.white
        imageview.image = UIImage(named: "homeAboutUs_Selected")
        self.backgroundColor = UIColor.brown
    }
    
    func setUnselected(Data model : HomeDataModel) {
        
        lblHeading.textColor = UIColor.black
        imageview.image = UIImage(named: model.imageName!)
        self.backgroundColor = UIColor.white
    }
}
