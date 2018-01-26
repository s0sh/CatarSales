//
//  Utilities.swift
//  QatarSales
//
//  Created by Usman  on 25/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    class Storyboard {
        
        class func getControllerFrom(Stroyboard storyBoardName : String, WithIdentifier identifier : String) -> UIViewController {
            
            let storyBoard = UIStoryboard.init(name: storyBoardName, bundle: nil)
            return storyBoard.instantiateViewController(withIdentifier: identifier)
        }
    }
    
    class HelpingMethods {
        
        class func get(RelativeHeight height : Int) -> CGSize {

            let calculatedHeight = (CGFloat(height) * Constants.Screen.Screen_Size.width)/CGFloat(414)
            return CGSize(width: Int(Constants.Screen.Screen_Size.width), height: Int(calculatedHeight))
        }
        
        class func set(Font name : String, WithSize size : CGFloat) -> UIFont {
            
            return UIFont(name: name, size: size)!
        }

    }
}
