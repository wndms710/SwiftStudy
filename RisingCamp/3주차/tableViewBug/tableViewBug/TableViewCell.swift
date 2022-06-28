//
//  TableViewCell.swift
//  tableViewBug
//
//  Created by 조주은 on 2022/06/28.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var mainVC: ViewController?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileText: UILabel!
    @IBOutlet weak var mySwitch: UISwitch! {
        didSet {
            mySwitch.isOn = false
        }
    }
    @IBAction func switchValueChanged(_ sender: Any) {
        mainVC?.updateSwitch(self, mySwitch.isOn)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mySwitch.isOn = false
    }
    
    
}
