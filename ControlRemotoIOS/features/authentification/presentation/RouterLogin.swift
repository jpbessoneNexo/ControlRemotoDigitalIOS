//
//  RouterLogin.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/12/2023.
//

import Foundation
import SwiftUI

final class RouterLogin: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case home
        case login
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
