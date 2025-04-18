//
//  OffersAndPromotionsService.swift
//  ClubLink_iOS
//
//  Created by Loyltwo3ks on 28/11/24.
//

import Foundation

protocol OfferersAndPromotionsServicesVM_InputProtocol{
    var apiManager: ApiManagerProtocol{get set}
}

class OffersAndPromotionsService{
    var apiManager: ApiManagerProtocol
    init(apiManager: ApiManagerProtocol){
        self.apiManager = apiManager
    }
}


extension OffersAndPromotionsService: OfferersAndPromotionsServicesVM_InputProtocol{
    
}
