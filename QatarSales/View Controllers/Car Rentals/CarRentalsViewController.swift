//
//  CarRentalsViewController.swift
//  QatarSales
//
//  Created by Usman  on 02/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarRentalsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var bottomViewSortBy: BottomViewWithSingleFilterOption!
    @IBOutlet weak var bottomView: BottomViewWithTwoOptions!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var viewCompanies: UIView!
    @IBOutlet weak var viewCars: UIView!
    @IBOutlet weak var bottomViewFilters: BottomViewWithTwoFilterOptions!
    var isCompaniesShowing = false

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")

        
        bottomViewSortBy.delegate = self
        bottomViewFilters.delegate = self
        bottomView.delegate = self
        
        collectionview.delegate = self
        collectionview.dataSource = self
        showCompanies()
        
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
    
    func showCompanies () {
        
        if isCompaniesShowing {
            
            return
        }
        
        isCompaniesShowing = true
        viewCars.isHidden = true
        viewCompanies.isHidden = false
        bottomView.optionFirst.setSelectedState()
        bottomView.optionSecond.setUnselectedState()
    }

    func showCars () {
        
        if !isCompaniesShowing {
            
            return
        }
        
        isCompaniesShowing = false
        viewCompanies.isHidden = true
        viewCars.isHidden = false
        bottomView.optionFirst.setUnselectedState()
        bottomView.optionSecond.setSelectedState()
        
        collectionview.reloadData()
        
    }

}

extension CarRentalsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "CarRentalListViewController")
    }
    
}

extension CarRentalsViewController : UITableViewDataSource {
    
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

extension CarRentalsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "CarSalesDetailViewController")
    }
}

extension CarRentalsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 40
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell : CellCarSales? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierCareSales", for: indexPath) as? CellCarSales
        
        return cell!
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}

extension CarRentalsViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding =  20
        let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
        return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
        
        //        let size = Constants.Screen.Screen_Size.width
        //        let width = size/2 - 40
        //        let height = Utilities.HelpingMethods.get(RelativeHeight: 140).height
        //        return CGSize(width: width, height: height)
    }
}

extension CarRentalsViewController : BottomViewWithTwoFilterOptionsDelegate {
    
    func bottomViewWithTwoFilterOptionsDidSelect(_ bottomView : BottomViewWithTwoFilterOptions, atIndex index : Int) {
        
        switch index {
        case 0:
            
            let viewController : FilterOneViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: "FilterOneViewController") as! FilterOneViewController
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case 1:

            let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: "SortingViewController") as! SortingViewController
            viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Price Today High To Low", "Price This Week High To Low", "Price This Month High To Low", "Price Today Low To High", "Price This Week Low To High", "Price This Month Low To High"]
            viewController.titleLabel = "Sorts"
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        default:
            break
        }
    }
}

extension CarRentalsViewController : BottomViewWithSingleFilterOptionDelegate {
    
    func BottomViewWithSingleFilterOptionDidSelect(_ bottomView : BottomViewWithSingleFilterOption) {
        
        let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: "SortingViewController") as! SortingViewController
        viewController.titleLabel = "Sort"
        viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Location Closet"]
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: true, completion: {
            
        })
    }
}

extension CarRentalsViewController : BottomViewWithTwoOptionsDelegate {
    
    func bottomViewWithTwoOptionsDidSelect(_ bottomView : BottomViewWithTwoOptions, atIndex index : Int) {
        
        switch index {
        case 0:
            showCompanies()
            break
        case 1:
            showCars()
            break
        default:
            break
        }
        
    }
}
