//
//  MonumentTableViewCell.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit

class MonumentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func configure(monument: Monument) {
        nameLabel.text = monument.name
        creationDateLabel.text = monument.creation?.getCreationDateString
        descriptionLabel.text = monument.description
        distanceLabel.text = String(describing: monument.distance)
        typeLabel.text = monument.type
    }
    
    
}
