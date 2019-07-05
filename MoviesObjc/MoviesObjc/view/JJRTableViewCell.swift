//
//  JJRTableViewCell.swift
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class JJRTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
