//
//  ReviewsViewController.swift
//  QatarSales
//
//  Created by Usman  on 17/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReviewsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 330
        case 1:
            return UITableViewAutomaticDimension
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 330
        case 0:
            return 44
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ReviewsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            var cell : CellCarWash? = tableView.dequeueReusableCell(withIdentifier: "identifierCarWash") as? CellCarWash
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellCarWash", owner: nil, options: nil)?[0] as? CellCarWash
                cell?.selectionStyle = .none
            }
            
            cell?.backgroundColor = UIColor.clear
            return cell!
        case 1:
            var cell : CellCarWashDescription? = tableView.dequeueReusableCell(withIdentifier: "identifierCarWashDescription") as! CellCarWashDescription?
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellCarWashDescription", owner: nil, options: nil)?[0] as? CellCarWashDescription
                cell?.selectionStyle = .none
            }
            
            cell?.lblDescription.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular"
            
            return cell!
        case 2:
            var cell : CellReviews? = tableView.dequeueReusableCell(withIdentifier: "identifierReviews") as! CellReviews?
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellReviews", owner: nil, options: nil)?[0] as? CellReviews
                cell?.selectionStyle = .none
            }
            
            return cell!
        default:
            
            
            var cell : CellChatBubble? = tableView.dequeueReusableCell(withIdentifier: "identifierBubbleChat") as! CellChatBubble?
            
            if (cell == nil) {
                
                cell = Bundle.main.loadNibNamed("CellChatBubble", owner: nil, options: nil)?[0] as? CellChatBubble
                cell?.selectionStyle = .none
            }
            
            return cell!
        }
        
    }
}

