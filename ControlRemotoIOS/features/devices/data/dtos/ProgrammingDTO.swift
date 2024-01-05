//
//  ProgrammingDTO.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

struct ProgrammingDTO:Codable{
    
    let id:Int
    let name:String
}

extension ProgrammingDTO {
    
    func toProgramming() -> Programming {
        return Programming(id: id, name: name)
    }
}
