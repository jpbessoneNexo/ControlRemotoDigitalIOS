//
//  ControlRemotoIOSApp.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/09/2023.
//

import SwiftUI
import ExytePopupView

@main
struct ControlRemotoIOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject var routers : Routers
    
    @State var isLoggedin: Bool = if(SecureDataHolder.shared.getAuthToken() != nil ) {
        true
    }else{
        false
    }
    
    var body: some Scene {
        WindowGroup {
            if isLoggedin {
                HomeView(isLoggedin: $isLoggedin)
                    .environmentObject(Routers())
            }else{
                LoginView(isLoggedin: $isLoggedin)
            }
        }
    }
}
