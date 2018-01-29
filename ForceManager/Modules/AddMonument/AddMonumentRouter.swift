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
    
    func showAddMonument(fromVC: UIViewController, types: [String], onSuccess: @escaping ObjectClosure<AddMonumentView>) {
        presenter.types = types
        presenter.onSuccess = onSuccess
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension AddMonumentRouter {
    var presenter: AddMonumentPresenter {
        return _presenter as! AddMonumentPresenter
    }
}
