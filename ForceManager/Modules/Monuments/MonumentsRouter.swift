//
//  MonumentsRouter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class MonumentsRouter: Router {

    func goToEditMonument(monument: Monument, rowEdited: Int, types: [String], onSuccess: @escaping ObjectClosure<EditMonumentView>) {
        guard   let detailRouter = AppModules.EditMonument.build().router as? EditMonumentRouter,
            let vc = self.presenter._view else { return }
        
        detailRouter.showEditMonument(monument: monument, rowEdited: rowEdited, fromVC: vc, types: types, onSuccess: onSuccess)
    }
    
    func goAddMonument(types: [String]) {
        guard   let detailRouter = AppModules.AddMonument.build().router as? AddMonumentRouter,
            let vc = self.presenter._view else { return }
        
        detailRouter.showAddMonument(fromVC: vc, types: types)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension MonumentsRouter {
    var presenter: MonumentsPresenter {
        return _presenter as! MonumentsPresenter
    }
}
