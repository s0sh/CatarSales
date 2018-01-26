//
//  CarSalesViewController.swift
//  QatarSales
//
//  Created by Usman  on 01/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarSalesViewController: ParentViewController {

    @IBOutlet weak var bottomView: BottomViewWithThreeFilterOptions!
    @IBOutlet weak var collectionview: UICollectionView!
    var isComeFromCarSalesViewController : Bool = false
    var isComeFrom : viewControllersOptions = viewControllersOptions.CarSalesViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")
        bottomView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func navigateTo(ViewController identifier : String) {
     
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(ViewController identifier : String) {
        
        switch identifier {
        case "SortingViewController":
            
            let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! SortingViewController
            viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Price Today High To Low", "Price This Week High To Low", "Price This Month High To Low", "Price Today Low To High", "Price This Week Low To High", "Price This Month Low To High"]
            viewController.titleLabel = "Sorts"
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case "FilterOneViewController":
            
            let viewController : FilterOneViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! FilterOneViewController
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case "FilterThreeViewController":
            
            let viewController : FilterThreeViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! FilterThreeViewController
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        case "FilterFourViewController":
            
            let viewController : FilterFourViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier) as! FilterFourViewController
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break

        default:
            break
        }
    }
}

extension CarSalesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "CarSalesDetailViewController")
    }
}

extension CarSalesViewController : UICollectionViewDataSource {
    
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

extension CarSalesViewController : UICollectionViewDelegateFlowLayout {
    
    
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

extension CarSalesViewController : BottomViewWithThreeFilterOptionsDelegate {

    func bottomViewWithThreeFilterOptionDidSelect(_ bottomView: BottomViewWithThreeFilterOptions, atIndex index: Int) {
        
        switch index {
        case 0:
            
            switch isComeFrom {
            case .CarSalesViewController:
                present(ViewController: "FilterOneViewController")
                break
            case .CarAccessoriesMenuViewController:
                present(ViewController: "FilterFourViewController")
                break
            default:
                present(ViewController: "FilterThreeViewController")
                break
            }
            
//            if (isComeFromCarSalesViewController) {
//                
//                present(ViewController: "FilterOneViewController")
//            } else {
//                
//                present(ViewController: "FilterThreeViewController")
//            }
            break
        case 1:
            
            switch isComeFrom {
            case .CarSalesViewController:
                navigateTo(ViewController: "AddCarSalesViewController")
                break
            default:
                navigateTo(ViewController: "AddCarAccessoriesViewController")
                break
            }

//            if (isComeFromCarSalesViewController) {
//                
//                navigateTo(ViewController: "AddCarSalesViewController")
//            } else {
//                
//                navigateTo(ViewController: "AddCarAccessoriesViewController")
//            }
            break
        case 2:
            
            present(ViewController: "SortingViewController")
            break
        default:
            break
        }
    }
}
