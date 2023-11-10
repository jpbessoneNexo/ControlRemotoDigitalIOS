//
//  Resource.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 08/11/2023.
//

import Foundation

enum Resource<T> {
    case loading(Bool)
    case success(T)
    case error(String)
}

enum CustomError: Error {
    case unknown
}

func unknownError() -> Result<Void, CustomError> {
    return .failure(.unknown)
}
