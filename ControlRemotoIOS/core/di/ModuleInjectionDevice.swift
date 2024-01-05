//
//  ModuleInjectionDevice.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 01/12/2023.
//

import Foundation
import Swinject

final class ModuleInjectionDevice {
    
    static let shared = ModuleInjectionDevice()
    
    var container : Container {
        
        get {
            if _container == nil{
                _container = buildContainer()
            }
            
            return _container!
        }
        
        set{
            _container = newValue
        }
      
    }
    
    private var _container:Container?
    
    private func buildContainer() -> Container {
        let container = Container()
        
        container.register(DeviceService.self) { _ in
            return DeviceService()
        }
        
        container.register(DeviceRepo.self){ _ in
            return DeviceRepo()
        }
        
        container.register(DeviceViewModel.self){ _ in
            return DeviceViewModel()
        }
        
        return container
    }
}

@propertyWrapper struct InjectedModuleDevice<Dependency> {
    
    let wrappedValue: Dependency

    init() {
        self.wrappedValue = ModuleInjectionDevice.shared.container.resolve(Dependency.self)!
    }
}
