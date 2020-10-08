//
//  ToolsVC.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

@objcMembers class ToolsVC: BaseTableViewVC {
    
    fileprivate var tools = [Tool]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Tools"
        self.tools = StoreData.shared.fetchTools()
        self.tableView.reloadData()
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
    }
}


//MARK:- UITableViewDataSource
extension ToolsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.tools.identifier, for: indexPath) as! ToolsTableCell
        cell.setTool(from: tools[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension ToolsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tool = self.tools[indexPath.row]
        if tool.available != 0 {
            Alert.loanInput(vc: self, completionHandler: { loanName, loanAmount in
                if let name = loanName, let amount = loanAmount {
                    let loan = Loan(totalItem: amount)
                    
                    // Fetch name from input
                    guard let loaner = StoreData.shared.fetchLoaner(from: name) else {
                        Alert.showMessage(vc: self, title: "Info", message: "Name not found")
                        return
                    }
                    
                    // Save loan when loaner isn't null
                    StoreData.shared.saveLoan(loan: loan, tool: tool, loaner: loaner) { message in
                        Alert.showMessage(vc: self, title: "Info", message: message) {
                            self.tools = StoreData.shared.fetchTools()
                            self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: .automatic)
                        }
                    }
                }
                else {
                    Alert.showMessage(vc: self, title: "Please", message: "Input name & amount")
                }
            })
        }
        else {
            Alert.showMessage(vc: self, title: "Info", message: "Item not available")
        }
    }
}
