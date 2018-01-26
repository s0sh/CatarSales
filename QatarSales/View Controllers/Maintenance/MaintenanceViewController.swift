//
//  MaintenanceViewController.swift
//  QatarSales
//
//  Created by Usman  on 05/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class MaintenanceViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    let dataSource : [String] = ["Garages", "Spare Parts", "Inspection Shops", "BreakDown Services"]
    
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

extension MaintenanceViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var viewController = ""
        
        switch indexPath.row {
        case 0:
            viewController = "GarageViewController"
            break
        case 1:
            viewController = "SparePartsMenuViewController"
//            viewController = "GarageViewController"
            break
        case 2:
            viewController = "GarageViewController"
            break
        case 3:
            viewController = "BreakDownServicesListViewController"
            break
        default:
            break
        }
        
        navigateTo(ViewController: viewController)
    }
}

extension MaintenanceViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CellMaintenance? = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierMaintenance", for: indexPath) as? CellMaintenance
        
        switch indexPath.row {
        case 0:
            cell?.imageview.image = UIImage(named: "garage")
            break
        case 1:
            cell?.imageview.image = UIImage(named: "spareParts")
            break
        case 2:
            cell?.imageview.image = UIImage(named: "inspectionShops")
            break
        case 3:
            cell?.imageview.image = UIImage(named: "breakDownServices")
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

extension MaintenanceViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding =  20
        let collectionViewSize = collectionview.frame.size.width - CGFloat(padding)
        return CGSize(width: CGFloat(collectionViewSize/2), height: CGFloat(collectionViewSize/2))
    }
}
