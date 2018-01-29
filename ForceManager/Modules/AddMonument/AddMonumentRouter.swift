//
//  AddMonumentRouter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class AddMonumentRouter: Router {
    
    func showAddMonument(fromVC: UIViewController, types: [String]) {
        presenter.types = types
        guard let vc = self.presenter._view else { return }
        fromVC.present(vc, animated: true, completion: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension AddMonumentRouter {
    var presenter: AddMonumentPresenter {
        return _presenter as! AddMonumentPresenter
    }
}
