//
//  FilterSixViewController.swift
//  QatarSales
//
//  Created by Usman  on 23/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class FilterSixViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var dataSource : [String] = ["3", "4", "5", "6"]
    var selectedValues : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func dismissController() {
        
        self.dismiss(animated: true, completion: {
            
            
        })
    }
    
    @IBAction func btnApply(_ sender: Any) {
        
        dismissController()
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        dismissController()
    }
}

extension FilterSixViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let _index = selectedValues.index(of: dataSource[indexPath.row]) {
            
            selectedValues.remove(at: _index)
            
        } else {
            
            selectedValues.append(dataSource[indexPath.row])
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension FilterSixViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "identifierFilterSix")
        
        if (cell == nil) {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "identifierFilterSix")
        }
        
        if selectedValues.index(of: dataSource[indexPath.row]) != nil {
            
            cell?.accessoryType = .checkmark
        } else {
            
            cell?.accessoryType = .none
        }
        
        cell?.textLabel?.text = dataSource[indexPath.row]
        cell?.textLabel?.font = Utilities.HelpingMethods.set(Font: Constants.Fonts.Raleway.regular, WithSize: 12.0)
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
}

