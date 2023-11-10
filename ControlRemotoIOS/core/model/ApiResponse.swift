//
//  ApiResponse.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 07/11/2023.
//

import Foundation

struct ApiResponse<T:Codable>:Codable {
    
    var success:Bool
    var message:String?
    var data:T?
}
