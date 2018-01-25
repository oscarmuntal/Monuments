//
//  MonumentsView.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol MonumentsViewInterface {
}

//MARK: MonumentsView Class
final class MonumentsView: UserInterface {
}

//MARK: - Public interface
extension MonumentsView: MonumentsViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension MonumentsView {
    var presenter: MonumentsPresenter {
        return _presenter as! MonumentsPresenter
    }
    var displayData: MonumentsDisplayData {
        return _displayData as! MonumentsDisplayData
    }
}
