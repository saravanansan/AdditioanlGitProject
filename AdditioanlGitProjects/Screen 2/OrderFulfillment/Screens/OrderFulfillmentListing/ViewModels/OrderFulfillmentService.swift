//
//  Files.swift
//  ClubLink_iOS
//
//  Created by SPURGE on 19/11/24.
//

import Foundation

protocol OrderFulfillmentService_InputProtocol{
    var apiManager: ApiManagerProtocol{get set}
}

class OrderFulfillmentService{
    var apiManager: ApiManagerProtocol
    init(apiManager: ApiManagerProtocol){
        self.apiManager = apiManager
    }
}


extension OrderFulfillmentService: OrderFulfillmentService_InputProtocol{
}
