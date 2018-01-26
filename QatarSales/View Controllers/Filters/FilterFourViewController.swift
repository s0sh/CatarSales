//
//  FilterFourViewController.swift
//  QatarSales
//
//  Created by Usman  on 23/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class FilterFourViewController: UIViewController {

    @IBOutlet weak var txtFor: UITextField!
    @IBOutlet weak var txtType: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func dismissController() {
        
        self.dismiss(animated: true, completion: {
            
            
        })
    }
    
    @IBAction func btnDropDown(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            showActionSheet(values: ["Any", "Interior", "Exterior", "Other"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtFor.text = _value
                }
            })
            break
        case 1:
            showActionSheet(values: ["Any", "General Accessories", "Body Kits", "Spoilers", "Exhausts", "Suspension", "Tuning", "Cleaning Equipement", "Electronic", "Rims", "Lighting"], CompletionHandler: {(selectedValue : String?) in
                
                if let _value = selectedValue {
                    
                    self.txtType.text = _value
                }
            })
            break
        default:
            break
        }
        
        
    }
    @IBAction func btnApply(_ sender: Any) {
        
        dismissController()
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        dismissController()
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
