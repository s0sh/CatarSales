//
//  FilterOneViewController.swift
//  QatarSales
//
//  Created by Usman  on 23/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class FilterOneViewController: UIViewController {

    @IBOutlet weak var txtTypeOfAd: UITextField!
    @IBOutlet weak var txtManufacture: UITextField!
    @IBOutlet weak var txtModel: UITextField!
    @IBOutlet weak var txtPriceMin: UITextField!
    @IBOutlet weak var txtPriceMax: UITextField!
    @IBOutlet weak var txtMileageMin: UITextField!
    @IBOutlet weak var txtMileageMax: UITextField!
    @IBOutlet weak var txtTransmission: UITextField!
    @IBOutlet weak var txtCylinders: UITextField!
    @IBOutlet weak var txtWarranty: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func btnApply(_ sender: Any) {
        
        dismissController()
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        dismissController()
    }
    
    @IBAction func btnDropDown(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            showActionSheet(values: ["Any", "Personal Ads Only", "Showroom Ads Only"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtTypeOfAd.text = _value
                }
            })
            
            break
        case 1:
            showActionSheet(values: ["Any", "Nissan", "Audi"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtManufacture.text = _value
                }
            })
            
            break
        case 2:
            showActionSheet(values: ["Any", "370z", "350z"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtModel.text = _value
                }
            })
            
            break
        case 3:
            showActionSheet(values: ["Any", "Automatic", "Manual"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtTransmission.text = _value
                }
            })
            
            break
        case 4:
            showActionSheet(values: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtCylinders.text = _value
                }
            })
            
            break
            
        default:
            showActionSheet(values: ["Any", "Yes", "No"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtWarranty.text = _value
                }
            })

            break
        }
    }
    func dismissController() {
        
        self.dismiss(animated: true, completion: {
            
            
        })
    }
    
    func showActionSheet(values : [String], CompletionHandler : @escaping (String?) -> Void) {
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for value in values {
            
            let action = UIAlertAction(title: value, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                
                CompletionHandler(value)
            })
            
            optionMenu.addAction(action)

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}
