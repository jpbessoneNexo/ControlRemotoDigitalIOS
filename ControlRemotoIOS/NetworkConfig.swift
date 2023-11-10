//
//  NetworkConfig.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 10/11/2023.
//

import Foundation

class NetworkConfig {
    
    static let shared:NetworkConfig = NetworkConfig()
    
    var baseUrl:String?
    
    func setUpNetworkConfig(){
        
        #if DEV
        self.baseUrl = BaseUrl.DEV.rawValue
        #elseif TESTING
        self.baseUrl = BaseUrl.TESTING.rawValue
        #elseif PRODUCTION
        self.baseUrl = BaseUrl.PRODUCTION.rawValue
        #endif
    }
}


enum BaseUrl:String {
    case DEV = "https://cinexo-digital-4tednaxxcq-uc.a.run.app/"
    case TESTING = "https://testing-digital2o23-lupexdo2rq-uc.a.run.app/"
    case PRODUCTION = "https://digital.cinexo.com.ar/"
}
