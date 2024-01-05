//
//  DeviceService.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation
import Alamofire

struct DeviceService {
    
    func getDevice(completion: @escaping (Result<ApiResponse<[DeviceDTO]>, Error>) -> Void) {
        
        let url = NetworkConfig.shared.baseUrl! + DeviceUrls.GET_DEVICES
        print("_________________________________")
        print("API Request: \(url)")
        
        AF.request(url, method: .get) 
            .validate()
            .responseDecodable(of: ApiResponse<[DeviceDTO]>.self) { response in
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

