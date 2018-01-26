//
//  HomeDataModel.swift
//  QatarSales
//
//  Created by Usman  on 04/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class HomeDataModel: NSObject {
    
    var heading : String?
    var imageName : String?
    var selectedImageName : String?
    var viewControllerIdentifier : String?
    var state : States = .normal
    var bgColor : UIColor = UIColor.white
    var bgSelectedColor : UIColor = Constants.Colors.navigationBackgroundColor
    
    override init() {
        
        super.init()
    }
    
    init(heading _heading : String, imageName _imageName : String, viewControllerIdentifier identifier : String) {
        
        super.init()
        
        heading = _heading
        imageName = _imageName
        viewControllerIdentifier = identifier
    }
    
    init(heading _heading : String, imageName _imageName : String, selectedImageName _selectedImageName : String, viewControllerIdentifier identifier : String, State _state : States = .normal, BGColor _bgColor : UIColor = .white, BGSelectedColor _bgSelectedColor : UIColor = Constants.Colors.navigationBackgroundColor ) {
        
        super.init()
        
        heading = _heading
        imageName = _imageName
        selectedImageName = _selectedImageName
        viewControllerIdentifier = identifier
        state = _state
        bgColor = _bgColor
        bgSelectedColor = _bgSelectedColor
    }
}
