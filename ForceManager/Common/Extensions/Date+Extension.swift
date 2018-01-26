//
//  Date+Extension.swift
//  ForceManager
//
//  Created by Òscar Muntal on 26/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation

extension Date {
    
    var getCreationDateString: String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        dateformatter.timeStyle = DateFormatter.Style.short
        return dateformatter.string(from: self)
    }
}
