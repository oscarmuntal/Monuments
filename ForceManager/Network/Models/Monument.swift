//
//  Monument.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

class Monument {
    
    var name = ""
    var creation: Date?
    var description = ""
    var position: CLLocation?
    var distance = ""
    
    init(name: String, description: String, position: CLLocation, userLocation: CLLocation) {
        self.name = name
        self.creation = Date()
        self.description = description
        self.position = position
        self.distance = getDistanceFromUser(position: position, userLocation: userLocation)
    }
    
    private func getDistanceFromUser(position: CLLocation, userLocation: CLLocation) -> String {
        let distanceInMeters = position.distance(from: userLocation)
        return "\(distanceWithTwoDecimals(distanceInMeters)) meters"
    }
    
    private func distanceWithTwoDecimals(_ distanceInMeters: CLLocationDistance) -> CLLocationDistance {
        return Double(round(100*distanceInMeters)/100)
    }
        
}
