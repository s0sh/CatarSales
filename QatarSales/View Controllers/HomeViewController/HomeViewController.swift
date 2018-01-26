//
//  HomeViewController.swift
//  QatarSales
//
//  Created by Usman  on 27/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    let button1 = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action)) // action:#selector(Class.MethodName) for swift 3
    

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource : [HomeDataModel] = [
        HomeDataModel(heading: "Car Sales", imageName: "homeCarSales", selectedImageName : "homeCarSales_Selected", viewControllerIdentifier : "CarSalesViewController"),
                    HomeDataModel(heading: "Show Rooms", imageName: "homeShowRooms", selectedImageName : "homeShowRooms_Selected", viewControllerIdentifier : "ShowRoomViewController"),
                    HomeDataModel(heading: "Car Rentals", imageName: "homeCarRentals", selectedImageName : "homeCarRentals_Selected", viewControllerIdentifier : "CarRentalsViewController"),
                    HomeDataModel(heading: "Taxi Services", imageName: "homeTaxiServices", selectedImageName : "homeTaxiServices_Selected", viewControllerIdentifier : "TaxiServicesViewController"),
                    HomeDataModel(heading: "Maintenance", imageName: "homeMaintenance", selectedImageName : "homeMaintenance_Selected", viewControllerIdentifier : "MaintenanceViewController"),
                    HomeDataModel(heading: "Services & Accessories", imageName: "homeServices", selectedImageName : "homeServices_Selected", viewControllerIdentifier :
                        "AccessoriesAndServicesViewController"),
                    HomeDataModel(heading: "Number Plates", imageName: "homeNumerPlates", selectedImageName : "homeNumerPlates_Selected", viewControllerIdentifier : "NumberPlatesViewController"),
                    HomeDataModel(heading: "Discussion", imageName: "homeDiscussion", selectedImageName : "homeDiscussion_Selected", viewControllerIdentifier : "DiscussionViewController"),
                    HomeDataModel(heading: "About Us", imageName: "homeAboutUs", selectedImageName : "homeAboutUs_Selected", viewControllerIdentifier : "CarSalesViewController")
                                        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationController?.navigationItem.rightBarButtonItems = [item1,item2]
//        navigationController?.navigationItem.rightBarButtonItems = [item1,item2]

//        if revealViewController() != nil {
//            //            revealViewController().rearViewRevealWidth = 62
//            btnMenu.target = revealViewController()
//            btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
//            
//            revealViewController().rightViewRevealWidth = 150
//            btnMenu.target = revealViewController()
//            btnMenu.action = #selector(SWRevealViewController.rightRevealToggle(_:))
//            
//            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
        
        collectionView.register(UINib(nibName: "CellHome", bundle:nil), forCellWithReuseIdentifier: "identifierCellHome")
    }
    
    func playTapped() {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func navigateTo(ViewController identifier : String) {
        
        if (identifier == "CarSalesViewController") {
            
            let viewController : CarSalesViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier) as! CarSalesViewController
            viewController.isComeFromCarSalesViewController = true
            viewController.isComeFrom = .CarSalesViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            
            let viewController : UIViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension HomeViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        dataSource[indexPath.row].state = .normal
        collectionView.reloadItems(at: [indexPath])
        navigateTo(ViewController: dataSource[indexPath.row].viewControllerIdentifier!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        print("didDeselectItemAt")
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        dataSource[indexPath.row].state = .selected
        collectionView.reloadItems(at: [indexPath])

        print("shouldSelectItemAt")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        print("didHighlightItemAt")
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        print("didUnhighlightItemAt")
    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CellHome? = collectionView.dequeueReusableCell(withReuseIdentifier:
            "identifierCellHome", for: indexPath) as? CellHome

        cell?.set(Data: dataSource[indexPath.row])
        return cell!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
//        return CGSize(width: 108, height: 108)
        
        let size = Utilities.HelpingMethods.get(RelativeHeight: 108)
        return CGSize(width: size.height, height: size.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//    
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//    }
}


