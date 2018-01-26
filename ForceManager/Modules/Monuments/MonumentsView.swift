//
//  MonumentsView.swift
//  ForceManager
//
//  Created by Òscar Muntal on 25/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit
import CoreLocation

//MARK: - Public Interface Protocol
protocol MonumentsViewInterface {
}

//MARK: MonumentsView Class
final class MonumentsView: UserInterface {
    
    @IBOutlet weak var tableView: UITableView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManager()
    }
}

extension MonumentsView {
    
    fileprivate func setUI() {
        title  = displayData.screenName
        registerCells()
        removeExtraRows()
        tableView.reloadData()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: displayData.monumentTableViewCell, bundle: nil), forCellReuseIdentifier: displayData.monumentTableViewCell)
    }
    
    private func removeExtraRows() {
        tableView.tableFooterView = UIView()
    }
    
    private func initLocationManager() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
}


extension MonumentsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onMonumentTapped(monument: presenter.monuments[indexPath.row], rowEdited: indexPath.row, onSuccess: { editMonumentViewController in
            self.setEditMonumentDelegate(editMonumentViewController)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.monuments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayData.monumentTableViewCell, for: indexPath as IndexPath) as! MonumentTableViewCell
        cell.configure(monument: presenter.monuments[indexPath.row])
        return cell
    }
    
}

extension MonumentsView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        presenter.generateMonumentsWithCurrentLocation(location)   //temporary method for fake initial test
        setUI()
    }
}

extension MonumentsView: EditMonumentViewInterface {
    
    func saveChanges(monument: Monument, rowEdited: Int) {
        presenter.saveMonument(monument: monument, row: rowEdited)
        tableView.reloadData()
    }
    
    func setEditMonumentDelegate(_ editMonumentViewController: EditMonumentView) {
        editMonumentViewController.delegate = self
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
