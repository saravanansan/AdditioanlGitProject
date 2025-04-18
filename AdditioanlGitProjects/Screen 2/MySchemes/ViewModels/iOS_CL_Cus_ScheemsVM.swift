//
//  File.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 21/11/24.
//

import Foundation
protocol ScheemsVM_InputProtocol{
    var output : ScheemsVM_OutputProtocol? {get set}
    var networkService: ScheemsService_InputProtocol{get set}

}

protocol ScheemsVM_OutputProtocol{
}

class iOS_CL_Cus_ScheemsVM{
    var output: ScheemsVM_OutputProtocol?
    var networkService: ScheemsService_InputProtocol
    
    init(networkService: ScheemsService_InputProtocol) {
        self.networkService = networkService
    }
}

extension iOS_CL_Cus_ScheemsVM: ScheemsVM_InputProtocol{
    
}
