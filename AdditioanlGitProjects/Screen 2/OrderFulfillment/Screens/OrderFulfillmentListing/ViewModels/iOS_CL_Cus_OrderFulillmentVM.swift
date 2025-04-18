//
//  File.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import Foundation
protocol OrderFulillmentVM_InputProtocol{
    var output : OrderFulillmentVM_OutputProtocol? {get set}
    var networkService: OrderFulfillmentService_InputProtocol{get set}

}

protocol OrderFulillmentVM_OutputProtocol{
}

class iOS_CL_Cus_OrderFulillmentVM{
    var output: OrderFulillmentVM_OutputProtocol?
    var networkService: OrderFulfillmentService_InputProtocol
    
    init(networkService: OrderFulfillmentService_InputProtocol) {
        self.networkService = networkService
    }
}

extension iOS_CL_Cus_OrderFulillmentVM: OrderFulillmentVM_InputProtocol{
    
}
