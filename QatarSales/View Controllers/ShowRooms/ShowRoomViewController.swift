//
//  ShowRoomViewController.swift
//  QatarSales
//
//  Created by Usman  on 02/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class ShowRoomViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var dataSource : [[String :  String]] = []
    @IBOutlet weak var bottomView: BottomViewWithTwoFilterOptions!

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func navigateTo(ViewController identifier : String) {
        
        let viewController : ShowRoomCarsViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier) as! ShowRoomCarsViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(ViewController identifier : String) {
        
        switch identifier {
        case "":
            let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier)
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        default:
            break
        }
    }
    
    func showActionSheet(title : String?, values : [String], CompletionHandler : @escaping (String?) -> Void) {
        
        let optionMenu = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
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

extension ShowRoomViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "ShowRoomCarsViewController")
    }
    
}

extension ShowRoomViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : CellShowRoom? = tableView.dequeueReusableCell(withIdentifier: "identifierShowRoom") as? CellShowRoom
        
        if (cell == nil) {
            
            cell = Bundle.main.loadNibNamed("CellShowRoom", owner: nil, options: nil)?[0] as? CellShowRoom
            cell?.selectionStyle = .none
            
        }
        
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
}

extension ShowRoomViewController : BottomViewWithTwoFilterOptionsDelegate {
    
    func bottomViewWithTwoFilterOptionsDidSelect(_ bottomView : BottomViewWithTwoFilterOptions, atIndex index : Int) {
        
        switch index {
        case 0:

            showActionSheet(title : "Car Type", values: ["Any", "Both", "New", "Old"], CompletionHandler: {(selectedValue : String?) in
                
            })
            break
        case 1:

            let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: "SortingViewController") as! SortingViewController
            viewController.titleLabel = "Sort"
            viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Location Closet"]
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        default:
            break
        }
        
    }
}

