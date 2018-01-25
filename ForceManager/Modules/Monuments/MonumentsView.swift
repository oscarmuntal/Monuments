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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension MonumentsView {
    
    fileprivate func setUI() {
        title  = displayData.screenName
        registerCells()
        removeExtraRows()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "MonumentTableViewCell", bundle: nil), forCellReuseIdentifier: "MonumentTableViewCell")
    }
    
    private func removeExtraRows() {
        tableView.tableFooterView = UIView()
    }
    
}

extension MonumentsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayData.monumentTableViewCell, for: indexPath as IndexPath) as! MonumentTableViewCell
        
        return cell
    }
    
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
