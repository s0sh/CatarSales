//
//  DiscussionViewController.swift
//  QatarSales
//
//  Created by Usman  on 12/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class DiscussionViewController: UIViewController {

    @IBOutlet weak var bottomView: BottomViewWithThreeFilterOptions!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomView.delegate = self
//        identifierDiscussion

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
        viewController.dataSource = ["Any", "Latest", "Most Commented Today", "Most Commented This Week", "Most Commented This Month", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month"]
        
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

extension DiscussionViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 106
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension DiscussionViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : CellDiscussionChat? = tableView.dequeueReusableCell(withIdentifier: "identifierDiscussionChat") as? CellDiscussionChat
        
        if (cell == nil) {
            
            cell = Bundle.main.loadNibNamed("CellDiscussionChat", owner: nil, options: nil)?[0] as? CellDiscussionChat
            
            cell?.selectionStyle = .none
            
        }
        
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        cell?.backgroundColor = UIColor.clear
        return cell!
    }
}

extension DiscussionViewController : BottomViewWithThreeFilterOptionsDelegate {
    
    func bottomViewWithThreeFilterOptionDidSelect(_ bottomView: BottomViewWithThreeFilterOptions, atIndex index: Int) {
        
        switch index {
        case 0:
            
            showActionSheet(values: ["Any", "General Discussion", "Questions transportation", "New Cars", "Traffic Laws"], CompletionHandler: {(selectedValue : String?) in
                
//                if let _value = selectedValue {
//                    
//                    //self.txtWarranty.text = _value
//                }
            })

            //present(ViewController: "SortingViewController")
            
            break
        case 1:
            
            navigateTo(ViewController: "AddDiscussionViewController")
            break
        case 2:
            present(ViewController: "SortingViewController")
            break
        default:
            break
        }
    }
}


