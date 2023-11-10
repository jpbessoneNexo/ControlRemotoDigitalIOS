//
//  LoginViewModel.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 20/09/2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var authenticationState: Resource<LoginData>? = nil
    private var authenticationRepo: AuthenticationRepo
    
    init(authenticationRepo: AuthenticationRepo) {
        self.authenticationRepo = authenticationRepo
    }
    
    func loginUser(username: String, passwords: String) {
        self.authenticationState = .loading(true)
        
        authenticationRepo.login(username: username, password: passwords) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let loginData):
                    self.authenticationState = .success(loginData)
                case .failure(let error):
                    self.authenticationState = .error("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

