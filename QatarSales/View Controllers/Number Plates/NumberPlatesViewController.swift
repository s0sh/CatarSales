//
//  NumberPlatesViewController.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class NumberPlatesViewController: UIViewController {
    
    @IBOutlet weak var bottomView: BottomViewWithThreeFilterOptions!
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: "CellNumberPlate", bundle:nil), forCellWithReuseIdentifier: "identifierNumberPlate")
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
        
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: identifier)
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: true, completion: {
            
        })
    }
}

extension NumberPlatesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "NumberPlateDetailViewController")
    }
}

extension NumberPlatesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 40
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell : CellNumberPlate? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierNumberPlate", for: indexPath) as? CellNumberPlate
        
        return cell!
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}

extension NumberPlatesViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding =  20
        let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
        return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
    }
}

extension NumberPlatesViewController : BottomViewWithThreeFilterOptionsDelegate {
    
    func bottomViewWithThreeFilterOptionDidSelect(_ bottomView: BottomViewWithThreeFilterOptions, atIndex index: Int) {
        
        switch index {
        case 0:
            present(ViewController: "FilterSixViewController")
            break
        case 1:
            
            navigateTo(ViewController: "AddNumberPlateViewController")
            
            break
        case 2:
            
            let viewController : SortingViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.secondaryStoryboard, WithIdentifier: "SortingViewController") as! SortingViewController
            viewController.titleLabel = "Sort"
            viewController.dataSource = ["Any", "Most Liked Today", "Most Liked This Week", "Most Liked This Month", "Most Viewed Today", "Most Viewed This Week", "Most Viewed This Month", "Price Today High To Low", "Price This Week High To Low", "Price This Month High To Low", "Price Today Low To High", "Price This Week Low To High", "Price This Month Low To High"]

            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true, completion: {
                
            })
            break
        default:
            break
        }
    }
}
