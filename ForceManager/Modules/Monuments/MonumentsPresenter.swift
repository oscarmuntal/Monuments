//
//  MonumentsPresenter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation

class MonumentsPresenter: Presenter {
    
    var monuments: [Monument] = []
    
    //temporary method for fake initial test
    func generateMonumentsWithCurrentLocation(_ currentLocation: CLLocation) {
        monuments = interactor.generateMonuments(currentLocation)
    }
    
    func getMonuments() -> [Monument] {
        return monuments
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension MonumentsPresenter {
    var view: MonumentsViewInterface {
        return _view as! MonumentsViewInterface
    }
    var interactor: MonumentsInteractor {
        return _interactor as! MonumentsInteractor
    }
    var router: MonumentsRouter {
        return _router as! MonumentsRouter
    }
}
