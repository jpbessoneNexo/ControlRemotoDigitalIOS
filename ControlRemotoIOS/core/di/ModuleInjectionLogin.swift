//
//  InjectionLogin.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 01/12/2023.
//

import Foundation
import Swinject

final class ModuleInjectionLogin {
    
    static let shared = ModuleInjectionLogin()
    var container : Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        
        set {
            _container = newValue
        }
    }
    
    private var _container:Container?
    
    private func buildContainer() -> Container {
        
        let container = Container()
        
        container.register(AuthenticationService.self) { _ in
            return AuthenticationService()
        }
        
        container.register(AuthenticationRepo.self) { _ in
            return AuthenticationRepo()
        }
        
        container.register(LoginViewModel.self) { _ in
            return LoginViewModel()
        }
        
        return container
    }
}

@propertyWrapper struct InjectedLogin<Dependency> {
    let wrappedValue: Dependency

    init() {
        self.wrappedValue = ModuleInjectionLogin.shared.container.resolve(Dependency.self)!
    }}
