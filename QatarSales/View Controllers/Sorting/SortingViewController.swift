//
//  SortingViewController.swift
//  QatarSales
//
//  Created by Usman  on 23/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class SortingViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var dataSource : [String] = ["option", "option", "option", "option", "option", "option"]
//    var dataSource : [String] = []
    var selectedIndex : Int = -1
    @IBOutlet weak var lblTitle: UILabel!
    var titleLabel : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        lblTitle.text = titleLabel
        tableview.dataSource = self
        tableview.delegate = self
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    @IBAction func btnDone(_ sender: Any) {
        
        dismissController()
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        dismissController()
    }
    
    func dismissController() {
        
        self.dismiss(animated: true, completion: {
            
            
        })
    }
    
}

extension SortingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (selectedIndex == -1) {

            selectedIndex = indexPath.row
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        } else {

            let previousIndex = IndexPath(row: selectedIndex, section: 0)
            selectedIndex = indexPath.row
            tableView.reloadRows(at: [indexPath, previousIndex], with: .automatic)
        }
    }
    
}

extension SortingViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "identifierSorting")
        
        if (cell == nil) {

            cell = UITableViewCell(style: .default, reuseIdentifier: "identifierSorting")
        }
        
        if (indexPath.row == selectedIndex) {
            
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
