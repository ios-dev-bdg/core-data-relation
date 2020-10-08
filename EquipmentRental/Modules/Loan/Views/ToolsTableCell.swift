//
//  ToolsTableCell.swift
//  EquipmentRental
//
//  Created by topik mujianto on 06/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class ToolsTableCell: UITableViewCell {

    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTool(from tool: Tool?){
        guard let data = tool else { return }
        
        self.nameLabel.text = data.name
        self.iconImageView.image = UIImage(named: data.imageName ?? "")
        
        let string = NSMutableAttributedString(string: "Item count : \(tool?.itemCount ?? 0) \nBorrowed : \(tool?.borrowed ?? 0)\nAvailable: \(tool?.available ?? 0)")
        let attributedText = Helper.paragraph(string)
        self.itemCountLabel.attributedText = attributedText

    }
    
    func setFriend(from friend: Loaner?){
        guard let data = friend else { return }
        
        self.itemCountLabel.isHidden = true
        self.nameLabel.text = data.name
        self.iconImageView.image = UIImage(named: "icn_loaner_off")
    }
    
    func setLoan(from loan: Loan){
        let attributedText = NSMutableAttributedString(string: "Date : \(Helper.date(from: loan.date)) \nItem count : \(loan.totalItem)")
        
        self.itemCountLabel.attributedText = Helper.paragraph(attributedText)
        self.nameLabel.text = loan.tool?.name
        self.iconImageView.image = UIImage(named: loan.tool?.imageName ?? "")
    }
    
}
