//
//  ContentView.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var routers : Routers
    
    var body: some View {
        
        NavigationStack(path: $routers.navPath){
            
            if SecureDataHolder.shared.getAuthToken() != nil {
            
            }else{
//                LoginView()
//                    .navigationDestination(for: LoginDestination.self) { router in
//                        switch router {
//                        case .home:
//                            HomeView()
//                        }
//                    }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
