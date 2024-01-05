//
//  PlaylistDTO.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

struct PlaylistDTO:Codable{
    
    let id:Int
    let name:String
    let duration:Double
}

extension PlaylistDTO {
    
    func toPlaylist() -> Playlist{
        return Playlist(id: id, name: name, duration: duration)
    }
}
