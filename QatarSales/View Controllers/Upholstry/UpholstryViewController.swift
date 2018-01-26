//
//  UpholstryViewController.swift
//  QatarSales
//
//  Created by Usman  on 28/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class UpholstryViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var bottomView: BottomViewWithSingleFilterOption!
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func navigateTo(ViewController identifier : String) {
        
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(ViewController identifier : String) {
        
        let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! SortingViewController
        viewController.titleLabel = "Sort"
        viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Location Closet"]
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: true, completion: {
            
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

extension UpholstryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "ReviewsViewController")
        //        navigateTo(ViewController: "CarWashDetailViewController")
        //        navigateTo(ViewController: "CarWashListViewController")
    }
}

extension UpholstryViewController : UITableViewDataSource {
    
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

extension UpholstryViewController : BottomViewWithSingleFilterOptionDelegate {
    
    func BottomViewWithSingleFilterOptionDidSelect(_ bottomView : BottomViewWithSingleFilterOption) {
        
        present(ViewController: "SortingViewController")
    }
}
