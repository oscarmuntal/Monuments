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

    func goToEditMonument(_ monument: Monument) {
        guard   let detailRouter = AppModules.EditMonument.build().router as? EditMonumentRouter,
            let vc = self.presenter._view else { return }
        
        detailRouter.showEditMonument(monument: monument, fromVC: vc)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension MonumentsRouter {
    var presenter: MonumentsPresenter {
        return _presenter as! MonumentsPresenter
    }
}
