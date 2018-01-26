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
    func saveChanges(monument: Monument, rowEdited: Int)
}

//MARK: EditMonumentView Class
final class EditMonumentView: UserInterface {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creationLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var typeButton: UIButton!
    
    @IBAction func typeButtonAction(_ sender: Any) {
        typeButtonTapped()
    }
    
    var delegate: EditMonumentViewInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onSuccess!(self)
        setUI()
    }
}

extension EditMonumentView: UITextFieldDelegate {
    
    fileprivate func setUI() {
        title = displayData.editMonumentTitle
        setTextFieldDelegates()
        setTextFieldTexts()
        setTextFieldTags()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
        saveContent(textField)
        delegate?.saveChanges(monument: presenter.monument!, rowEdited: presenter.rowEdited!)
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

extension EditMonumentView {
    
    fileprivate func typeButtonTapped() {
        /*presenter.updateTypeValue(updateUI: { [typeValue] in
            self.typeButton.titleLabel?.text = typeValue
        }) { error in
            //TODO: use error from API
        }*/
        
        //Mostrar alert
        let alert = UIAlertController(title: displayData.typesTitle, message: displayData.typesText, preferredStyle: .actionSheet)
        
        for type in presenter.types {
            alert.addAction(UIAlertAction(title: type, style: .default, handler: { action in
                self.typeButton.titleLabel?.text = type
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func setTextFieldDelegates() {
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
    }
    
    fileprivate func setTextFieldTexts() {
        nameTextField.text = presenter.monument?.name
        creationLabel.text = presenter.monument?.creation?.getCreationDateString
        descriptionTextField.text = presenter.monument?.description
        if let latitude = presenter.monument?.position?.coordinate.latitude {
            latitudeTextField.text = "\(String(describing: latitude))"
        }
        if let longitude = presenter.monument?.position?.coordinate.longitude {
            longitudeTextField.text = "\(String(describing: longitude))"
        }
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
