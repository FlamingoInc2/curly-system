//
//  StockTableViewCell.swift
//  Finance
//
//  Created by Steven Solo on 12/6/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {


    @IBOutlet weak var CompName: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var compLogo: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
