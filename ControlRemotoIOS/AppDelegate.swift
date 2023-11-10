//
//  AppDelegate.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 10/11/2023.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        NetworkConfig.shared.setUpNetworkConfig()
        return true
    }
}
