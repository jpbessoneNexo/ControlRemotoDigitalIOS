//
//  DeviceRepo.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

struct DeviceRepo {
    @InjectedModuleDevice private var deviceService:DeviceService
    
    func getDevices(completion: @escaping (Result<[Device], Error>) -> Void){
        
        deviceService.getDevice(){ result in
            
            switch result {
            case .success(let apiResponse):
                
                guard let deviceDTOs = apiResponse.data else {
                    completion(.failure(unknownError() as! Error))
                    return
                }
                
                let devices = deviceDTOs.map { $0.toDevice() }
                
                let validDevices = devices.compactMap { $0 }
                
                completion(.success(validDevices))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

