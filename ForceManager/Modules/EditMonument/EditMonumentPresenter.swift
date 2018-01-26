//
//  EditMonumentPresenter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 26/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation
import SwiftyJSON

class EditMonumentPresenter: Presenter {
    
    var monument: Monument?
    var rowEdited: Int?
    var onSuccess: ObjectClosure<EditMonumentView>?
    var types: [String] = []
    
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
    
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension EditMonumentPresenter {
    var view: EditMonumentViewInterface {
        return _view as! EditMonumentViewInterface
    }
    var interactor: EditMonumentInteractor {
        return _interactor as! EditMonumentInteractor
    }
    var router: EditMonumentRouter {
        return _router as! EditMonumentRouter
    }
}
