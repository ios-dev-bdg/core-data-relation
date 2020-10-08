//
//  LoanerDetailVC.swift
//  EquipmentRental
//
//  Created by topik mujianto on 08/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class LoanerDetailVC: BaseTableViewVC {

    var loaner: Loaner?
    var loans = [Loan]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = loaner?.name
        self.updateLoans()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(toolsNib, forCellReuseIdentifier: TableCell.tools.identifier)
        tableView.reloadData()
    }
    
    func updateLoans(){
        let predicate = NSPredicate(format: "loaner == %@", loaner!)
        self.loans = StoreData.shared.fetchLoans(filter: predicate)
    }
}

//MARK:- UITableViewDataSource
extension LoanerDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.tools.identifier, for: indexPath) as! ToolsTableCell
        cell.setLoan(from: loans[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension LoanerDetailVC: UITableViewDelegate {
    func deleteSelectedItem(indexPath: IndexPath){
        let loan = loans[indexPath.row]
        StoreData.shared.deleteLoan(from: loan.id)
        
        self.updateLoans()
        self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Alert.showQuestion(vc: self, title: "", message: "Mark item as returned?", okAction: { action in
            DispatchQueue.main.async {
                self.deleteSelectedItem(indexPath: indexPath)
            }
        })
    }
}
