//
//  BreakDownServicesListViewController.swift
//  QatarSales
//
//  Created by Usman  on 18/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class BreakDownServicesListViewController: UIViewController {

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
    

    func navigateTo(ViewController identifier : String) {
        
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func present(ViewController identifier : String) {
        
        switch identifier {
        case "FilterTwoViewController":
            let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier)
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case "SortingViewController":
            let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! SortingViewController
            
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

extension BreakDownServicesListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "BreakDownServicesViewController")
    }
}

extension BreakDownServicesListViewController : UITableViewDataSource {
    
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

extension BreakDownServicesListViewController : BottomViewWithTwoFilterOptionsDelegate {
    
    func bottomViewWithTwoFilterOptionsDidSelect(_ bottomView : BottomViewWithTwoFilterOptions, atIndex index : Int) {
        
        switch index {
        case 0:
            
            present(ViewController: "FilterTwoViewController")
            break
        case 1:
            present(ViewController: "SortingViewController")
            break
        default:
            break
        }
        
    }
}
