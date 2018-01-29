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
import Toast_Swift

//MARK: - Public Interface Protocol
protocol MonumentsViewInterface {
}

//MARK: MonumentsView Class
final class MonumentsView: UserInterface {
    
    @IBOutlet weak var tableView: UITableView!
    var locationManager: CLLocationManager!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocationManager()
        presenter.getTypeValues()
        setUI()
        showCurrentLocationEvery(seconds: displayData.seconds)
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension MonumentsView {
    
    fileprivate func setUI() {
        title  = displayData.screenName
        setAddMonumentButton()
        registerCells()
        removeExtraRows()
        reloadData()
    }
    
    private func setAddMonumentButton() {
        let addMonumentButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addMonumentButtonAction))
        self.navigationItem.setRightBarButtonItems([addMonumentButton], animated: true)
    }
    
    @objc private func addMonumentButtonAction(sender: UIButton!) {
        presenter.onAddMonumentTapped(onSuccess: { addMonumentViewController in
            self.setAddMonumentDelegate(addMonumentViewController)
        })
    }
    
    private func reloadData() {
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
    
    private func showCurrentLocationEvery(seconds: Int) {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(self.showCurrentLocation), userInfo: nil, repeats: true)
    }
    
    @objc func showCurrentLocation() {
        
        if  let currentLocation = presenter.currentLocation {
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude
            self.view.makeToast("latitude: \(latitude) \nlongitude: \(longitude)")
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
        presenter.currentLocation = locations.last! as CLLocation
        presenter.generateMonumentsWithCurrentLocation()
        reloadData()
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

extension MonumentsView: AddMonumentViewInterface {
    
    func saveMonument(monument: Monument) {
        presenter.addMonument(monument: monument)
        tableView.reloadData()
    }
    
    func setAddMonumentDelegate(_ addMonumentViewController: AddMonumentView) {
        addMonumentViewController.delegate = self
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
