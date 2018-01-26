//
//  ApiManager.swift
//  ForceManager
//
//  Created by Òscar Muntal on 26/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager {
    
    static let sharedInstance = ApiManager()
    var apiManager: SessionManager?
    let session = URLSession.shared
    
    init() {
        apiManager = SessionManager.default
    }

    let baseURL = "http://forcemanager0001.s3.amazonaws.com/"
    let typesEndpoint = "BackupBD/type.json"
    
    func get(path: String, successBlock: @escaping RequestSuccessBlock, errorBlock: @escaping RequestErrorBlock) {
        
        apiManager?.request(path, method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:]).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successBlock(json)
            case .failure(let error):
                guard let err = error as? APIError else { break }
                errorBlock(err)
                break
            }
        })
    }
}
