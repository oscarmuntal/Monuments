//
//  MonumentsInteractor.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation

class MonumentsInteractor: Interactor {
    
    //temporary method for fake initial test
    func generateMonuments(_ currentLocation: CLLocation) -> [Monument] {
        var monuments: [Monument] = []
        
        let columbusPosition: CLLocation = CLLocation(latitude: 41.3758075, longitude: 2.1777689)
        let columbusMonument = Monument(name: "Columbus Monument", description: "Columbus Description....", position: columbusPosition, userLocation: currentLocation)
        monuments.append(columbusMonument)
        
        let sagradaFamiliaPosition = CLLocation(latitude: 41.4036299, longitude: 2.1743558)
        let sagradaFamiliaMonument = Monument(name: "Sagrada Familia", description: "Sagrada Familia description....", position: sagradaFamiliaPosition, userLocation: currentLocation)
        monuments.append(sagradaFamiliaMonument)
        
        let arcDeTriomfPosition = CLLocation(latitude: 41.3910524, longitude: 2.1806449)
        let arcDeTriomfMonument = Monument(name: "Arc de Triomf", description: "Arc de triomf description....", position: arcDeTriomfPosition, userLocation: currentLocation)
        monuments.append(arcDeTriomfMonument)
        
        let sortedMonuments = monuments.sorted(by: { $0.distance < $1.distance })
        return sortedMonuments
    }
    
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension MonumentsInteractor {
    var presenter: MonumentsPresenter {
        return _presenter as! MonumentsPresenter
    }
}
