//
//  LoanerVC.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class LoanerVC: BaseTableViewVC {
    
    fileprivate let loaners = StoreData.shared.fetchLoaners()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.title = "Loaner"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        
    }
    
//    func addLoaner(){
//        let loaner = Loaner()
//        StoreData.saveLoaner()
//    }
    
    func setupUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(toolsNib, forCellReuseIdentifier: TableCell.tools.identifier)
        tableView.reloadData()

    }

}


//MARK:- UITableViewDataSource
extension LoanerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.loaners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.tools.identifier, for: indexPath) as! ToolsTableCell
        cell.setFriend(from: loaners[indexPath.row])
        return cell
    }
}

extension LoanerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loaner = loaners[indexPath.row]
        let loanerDetailVC = LoanerDetailVC.init(nibName: "BaseTableViewVC", bundle: nil)
        loanerDetailVC.loaner = loaner
        loanerDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(loanerDetailVC, animated: true)
    }
}
