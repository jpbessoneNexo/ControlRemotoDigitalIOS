//
//  AuthenticationService.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 07/11/2023.
//

import Foundation
import Alamofire

struct AuthenticationService {
    
    func login(username: String, password: String, origin: String, completion: @escaping (Result<ApiResponse<LoginDataDTO>, Error>) -> Void) {
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "origin": origin
        ]
        
        let url = NetworkConfig.shared.baseUrl! + AuthenticationUrls.LOGIN
        print("_________________________________")
        print("API Request: \(url)")
        print("Parameters: \(parameters)")
        
        
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .validate()
            .responseDecodable(of: ApiResponse<LoginDataDTO>.self) { response in
                switch response.result {
                case .success(let apiResponse):
                    print("API Response: \(apiResponse)")
                    completion(.success(apiResponse))
                    
                case .failure(let error):
                    print("API Error: \(error)")
                    completion(.failure(error))
                }
            }
    }
}
