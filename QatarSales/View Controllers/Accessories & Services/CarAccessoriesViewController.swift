//
//  CarAccessoriesViewController.swift
//  QatarSales
//
//  Created by Usman  on 18/03/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class CarAccessoriesViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionview.register(UINib(nibName: "CellCarSales", bundle:nil), forCellWithReuseIdentifier: "identifierCareSales")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigateTo(ViewController identifier : String) {
        
        let viewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard, WithIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
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

extension CarAccessoriesViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigateTo(ViewController: "ReviewsViewController")
    }
}

extension CarAccessoriesViewController : UICollectionViewDataSource {
    
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

extension CarAccessoriesViewController : UICollectionViewDelegateFlowLayout {
    
    
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
