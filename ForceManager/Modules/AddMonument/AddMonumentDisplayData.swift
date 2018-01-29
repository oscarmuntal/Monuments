//
//  AddMonumentDisplayData.swift
//  ForceManager
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class AddMonumentDisplayData: DisplayData {
    
    let addMonumentTitle = "Add Monument"
    let nameTag = 0
    let descriptionTag = 1
    let latitudeTag = 2
    let longitudeTag = 3
    
    let typesTitle = "Types List"
    let typesText = "Choose a type"
    let cancelLabel = "Cancel"
    
    let defaultNamePlaceholder = "Write a monument's name (this field is mandatory)"
    let defaultDescriptionPlaceholder = "Write a monument's description (this field is optional)"
    let defaultLatitudePlaceholder = "Write a monument's latitude (this field is optional)"
    let defaultLongitudePlaceholder = "Write a monument's longitude (this field is optional)"
    
    let mandatoryNamePlaceholder = "Write a monument's name. This field is mandatory"
    let mandatoryTypesLabel = "Choose a monument's type. This field is mandatory"
}
