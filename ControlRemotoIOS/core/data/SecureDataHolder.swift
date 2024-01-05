//
//  SecureDataHolder.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 01/12/2023.
//

import Foundation
import SwiftKeychainWrapper

class SecureDataHolder {
    
    static let shared = SecureDataHolder()
    
    func saveAuthToken(drfToken:String){
        KeychainWrapper.standard.set(drfToken, forKey: SecureDataHolderKeys.AUTH_KEY)
    }
    
    func getAuthToken() -> String?{
        return KeychainWrapper.standard.string(forKey: SecureDataHolderKeys.AUTH_KEY)
    }
    
    func deleteAuthToken(){
        KeychainWrapper.standard.removeObject(forKey: SecureDataHolderKeys.AUTH_KEY)
    }
}
