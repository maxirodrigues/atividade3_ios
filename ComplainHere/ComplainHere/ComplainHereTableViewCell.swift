//
//  ComplainHereTableViewCell.swift
//  ComplainHere
//
//  Created by User on 03/01/2022.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class ComplainHereTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    func configureWith(_ complainHere: Complain){
        
        labelName.text = complainHere.name
        labelDate.text = complainHere.date
    }

}


