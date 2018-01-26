//
//  AccessoriesAndServicesViewController.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class AccessoriesAndServicesViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    var dataSource : [String] = ["Car Accessories", "Car Wash/Polish", "Protection/Tint/Wraps", "Upholstry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: "CellMaintenance", bundle:nil), forCellWithReuseIdentifier: "identifierMaintenance")
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
}

extension AccessoriesAndServicesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var viewController = ""
        
        switch indexPath.row {
        case 0:
            viewController = "CarAccessoriesMenuViewController"
            break
            
        case 1:
            viewController = "CarWashViewController"
            break
        case 2:
            viewController = "ProtectionViewController"
            break
        case 3:
            viewController = "UpholstryViewController"
            break
        default:
            break
        }
        navigateTo(ViewController: viewController)
    }
}

extension AccessoriesAndServicesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell : CellMaintenance? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierMaintenance", for: indexPath) as? CellMaintenance
        
        switch indexPath.row {
        case 0:
            cell?.imageview.image = UIImage(named: "carAccessories")
            break
        case 1:
            cell?.imageview.image = UIImage(named: "carWash")
            break
        case 2:
            cell?.imageview.image = UIImage(named: "protection")
            break
        case 3:
            cell?.imageview.image = UIImage(named: "upholstry")
            break
        default:
            break
        }
        
        cell?.lblTitle.text = dataSource[indexPath.row]
        
        return cell!
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}

extension AccessoriesAndServicesViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding =  20
        let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
        return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
    }
}
