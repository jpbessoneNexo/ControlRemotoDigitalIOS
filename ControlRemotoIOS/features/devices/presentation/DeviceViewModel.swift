//
//  DeviceViewModel.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//

import Foundation

class DeviceViewModel : ObservableObject {
    
    @InjectedModuleDevice private var deviceRepo:DeviceRepo
    @Published var devicesState:Resource<[Device]>? = nil
    
    func getDevices(){
        
        self.devicesState = .loading(true)
        
        deviceRepo.getDevices(){ [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let device):
                    self.devicesState = .success(device)
                case .failure(let error):
                    self.devicesState = .error("Error: \(error.localizedDescription)")
                }
            }
            
        }
    }
}
