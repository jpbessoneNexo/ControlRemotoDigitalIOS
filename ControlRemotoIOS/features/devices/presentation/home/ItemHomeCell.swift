//
//  ItemHomeCell.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 14/11/2023.
//

import Foundation
import SwiftUI

struct ItemHomeCell:View {
    
    var device:Device
    
    var body: some View{
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(device.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    
                    Text(device.orientation.label)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    ProgressView()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 10)
                    
                    DeviceOnline()
                    
                    DeviceOffline()
                    
                    DeviceNotPlaylist()
                    
                }
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct DeviceOnline: View {
    var body: some View {
        VStack {
            
            Image(systemName: "wifi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(Color("device_online"))
            
            Text("Online")
                .foregroundColor(Color("device_online"))
        }
    }
}

struct DeviceOffline: View {
    var body: some View {
        VStack {
            
            Image(systemName: "wifi.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(Color("device_offline"))
            
            Text("Offline")
                .foregroundColor(Color("device_offline"))
        }
    }
}

struct DeviceNotPlaylist: View {
    var body: some View {
        VStack {
            
            Image(systemName: "list.bullet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(Color.black)
            
            Text("Not playlist")
                .foregroundColor(.black)
        }
    }
}




struct ItemHomeCell_Preview:PreviewProvider{
    static var previews: some View{
        ItemHomeCell(device: Device(id: 1, name: "Samsung", orientation: Orientation.horizontal, playlist: Playlist(id: 1, name: "", duration: 0.0), programming:Programming(id: 1, name: "")))
    }
}
