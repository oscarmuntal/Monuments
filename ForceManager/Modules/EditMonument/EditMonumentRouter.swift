//
//  EditMonumentRouter.swift
//  ForceManager
//
//  Created by Òscar Muntal on 26/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class EditMonumentRouter: Router {
    
    func showEditMonument(monument: Monument, fromVC: UIViewController) {
        presenter.monument = monument
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension EditMonumentRouter {
    var presenter: EditMonumentPresenter {
        return _presenter as! EditMonumentPresenter
    }
}
