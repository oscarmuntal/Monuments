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
        descriptionLabel.text = description(monument.description)
        distanceLabel.text = distance(monument.distance)
        typeLabel.text = monument.type
    }
    
    private func description(_ description: String) -> String {
        if description == "" {
            return "(This monument has no description)"
        }
        return description
    }
    
    private func distance(_ distance: String) -> String {
        if String(describing: distance) == "" {
            return "(This monument has no distance parameter)"
        }
        return String(describing: distance)
    }
    
}
