//
//  CatCell.swift
//  CatApi
//
//  Created by Admin on 09/10/24.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var urlLable: UILabel!
    @IBOutlet weak var widthLable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
