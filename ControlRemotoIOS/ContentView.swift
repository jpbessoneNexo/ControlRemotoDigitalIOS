//
//  ContentView.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView(viewModel: LoginViewModel(authenticationRepo: AuthenticationRepo(authenticationService: AuthenticationService())))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
