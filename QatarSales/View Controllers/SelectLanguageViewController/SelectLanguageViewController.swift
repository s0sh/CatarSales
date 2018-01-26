//
//  SelectLanguageViewController.swift
//  QatarSales
//
//  Created by Usman  on 28/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class SelectLanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSelectLanguage(_ sender: Any) {
        
        let homeTabbarController : HomeTabbarController = Utilities.Storyboard.getControllerFrom(Stroyboard: "Main", WithIdentifier: "HomeTabbarController") as! HomeTabbarController

//        self.navigationController?.pushViewController(homeTabbarController, animated: true)
//        return
        
        let navigationController = UINavigationController(rootViewController: homeTabbarController)
        self.navigationController?.present(navigationController, animated: true, completion: {
            
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
