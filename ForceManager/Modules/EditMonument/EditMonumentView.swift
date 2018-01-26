//
//  EditMonumentView.swift
//  ForceManager
//
//  Created by Òscar Muntal on 26/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol EditMonumentViewInterface {
}

//MARK: EditMonumentView Class
final class EditMonumentView: UserInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.monument?.name
    }
}

//MARK: - Public interface
extension EditMonumentView: EditMonumentViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension EditMonumentView {
    var presenter: EditMonumentPresenter {
        return _presenter as! EditMonumentPresenter
    }
    var displayData: EditMonumentDisplayData {
        return _displayData as! EditMonumentDisplayData
    }
}
