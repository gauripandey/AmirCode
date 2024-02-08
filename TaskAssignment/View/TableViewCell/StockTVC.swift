//
//  StockTVC.swift
//  TaskAssignment
//
//

import UIKit

class StockTVC: UITableViewCell {
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblExc: UILabel!
    @IBOutlet weak var lblOpen: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var viewSub: UIView!{
        didSet{
            viewSub.layer.cornerRadius = 8
            viewSub.layer.borderWidth = 0.1
            viewSub.backgroundColor = .lightGray
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
