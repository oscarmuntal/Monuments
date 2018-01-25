//
//  Monument.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import SwiftyJSON

class Monument {
    
    var name = ""
    var creation: Date?
    var description = ""
    var position: CLLocationCoordinate2D?
    var distance: Int?
    
    init(data: JSON) {
        self.name = data["name"].stringValue
        self.creation = Date()
        self.description = data["description"].stringValue
        //TODO: Set position and distance values
    }
        
}
