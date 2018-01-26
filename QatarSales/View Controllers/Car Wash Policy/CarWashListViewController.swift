//
//  CarWashListViewController.swift
//  QatarSales
//
//  Created by Usman  on 13/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarWashListViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.register(UINib(nibName: "CellShowRoomDetail", bundle:nil), forCellWithReuseIdentifier: "identifierShowRoomDetail")
        
        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")
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
}

extension CarWashListViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (indexPath.row == 0) {
            
            return
        }
        
        navigateTo(ViewController: "CarWashDetailViewController")
    }
}

extension CarWashListViewController : UICollectionViewDataSource {
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
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
    }
}

extension CarWashListViewController : UICollectionViewDelegateFlowLayout {
    
    
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
    }
}
