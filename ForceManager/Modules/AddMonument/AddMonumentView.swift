//
//  AddMonumentView.swift
//  ForceManager
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol AddMonumentViewInterface {
    func saveMonument(monument: Monument)
}

//MARK: AddMonumentView Class
final class AddMonumentView: UserInterface {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creationLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var typeButton: UIButton!
    
    @IBAction func typeButtonAction(_ sender: Any) {
        typeButtonTapped()
    }
    
    @IBAction func saveMonumentAction(_ sender: Any) {
        saveMonumentTapped()
    }
    
    var delegate: AddMonumentViewInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onSuccess!(self)
        setUI()
    }

}


extension AddMonumentView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
        saveContent(textField)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
}

extension AddMonumentView {
    
    fileprivate func setUI() {
        setTitle()
        setCancelButton()
        setNewEmptyMonument()
        setTextFieldDelegates()
        setPlaceholders()
        setTextFieldTags()
    }
    
    private func setTitle() {
        title = displayData.addMonumentTitle
    }
    
    private func setCancelButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:  #selector(cancelAction))
        self.navigationItem.setLeftBarButton(cancelButton, animated: true)
    }
    
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setNewEmptyMonument() {
        presenter.monument = Monument()
    }
    
    fileprivate func typeButtonTapped() {
        let alert = UIAlertController(title: displayData.typesTitle,
                                      message: displayData.typesText,
                                      preferredStyle: .actionSheet)
        
        for type in presenter.types {
            alert.addAction(UIAlertAction(title: type, style: .default, handler: { action in
                self.typeButton.setTitle(type, for: .normal)
                self.presenter.monument?.type = type
                self.presenter.monument?.validType = true
                self.typeButton.tintColor = UIColor.blue
            }))
        }
        alert.addAction(UIAlertAction(title: displayData.cancelLabel, style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func setTextFieldDelegates() {
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
    }
    
    fileprivate func setPlaceholders() {
        self.nameTextField.placeholder = displayData.defaultNamePlaceholder
        self.descriptionTextField.placeholder = displayData.defaultDescriptionPlaceholder
        self.latitudeTextField.placeholder = displayData.defaultLatitudePlaceholder
        self.longitudeTextField.placeholder = displayData.defaultLongitudePlaceholder
    }
    
    fileprivate func setTextFieldTags() {
        nameTextField.tag = displayData.nameTag
        descriptionTextField.tag = displayData.descriptionTag
        latitudeTextField.tag = displayData.latitudeTag
        longitudeTextField.tag = displayData.longitudeTag
    }
    
    fileprivate func saveContent(_ textField: UITextField) {
        
        switch textField.tag {
        case displayData.nameTag:
            presenter.monument?.name = textField.text ?? ""
        case displayData.descriptionTag:
            presenter.monument?.description = textField.text ?? ""
        case displayData.latitudeTag:
            if let latitude = textField.text, latitude != "" {
                presenter.setLatitude(latitude)
            }
        case displayData.longitudeTag:
            if let longitude = textField.text, longitude != "" {
                presenter.setLongitude(longitude)
            }
        default:
            presenter.monument?.name = textField.text ?? ""
        }
    }
    
    fileprivate func saveMonumentTapped() {
        if  presenter.validateMonument(),
            let monument = presenter.monument{
            delegate?.saveMonument(monument: monument)
            navigationController?.popViewController(animated: true)
        } else {
            showMandatoryFields()
        }
    }
    
    private func showMandatoryFields() {
        if !presenter.isValidName() {
            self.nameTextField.attributedPlaceholder = NSAttributedString(string: displayData.mandatoryNamePlaceholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
        }
        
        if !presenter.isValidType() {
            typeButton.setTitle(displayData.mandatoryTypesLabel, for: .normal)
            self.typeButton.tintColor = UIColor.red
        }
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension AddMonumentView {
    var presenter: AddMonumentPresenter {
        return _presenter as! AddMonumentPresenter
    }
    var displayData: AddMonumentDisplayData {
        return _displayData as! AddMonumentDisplayData
    }
}
