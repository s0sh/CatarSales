//
//  ShowRoomDetailViewController.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class ShowRoomDetailViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var dataSource : [[String :  String]] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.estimatedRowHeight = 44.0
        tableview.rowHeight = UITableViewAutomaticDimension
        
        setDatasource()
        tableview.reloadData()
    }
    
    //MARK:- Setter
    
    func setDatasource() {
        
        dataSource.append([ "key" : "Manufacture", "value" : "Farrari" ])
        dataSource.append([ "key" : "Model", "value" : "570 S" ])
        dataSource.append([ "key" : "Year", "value" : "2014" ])
        dataSource.append([ "key" : "Mileage", "value" : "42,000km" ])
        dataSource.append([ "key" : "Transmission", "value" : "Automatic" ])
        dataSource.append([ "key" : "Cylinders", "value" : "8" ])
        dataSource.append([ "key" : "Warranty", "value" : "Yes" ])
        dataSource.append([ "key" : "Color", "value" : "Black" ])
        dataSource.append([ "key" : "Color", "value" : "Black" ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension ShowRoomDetailViewController : UITableViewDelegate {
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ShowRoomDetailViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataSource.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == (dataSource.count - 1 )) {
            
            var cell : CellCarSalesDetailDescription? = tableView.dequeueReusableCell(withIdentifier: "identifierDescription") as! CellCarSalesDetailDescription?
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellCarSalesDetailDescription", owner: nil, options: nil)?[0] as? CellCarSalesDetailDescription
            }
            
            cell?.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            cell?.lblDescription.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular "
            
            return cell!
            
        } else {
            
            var cell : CellCarSalesDetail? = tableView.dequeueReusableCell(withIdentifier: "identifierCarSalesDeatil") as? CellCarSalesDetail
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellCarSalesDetail", owner: nil, options: nil)?[0] as? CellCarSalesDetail
            }
            
            cell?.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            
            let object : [ String : String ] = dataSource[indexPath.row]
            
            cell?.lblHeading.text = object["key"]
            cell?.lblText.text = object["value"]
            
            return cell!
        }
    }
    
}

