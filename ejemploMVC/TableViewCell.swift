//
//  TableViewCell.swift
//  ejemploMVC
//
//  Created by Salvador Lopez on 10/09/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var titulo: UILabel!
  @IBOutlet weak var content: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
