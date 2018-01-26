//
//  CarRentalListViewController.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarRentalListViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")
        collectionview.register(UINib(nibName: "CellShowRoomDetail", bundle:nil), forCellWithReuseIdentifier: "identifierShowRoomDetail")
        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func navigateTo(ViewController identifier : String) {
        
        let viewController : CarRentalDetailViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier) as! CarRentalDetailViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CarRentalListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 40
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.row == 0) {
            
            let cell : CellShowRoomDetail? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierShowRoomDetail", for: indexPath) as? CellShowRoomDetail
            
            return cell!
        } else {
            
            let cell : CellCarSales? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierCareSales", for: indexPath) as? CellCarSales
            
            return cell!
        }
//        let cell : CellCarSales? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierCareSales", for: indexPath) as? CellCarSales
//        
//        return cell!
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}

extension CarRentalListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "CarRentalDetailViewController")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (indexPath.row == 0) {
            
            let padding =  0
            let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
            return CGSize(width: CGFloat(collectionViewSize), height: CGFloat(collectionViewSize))
        } else {
            
            let padding =  20
            let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
            return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
        }
        
//        let padding =  20
//        let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
//        return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
    }
}
