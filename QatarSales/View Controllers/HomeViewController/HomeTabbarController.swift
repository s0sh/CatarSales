//
//  HomeTabbarController.swift
//  QatarSales
//
//  Created by Usman  on 28/02/2017.
//  Copyright © 2017 Usman . All rights reserved.
//

import UIKit

class HomeTabbarController: UITabBarController {
    
    //MARK:- Data Members
    var homeViewController: HomeViewController {
        
        let viewController : HomeViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard , WithIdentifier: "HomeViewController") as! HomeViewController

        let tabbar = UITabBarItem(title: "HOME", image: UIImage(named: "tabHome")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabHomeSelected"))
        let attributesNormal = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.black]
        let attributesSelected = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.white]
        
        tabbar.setTitleTextAttributes(attributesNormal, for: .normal)
        tabbar.setTitleTextAttributes(attributesSelected, for:.selected)
        viewController.tabBarItem = tabbar
        return viewController
    }
    
    var watchListViewController: WatchListViewController {
        
        let viewController : WatchListViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard , WithIdentifier: "WatchListViewController") as! WatchListViewController
        
        let tabbar = UITabBarItem(title: "WATCHLIST", image: UIImage(named: "tabWatchList")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabWatchListSelected"))
        let attributesNormal = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.black]
        let attributesSelected = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.white]
        tabbar.setTitleTextAttributes(attributesNormal, for: .normal)
        tabbar.setTitleTextAttributes(attributesSelected, for:.selected)
        viewController.tabBarItem = tabbar
        return viewController
    }
    
    var myAddViewController: MyAddViewController {
        
        let viewController : MyAddViewController = Utilities.Storyboard.getControllerFrom(Stroyboard: Constants.Storyboards.mainStoryboard , WithIdentifier: "MyAddViewController") as! MyAddViewController
        
        let tabbar = UITabBarItem(title: "MY ADD", image: UIImage(named: "tabMyAdd")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabMyAddSelected"))
        
        let attributesNormal = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.black]
        let attributesSelected = [NSFontAttributeName:UIFont(name: "Raleway-Medium", size: 12) , NSForegroundColorAttributeName: UIColor.white]
        tabbar.setTitleTextAttributes(attributesNormal, for: .normal)
        tabbar.setTitleTextAttributes(attributesSelected, for:.selected)
        viewController.tabBarItem = tabbar
        return viewController
    }


    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
        
        navigationController?.navigationBar.barTintColor = UIColor.navigationBackgroundColor
        let btn1 = UIButton(type: .custom)
        //        btn1.setImage(UIImage(named: "menu"), for: .normal)
        btn1.setTitle("BackButton", for: .normal)
        btn1.setTitleColor(UIColor.blue, for: .normal)
        btn1.frame = CGRect(x: 0, y: 10, width: 80, height: 64)
        //        btn1.addTarget(self, action: #selector(Class.Methodname), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        let btn2 = UIButton(type: .custom)
        //        btn2.setImage(UIImage(named: "imagename"), for: .normal)
        btn1.setTitle("Btn1", for: .normal)
        btn1.setTitleColor(UIColor.blue, for: .normal)
        
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //        btn2.addTarget(self, action: #selector(Class.MethodName), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)

        self.tabBarController?.navigationItem.leftBarButtonItem = item1

//        self.navigationItem.setRightBarButtonItems([item1,item2], animated: true)
//        navigationController?.navigationItem.rightBarButtonItems = [item1,item2]

        
        viewControllers = [homeViewController, watchListViewController, myAddViewController]
        setSelected(Tabbar: self.tabBar)
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func setSelected(Tabbar _tabbar : UITabBar) {
        
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        
        // remove default border
        _tabbar.frame.size.width = self.view.frame.width + 4
        _tabbar.frame.origin.x = -2
        _tabbar.tintColor = UIColor.white
        _tabbar.selectionIndicatorImage = UIImage().getImageFrom(Color: UIColor.navigationBackgroundColor, AndSize: tabBarItemSize)
    }
}

extension HomeTabbarController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        setSelected(Tabbar: tabBarController.tabBar)
    }

}
