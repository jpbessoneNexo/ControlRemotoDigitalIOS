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
    
    var body: some Scene {
        
        WindowGroup {
            LoginView(viewModel: LoginViewModel(authenticationRepo: AuthenticationRepo(authenticationService: AuthenticationService())))
        }
    }
}
