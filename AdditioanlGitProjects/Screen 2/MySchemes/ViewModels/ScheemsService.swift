//
//  Files.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation

protocol ScheemsService_InputProtocol{
    var apiManager: ApiManagerProtocol{get set}
}

class ScheemsService{
    var apiManager: ApiManagerProtocol
    init(apiManager: ApiManagerProtocol){
        self.apiManager = apiManager
    }
}


extension ScheemsService: ScheemsService_InputProtocol{
    
    
}
