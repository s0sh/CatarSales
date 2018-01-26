//
//  CarAccessoriesShopViewController.swift
//  QatarSales
//
//  Created by Usman  on 28/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarAccessoriesShopViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var bottomView: BottomViewWithTwoFilterOptions!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        bottomView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func navigateTo(ViewController identifier : String) {
        
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(ViewController identifier : String) {
        
        switch identifier {
        case "FilterFourViewController":
            let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier)
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case "SortingViewController":
            let viewController :  SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! SortingViewController
            
            viewController.titleLabel = "Type"
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

extension CarAccessoriesShopViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "CarAccessoriesShopDetailViewController")
//        navigateTo(ViewController: "SparePartsShopDetailViewController")
    }
}

extension CarAccessoriesShopViewController : UITableViewDataSource {
    
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

extension CarAccessoriesShopViewController : BottomViewWithTwoFilterOptionsDelegate {
    
    func bottomViewWithTwoFilterOptionsDidSelect(_ bottomView : BottomViewWithTwoFilterOptions, atIndex index : Int) {
        
        switch index {
        case 0:
            
            present(ViewController: "FilterFourViewController")
            break
        case 1:
            present(ViewController: "SortingViewController")
            break
        default:
            break
        }
        
    }
}

