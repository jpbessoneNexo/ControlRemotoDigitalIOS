//
//  Route.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/12/2023.
//

import Foundation
import SwiftUI

final class Routers: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}

enum LoginDestination: Hashable {
    case home
}
