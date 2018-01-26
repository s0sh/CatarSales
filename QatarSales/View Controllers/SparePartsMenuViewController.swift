//
//  SparePartsMenuViewController.swift
//  QatarSales
//
//  Created by Usman  on 17/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class SparePartsMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func navigateTo(ViewController identifier : String) {
        
        switch identifier {
        case "SparePartsShopViewController":
            let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
            self.navigationController?.pushViewController(viewController, animated: true)
            break
        case "CarSalesViewController":
            let viewController : CarSalesViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier) as! CarSalesViewController
            viewController.isComeFrom = .SparePartsMenuViewController
            self.navigationController?.pushViewController(viewController, animated: true)
            break
        default:
            break
        }
    }

    @IBAction func btnShop(_ sender: Any) {
        
        navigateTo(ViewController: "SparePartsShopViewController")
    }
    @IBAction func btnAdd(_ sender: Any) {
        
        navigateTo(ViewController: "CarSalesViewController")
    }
}
