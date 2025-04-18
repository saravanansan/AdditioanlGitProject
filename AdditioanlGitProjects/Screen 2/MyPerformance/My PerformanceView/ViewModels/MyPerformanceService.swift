//
//  Files.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation

protocol MyPerformanceService_InputProtocol{
    var apiManager: ApiManagerProtocol{get set}
}

class MyPerformanceService{
    var apiManager: ApiManagerProtocol
    init(apiManager: ApiManagerProtocol){
        self.apiManager = apiManager
    }
}


extension MyPerformanceService: MyPerformanceService_InputProtocol {
}
