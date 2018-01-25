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
    
    func configure(monument: Monument) {
        nameLabel.text = monument.name
        creationDateLabel.text = getCreationDate(monument.creation)
        descriptionLabel.text = monument.description
        distanceLabel.text = String(describing: monument.distance)
    }
    
    private func getCreationDate(_ date: Date?) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        dateformatter.timeStyle = DateFormatter.Style.short
        guard let date = date else { return "" }
        return dateformatter.string(from: date)
    }
    
}
