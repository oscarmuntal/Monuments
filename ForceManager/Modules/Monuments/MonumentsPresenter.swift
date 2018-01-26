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
import SwiftyJSON

class MonumentsPresenter: Presenter {
    
    var monuments: [Monument] = []
    var types: [String] = []
    
    //temporary method for fake initial test
    func generateMonumentsWithCurrentLocation(_ currentLocation: CLLocation) {
        monuments = interactor.generateMonuments(currentLocation)
    }
    
    func getMonuments() -> [Monument] {
        return monuments
    }
    
    func onMonumentTapped(monument: Monument, rowEdited: Int, onSuccess: @escaping ObjectClosure<EditMonumentView>) {
        router.goToEditMonument(monument: monument, rowEdited: rowEdited, types: types, onSuccess: onSuccess)
    }
    
    func saveMonument(monument: Monument, row: Int) {
        monuments[row] = monument
    }
    
    func getTypeValues() {
        
        //Hardcoded types
        self.types = ["Museum", "Square", "Shopping center", "Business office"]
        
        //Code commented due sth weird happens in the ApiManager and it doesn't fetches the type results properly from the API
        /*interactor.getTypes(successBlock: { response in
            if let response = response {
                guard let results: [JSON] = response["typesList"].array else { return }
                
                if results.count > 0 {
                    var types: [String] = []
                    for result in results{
                        types.append(result["type"].stringValue)
                    }
                    self.types = types
                }
            }
        }) { error in
            //TODO Error treatment
        }*/
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
