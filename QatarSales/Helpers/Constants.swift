//
//  Constants.swift
//  QatarSales
//
//  Created by Usman  on 25/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    struct Screen {
        
        static let Screen_Size = UIScreen.main.bounds.size
    }
    
    struct Storyboards {
        
        static let mainStoryboard = "Main"
        static let secondaryStoryboard = "SecondaryStoryboard"
        static let menuStoryboard = "MenuStoryboard"
    }
    
    struct Colors {
        
        static let navigationBackgroundColor = UIColor(colorLiteralRed: (128.0/255.0), green: (0.0/255.0), blue: (0.0/255.0), alpha: 1.0)
        static let viewBackgroundColor = "Main"
    }
    
    struct Fonts {
        
        struct Raleway {
            
            static let regular  = "Raleway-Regular"
            static let semiBold  = "Raleway-SemiBold"
        }
    }
}
