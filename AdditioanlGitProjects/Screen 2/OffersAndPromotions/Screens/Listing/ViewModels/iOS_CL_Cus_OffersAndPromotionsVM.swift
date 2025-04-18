//
//  File.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 28/11/24.
//

import Foundation
protocol OfferersAndPromotionsVM_InputProtocol{
    var output : OffersAndPromotionsVM_OutputProtocol? {get set}
    var networkService: OfferersAndPromotionsServicesVM_InputProtocol{get set}

}

protocol OffersAndPromotionsVM_OutputProtocol{
}

class iOS_CL_Cus_OffersAndPromotionsVM{
    var output: OffersAndPromotionsVM_OutputProtocol?
    var networkService: OfferersAndPromotionsServicesVM_InputProtocol
    
    init(networkService: OfferersAndPromotionsServicesVM_InputProtocol) {
        self.networkService = networkService
    }
}

extension iOS_CL_Cus_OffersAndPromotionsVM: OfferersAndPromotionsVM_InputProtocol{
}
