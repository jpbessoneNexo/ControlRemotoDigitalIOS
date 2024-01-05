//
//  DeviceDTO.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

struct DeviceDTO: Codable {
    
    let id:Int
    let name:String
    let orientation:String
    let playlist:PlaylistDTO?
    let programming:ProgrammingDTO?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case orientation = "orientation"
        case playlist = "playlist"
        case programming = "programming"
    }
}

extension DeviceDTO {
    
    func toDevice() -> Device {
        return Device(id: id, name: name, orientation: getOrientationByLabel(label: orientation), playlist: playlist?.toPlaylist(), programming: programming?.toProgramming())
    }
}
