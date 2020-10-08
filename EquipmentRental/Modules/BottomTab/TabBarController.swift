//
//  TabBarController.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

}


//MARK:- HELPER
extension TabBarController {
    func setupUI(){
        let toolsVC = ToolsVC.init(nibName: "BaseTableViewVC", bundle: nil)
        toolsVC.tabBarItem = UITabBarItem(title: "Tools", image: UIImage(named: "icn_toolbox_off"), selectedImage: UIImage(named: "icn_toolbox_off"))
        let navTools = UINavigationController(rootViewController: toolsVC)

        let loanerVC = LoanerVC.init(nibName: "BaseTableViewVC", bundle: nil)
        loanerVC.tabBarItem = UITabBarItem(title: "Loaner", image: UIImage(named: "icn_loaner_off"), selectedImage: UIImage(named: "icn_loaner_on"))
        let navLoaner = UINavigationController.init(rootViewController: loanerVC)
        
        self.viewControllers = [navTools, navLoaner]
        self.tabBar.tintColor = #colorLiteral(red: 0.1415971518, green: 0.7343551517, blue: 0.8316030502, alpha: 1)
//        self.delegate = self
    }
}

////MARK:- UITabBarControllerDelegate
//extension TabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if viewController is UINavigationController {
//          (viewController as! UINavigationController).popToRootViewController(animated: true)
//        } else {
//          viewController.navigationController?.popToRootViewController(animated: true)
//        }
//    }
//}
