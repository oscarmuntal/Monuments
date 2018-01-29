//
//  AddMonumentPresenter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation

class AddMonumentPresenter: Presenter {
    var monument: Monument?
    var types: [String] = []
    var onSuccess: ObjectClosure<AddMonumentView>?
    
    func setLatitude(_ latitude: String) {
        if let longitude = monument?.position?.coordinate.longitude {
            monument?.position = CLLocation(latitude: (latitude as NSString).doubleValue, longitude: longitude)
        }
    }
    
    func setLongitude(_ longitude: String) {
        if let latitude = monument?.position?.coordinate.latitude {
            monument?.position = CLLocation(latitude: latitude, longitude: (longitude as NSString).doubleValue)
        }
    }
    
    func validateMonument() -> Bool {
        if  let validMonument = self.monument,
            validMonument.name != "",
            validMonument.validType == true {
            return true
        } else { return false }
    }
    
    func isValidName() -> Bool {
        if  let validMonument = self.monument,
            validMonument.name != "" {
            return true
        } else { return false }
    }
    
    func isValidType() -> Bool {
        if  let validMonument = self.monument,
            validMonument.validType == true {
            return true
        } else { return false }
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension AddMonumentPresenter {
    var view: AddMonumentViewInterface {
        return _view as! AddMonumentViewInterface
    }
    var interactor: AddMonumentInteractor {
        return _interactor as! AddMonumentInteractor
    }
    var router: AddMonumentRouter {
        return _router as! AddMonumentRouter
    }
}
