//
//  TableViewCell.swift
//  demoSeachBar
//
//  Created by BAC Vuong Toan (VTI.Intern) on 12/9/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpData(data: String)  {
        lblText.text = data
    }
    
}
