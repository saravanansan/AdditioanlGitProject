//
//  File.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import Foundation
protocol MyPerformanceVM_InputProtocol{
    var output : MyPerformanceVM_OutputProtocol? {get set}
    var networkService: MyPerformanceService_InputProtocol{get set}

}

protocol MyPerformanceVM_OutputProtocol{
}

class iOS_CL_Cus_MyPerformanceVM{
    var output: MyPerformanceVM_OutputProtocol?
    var networkService: MyPerformanceService_InputProtocol
    
    init(networkService: MyPerformanceService_InputProtocol) {
        self.networkService = networkService
    }
}

extension iOS_CL_Cus_MyPerformanceVM: MyPerformanceVM_InputProtocol{
    
}
