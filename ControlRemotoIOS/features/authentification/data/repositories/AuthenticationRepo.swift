//
//  AuthenticationRepo.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 07/11/2023.
//

import Foundation

struct AuthenticationRepo{
    
    @InjectedLogin private var authenticationService: AuthenticationService
    
    func login(username: String, password: String, completion: @escaping (Result<LoginData, Error>) -> Void) {
        authenticationService.login(username: username, password: password, origin: "mobile") { result in
            switch result {
            case .success(let apiResponse):
                guard let loginData = apiResponse.data?.toLoginData() else {
                    completion(.failure(unknownError() as! Error))
                    return
                }
                completion(.success(loginData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
