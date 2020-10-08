//
//  BaseTableViewVC.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class BaseTableViewVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var toolsNib: UINib? {
        return UINib(nibName: TableCell.tools.nibName, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
    }
    
    func configNavigationBar(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
